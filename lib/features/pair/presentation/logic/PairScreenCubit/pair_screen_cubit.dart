import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:mainframe_app/core/config/api_config.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';
import 'package:mainframe_app/features/pair/data/datasource/entities/pair_usecase_entity.dart';
import 'package:mainframe_app/features/pair/data/datasource/usecases/pair_usecase.dart';
import 'package:mainframe_app/features/pair/domain/entities/pairing_data_entity.dart';
import 'package:mainframe_app/features/pair/domain/models/pairing_data_model.dart';
import 'package:mainframe_app/injection/injection_container.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'pair_screen_state.dart';

class PairScreenCubit extends Cubit<PairScreenState> {
  final SecureStorageService secureStorageService;
  final PairUsecase _pairUsecase;

  PairScreenCubit(this.secureStorageService, this._pairUsecase)
    : super(PairScreenInitial());

  Future<void> verifyPair(String normalized, PairingDataEntity entity) async {
    final info = DeviceInfoPlugin();
    String name = "Device";
    String? platform;

    if (Platform.isAndroid) {
      final a = await info.androidInfo;
      name = '${a.manufacturer} ${a.model}';
      platform = 'android';
    }
    if (Platform.isIOS) {
      final i = await info.iosInfo;
      name = i.name;
      platform = 'ios';
    }

    try {
      final res = await _pairUsecase(
        PairUsecaseEntity(
          pairingToken: entity.token,
          name: name,
          platform: platform,
        ),
      );

      await res.fold(
        (_) {
          emit(PairScreenError());
        },
        (res) async {
          print(res);
          await sl<SecureStorageService>().write(
            AppConstants.deviceToken,
            res.deviceToken,
          );
          sl<ApiConfig>().baseUrl = normalized;
          emit(PairScreenSuccess());
        },
      );
    } catch (_) {
      // show error: couldn't reach backend
      emit(PairScreenError());
      return;
    }
  }

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

      await sl<SecureStorageService>().write(AppConstants.apiURL, normalized);
      await sl<SecureStorageService>().write(
        AppConstants.serverId,
        entity.serverId,
      );
      verifyPair(normalized, entity);
    } catch (e) {
      // Invalid QR (not JSON, wrong format, etc.): allow scanning again
      debugPrint('Invalid barcode: $e');
      emit(PairScreenError());
    }
  }
}
