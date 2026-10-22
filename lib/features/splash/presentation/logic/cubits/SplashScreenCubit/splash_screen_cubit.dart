import 'package:bloc/bloc.dart';
import 'package:mainframe_app/core/config/api_config.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';
import 'package:mainframe_app/injection/injection_container.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  final SecureStorageService secureStorage;

  SplashScreenCubit({required this.secureStorage})
    : super(SplashScreenInitial());

  Future<void> initialize() async {
    final url = await secureStorage.read(AppConstants.apiURL);
    if (url != null && url.isNotEmpty) {
      sl<ApiConfig>().baseUrl = url;
      emit(SplashScreenSuccess());
    } else {
      emit(SplashScreenError());
    }
  }
}
