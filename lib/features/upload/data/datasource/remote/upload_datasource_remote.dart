import 'package:dio/dio.dart';
import 'package:mainframe_app/core/client/api_response.dart';
import 'package:mainframe_app/core/client/api_service.dart';
import 'package:mainframe_app/core/utils/functions/datasource_method.dart';
import 'package:mainframe_app/features/upload/domain/models/upload_media_response_model.dart';

abstract class UploadDatasourceRemote {
  Future<ApiResponse<List<UploadMediaElementModel>>> upload(FormData body);
}

// // ─── Implementation ──────────────────────────────────────────────────────────

class UploadDatasourceRemoteImpl implements UploadDatasourceRemote {
  final ApiService _api;

  UploadDatasourceRemoteImpl({required this._api});
  // _supabase = supabase ?? Supabase.instance.client;

  @override
  Future<ApiResponse<List<UploadMediaElementModel>>> upload(body) =>
      genericDataSourceMethod(method: () => _api.uploadData(body));
}
