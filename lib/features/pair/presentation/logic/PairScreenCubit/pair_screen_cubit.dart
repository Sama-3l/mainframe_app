import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mainframe_app/core/config/api_config.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';
import 'package:mainframe_app/features/pair/domain/models/pairing_data_model.dart';
import 'package:mainframe_app/injection/injection_container.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'pair_screen_state.dart';

class PairScreenCubit extends Cubit<PairScreenState> {
  final SecureStorageService secureStorageService;

  PairScreenCubit(this.secureStorageService) : super(PairScreenInitial());

  Future<void> pair(
    BarcodeCapture barcodes,
    MobileScannerController controller,
  ) async {
    final barcode = barcodes.barcodes.firstOrNull;
    final text = barcode?.rawValue;
    if (text == null) return;

    try {
      final json = jsonDecode(text) as Map<String, dynamic>;
      final entity = PairingDataModel.fromJson(json).toEntity();

      controller.stop();
      final uri = Uri.tryParse(entity.url.trim());
      if (uri == null || uri.scheme != 'https' || uri.host.isEmpty) {
        emit(PairScreenError());
        return;
      }

      final normalized = uri.toString().replaceAll(RegExp(r'/+$'), '');

      try {
        final res = await Dio().get(
          '$normalized/health',
          options: Options(receiveTimeout: const Duration(seconds: 8)),
        );
        if (res.statusCode != 200) throw Exception('Bad status');
      } catch (_) {
        // show error: couldn't reach backend
        emit(PairScreenError());
        return;
      }

      await sl<SecureStorageService>().write(AppConstants.apiURL, normalized);
      sl<ApiConfig>().baseUrl = normalized;
      emit(PairScreenSuccess());
    } catch (e) {
      // Invalid QR (not JSON, wrong format, etc.): allow scanning again
      debugPrint('Invalid barcode: $e');
      emit(PairScreenError());
    }
  }
}
