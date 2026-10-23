import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/features/pair/presentation/logic/PairScreenCubit/pair_screen_cubit.dart';
import 'package:mainframe_app/injection/injection_container.dart';
import 'package:mainframe_app/router/app_route_constants.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class PairScreen extends StatefulWidget {
  const PairScreen({super.key});

  @override
  State<PairScreen> createState() => _PairScreenState();
}

class _PairScreenState extends State<PairScreen> {
  final MobileScannerController _mobileScannerController =
      MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        detectionTimeoutMs: 1000,
      );

  void _handleBarcode(BuildContext context, BarcodeCapture barcodes) {
    if (!mounted) return;

    context.read<PairScreenCubit>().pair(barcodes, _mobileScannerController);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PairScreenCubit>(),
      child: BlocListener<PairScreenCubit, PairScreenState>(
        listener: (context, state) {
          if (state is PairScreenSuccess) {
            GoRouter.of(context).pushReplacement(Routes.mainAppScreen);
          } else if (state is PairScreenError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorsConstants.background,
                content: Text(
                  "Failed to write URL",
                  style: TextStyles.titleMedium.copyWith(
                    color: ColorsConstants.background,
                  ),
                ),
              ),
            );
          }
        },
        child: BlocBuilder<PairScreenCubit, PairScreenState>(
          builder: (context, state) {
            // final cubit = context.read<PairScreenCubit>();

            return Scaffold(
              backgroundColor: ColorsConstants.onBackground,
              body: Center(
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: _mobileScannerController,

                      onDetect: (barcodes) => _handleBarcode(context, barcodes),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
