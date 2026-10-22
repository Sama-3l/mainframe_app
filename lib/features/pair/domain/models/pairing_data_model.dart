import 'package:mainframe_app/features/pair/domain/entities/pairing_data_entity.dart';

class PairingDataModel {
  final String url;
  final String token;
  final String serverId;

  PairingDataModel({
    required this.url,
    required this.token,
    required this.serverId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'url': url, 'token': token, 'serverId': serverId};
  }

  factory PairingDataModel.fromJson(Map<String, dynamic> map) {
    return PairingDataModel(
      url: map['url'] as String,
      token: map['token'] as String,
      serverId: map['serverId'] as String,
    );
  }

  PairingDataEntity toEntity() {
    return PairingDataEntity(url: url, token: token, serverId: serverId);
  }

  factory PairingDataModel.fromEntity(PairingDataEntity entity) {
    return PairingDataModel(
      url: entity.url,
      token: entity.token,
      serverId: entity.serverId,
    );
  }
}
