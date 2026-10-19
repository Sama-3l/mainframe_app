import 'package:mainframe_app/core/client/api_response.dart';
import 'package:mainframe_app/core/client/api_service.dart';
import 'package:mainframe_app/core/utils/functions/datasource_method.dart';
import 'package:mainframe_app/features/gallery/domain/models/gallery_model.dart';
import 'package:mainframe_app/features/upload/domain/models/delete_media_response_model.dart';

abstract class GalleryDatasourceRemote {
  Future<ApiResponse<List<GalleryModel>>> getImages(int page, int limit);
  Future<ApiResponse<DeleteMediaResponseModel>> deleteMedia(String mediaId);
}

class GalleryDatasourceRemoteImpl implements GalleryDatasourceRemote {
  final ApiService _api;

  GalleryDatasourceRemoteImpl({required this._api});
  // _supabase = supabase ?? Supabase.instance.client;

  @override
  Future<ApiResponse<List<GalleryModel>>> getImages(page, limit) =>
      genericDataSourceMethod(method: () => _api.getImages(page, limit));

  @override
  Future<ApiResponse<DeleteMediaResponseModel>> deleteMedia(String mediaId) =>
      genericDataSourceMethod(method: () => _api.deleteImage(mediaId));
}
