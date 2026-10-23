import 'package:mainframe_app/core/client/api_response.dart';
import 'package:mainframe_app/core/client/api_service.dart';
import 'package:mainframe_app/core/utils/functions/datasource_method.dart';
import 'package:mainframe_app/features/pair/domain/models/pair_response_model.dart';

abstract class PairRemoteDatasource {
  Future<ApiResponse<PairResponseModel>> pair(Map<String, dynamic> body);
}

class PairRemoteDatasourceImpl extends PairRemoteDatasource {
  final ApiService _apiService;

  PairRemoteDatasourceImpl({required this._apiService});

  @override
  Future<ApiResponse<PairResponseModel>> pair(Map<String, dynamic> body) =>
      genericDataSourceMethod(method: () => _apiService.pair(body));
}
