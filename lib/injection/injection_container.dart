import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mainframe_app/core/client/api_client.dart';
import 'package:mainframe_app/core/client/api_service.dart';
import 'package:mainframe_app/features/gallery/data/datasource/remote/gallery_datasource_remote.dart';
import 'package:mainframe_app/features/gallery/data/repo/gallery_repo_impl.dart';
import 'package:mainframe_app/features/gallery/data/usecases/get_images_usecase.dart';
import 'package:mainframe_app/features/gallery/domain/repo/gallery_repo.dart';
import 'package:mainframe_app/features/gallery/presentation/logic/cubits/GalleryCubit/gallery_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<Dio>(() => ApiClient.createDio());

  // 2. Retrofit API service — singleton, all HTTP declarations in one place
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  await _galleryDependencies();
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

  sl.registerFactory<GalleryCubit>(() => GalleryCubit(sl<GetImagesUsecase>()));
}

// Future<void> _authDependencies() async {
//   // 3. Remote datasource
//   sl.registerLazySingleton<GalleryDatasourceRemote>(
//     () => GalleryDatasourceRemoteImpl(api: sl<ApiService>()),
//   );

//   // 4. Repository
//   sl.registerLazySingleton<AuthRepo>(
//     () => AuthRepoImpl(remoteDataSource: sl<GalleryDatasourceRemote>()),
//   );

//   // 5. Usecases
//   sl.registerLazySingleton<EmailLoginUsecase>(
//     () => EmailLoginUsecase(repository: sl<AuthRepo>()),
//   );
//   sl.registerLazySingleton<EmailSignupUsecase>(
//     () => EmailSignupUsecase(repository: sl<AuthRepo>()),
//   );
//   sl.registerLazySingleton<SignOutUsecase>(
//     () => SignOutUsecase(repository: sl<AuthRepo>()),
//   );
//   sl.registerLazySingleton<BootstrapUsecase>(
//     () => BootstrapUsecase(repository: sl<AuthRepo>()),
//   );

//   sl.registerFactory<LoginCubit>(
//     () => LoginCubit(sl<EmailLoginUsecase>(), sl<BootstrapUsecase>()),
//   );
//   sl.registerFactory<SignupPageCubit>(
//     () => SignupPageCubit(sl<EmailSignupUsecase>(), sl<BootstrapUsecase>()),
//   );
//   sl.registerFactory<AccountCubit>(
//     () => AccountCubit(
//       signOutUsecase: sl<SignOutUsecase>(),
//       getSignedUrlUsecase: sl<GetSignedUrlUsecase>(),
//       patchProfileUsecase: sl<PatchProfileUsecase>(),
//       followBloc: sl<FollowBloc>(),
//     ),
//   );
// }
