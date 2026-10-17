import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mainframe_app/core/client/api_client.dart';
import 'package:mainframe_app/core/client/api_service.dart';
import 'package:mainframe_app/features/gallery/data/datasource/remote/gallery_datasource_remote.dart';
import 'package:mainframe_app/features/gallery/data/repo/gallery_repo_impl.dart';
import 'package:mainframe_app/features/gallery/data/usecases/get_images_usecase.dart';
import 'package:mainframe_app/features/gallery/domain/repo/gallery_repo.dart';
import 'package:mainframe_app/features/gallery/presentation/logic/cubits/GalleryCubit/gallery_cubit.dart';
import 'package:mainframe_app/features/upload/data/datasource/remote/upload_datasource_remote.dart';
import 'package:mainframe_app/features/upload/data/repo/upload_media_repo_impl.dart';
import 'package:mainframe_app/features/upload/data/usecase/upload_media_usecase.dart';
import 'package:mainframe_app/features/upload/domain/repo/upload_media_repo.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<Dio>(() => ApiClient.createDio());

  // 2. Retrofit API service — singleton, all HTTP declarations in one place
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  await _galleryDependencies();
  await _uploadDependencies();
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

  sl.registerFactory<GalleryCubit>(
    () => GalleryCubit(sl<GetImagesUsecase>(), sl<UploadMediaUsecase>()),
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
