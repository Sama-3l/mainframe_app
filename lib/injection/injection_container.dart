import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mainframe_app/core/client/api_client.dart';
import 'package:mainframe_app/core/client/api_service.dart';
import 'package:mainframe_app/core/config/api_config.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';
import 'package:mainframe_app/features/gallery/data/datasource/remote/gallery_datasource_remote.dart';
import 'package:mainframe_app/features/gallery/data/repo/gallery_repo_impl.dart';
import 'package:mainframe_app/features/gallery/data/usecases/delete_media_usecase.dart';
import 'package:mainframe_app/features/gallery/data/usecases/get_images_usecase.dart';
import 'package:mainframe_app/features/gallery/domain/repo/gallery_repo.dart';
import 'package:mainframe_app/features/gallery/presentation/logic/cubits/GalleryCubit/gallery_cubit.dart';
import 'package:mainframe_app/features/gallery/presentation/logic/cubits/ImagePreviewCubit/image_preview_cubit.dart';
import 'package:mainframe_app/features/pair/data/datasource/remote/pair_remote_datasource.dart';
import 'package:mainframe_app/features/pair/data/datasource/usecases/pair_usecase.dart';
import 'package:mainframe_app/features/pair/data/repo/pair_repo_impl.dart';
import 'package:mainframe_app/features/pair/domain/repo/pair_repo.dart';
import 'package:mainframe_app/features/pair/presentation/logic/PairScreenCubit/pair_screen_cubit.dart';
import 'package:mainframe_app/features/splash/presentation/logic/cubits/SplashScreenCubit/splash_screen_cubit.dart';
import 'package:mainframe_app/features/upload/data/datasource/remote/upload_datasource_remote.dart';
import 'package:mainframe_app/features/upload/data/repo/upload_media_repo_impl.dart';
import 'package:mainframe_app/features/upload/data/usecase/upload_media_usecase.dart';
import 'package:mainframe_app/features/upload/domain/repo/upload_media_repo.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<ApiConfig>(() => ApiConfig());
  sl.registerLazySingleton<SecureStorageService>(() => SecureStorageService());
  sl.registerLazySingleton<Dio>(
    () => ApiClient.createDio(sl<SecureStorageService>()),
  );

  // 2. Retrofit API service — singleton, all HTTP declarations in one place
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  await _galleryDependencies();
  await _uploadDependencies();
  await _pairDependencies();
  await _authDependencies();
}

Future<void> _galleryDependencies() async {
  sl.registerLazySingleton<GalleryDatasourceRemote>(
    () => GalleryDatasourceRemoteImpl(api: sl<ApiService>()),
  );

  // 4. Repository
  sl.registerLazySingleton<GalleryRepo>(
    () => GalleryRepoImpl(sl<GalleryDatasourceRemote>()),
  );

  // 5. Usecases
  sl.registerLazySingleton<GetImagesUsecase>(
    () => GetImagesUsecase(sl<GalleryRepo>()),
  );

  sl.registerLazySingleton<DeleteMediaUsecase>(
    () => DeleteMediaUsecase(sl<GalleryRepo>()),
  );

  sl.registerFactory<GalleryCubit>(
    () => GalleryCubit(
      sl<SecureStorageService>(),
      sl<GetImagesUsecase>(),
      sl<UploadMediaUsecase>(),
    ),
  );

  sl.registerFactory<ImagePreviewCubit>(
    () => ImagePreviewCubit(sl<DeleteMediaUsecase>(), index: 0),
  );
}

Future<void> _uploadDependencies() async {
  sl.registerLazySingleton<UploadDatasourceRemote>(
    () => UploadDatasourceRemoteImpl(api: sl<ApiService>()),
  );

  // 4. Repository
  sl.registerLazySingleton<UploadMediaRepo>(
    () => UploadMediaRepoImpl(remoteDataSource: sl<UploadDatasourceRemote>()),
  );

  // 5. Usecases
  sl.registerLazySingleton<UploadMediaUsecase>(
    () => UploadMediaUsecase(repository: sl<UploadMediaRepo>()),
  );
}

Future<void> _pairDependencies() async {
  sl.registerLazySingleton<PairRemoteDatasource>(
    () => PairRemoteDatasourceImpl(apiService: sl<ApiService>()),
  );

  // 4. Repository
  sl.registerLazySingleton<PairRepo>(
    () => PairRepoImpl(sl<PairRemoteDatasource>()),
  );

  // 5. Usecases
  sl.registerLazySingleton<PairUsecase>(() => PairUsecase(sl<PairRepo>()));
}

Future<void> _authDependencies() async {
  sl.registerFactory<SplashScreenCubit>(
    () => SplashScreenCubit(secureStorage: sl<SecureStorageService>()),
  );
  sl.registerFactory<PairScreenCubit>(
    () => PairScreenCubit(sl<SecureStorageService>(), sl<PairUsecase>()),
  );
}
