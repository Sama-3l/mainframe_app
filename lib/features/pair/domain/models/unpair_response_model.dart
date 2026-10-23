import 'package:mainframe_app/features/pair/domain/entities/unpair_response_entity.dart';

class UnpairResponseModel {
  final bool res;

  UnpairResponseModel({required this.res});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'res': res};
  }

  factory UnpairResponseModel.fromJson(Map<String, dynamic> map) {
    return UnpairResponseModel(res: map['res'] as bool);
  }

  UnpairResponseEntity toEntity() {
    return UnpairResponseEntity(res: res);
  }

  factory UnpairResponseModel.fromEntity(UnpairResponseEntity entity) {
    return UnpairResponseModel(res: entity.res);
  }
}
