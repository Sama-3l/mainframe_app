class PairRequestModel {
  final String pairingToken;
  final String name;
  final String? platform;

  PairRequestModel({
    required this.pairingToken,
    required this.name,
    this.platform,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pairingToken': pairingToken,
      'name': name,
      'platform': platform,
    };
  }

  factory PairRequestModel.fromJson(Map<String, dynamic> map) {
    return PairRequestModel(
      pairingToken: map['pairingToken'] as String,
      name: map['name'] as String,
      platform: map['platform'] as String?,
    );
  }
}
