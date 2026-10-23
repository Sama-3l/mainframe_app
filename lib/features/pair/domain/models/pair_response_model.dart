import 'package:json_annotation/json_annotation.dart';
import 'package:mainframe_app/features/pair/domain/entities/pair_response_entity.dart';

part 'pair_response_model.g.dart';

@JsonSerializable()
class PairResponseModel {
  final String deviceId;
  // deviceId.secret ----- (token)
  final String deviceToken;
  PairResponseModel({required this.deviceId, required this.deviceToken});

  PairResponseEntity toEntity() {
    return PairResponseEntity(deviceId: deviceId, deviceToken: deviceToken);
  }

  factory PairResponseModel.fromEntity(PairResponseEntity entity) {
    return PairResponseModel(
      deviceId: entity.deviceId,
      deviceToken: entity.deviceToken,
    );
  }

  factory PairResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PairResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PairResponseModelToJson(this);
}
