class PairUsecaseEntity {
  final String pairingToken;
  final String name;
  final String? platform;

  PairUsecaseEntity({
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

  factory PairUsecaseEntity.fromJson(Map<String, dynamic> map) {
    return PairUsecaseEntity(
      pairingToken: map['pairingToken'] as String,
      name: map['name'] as String,
      platform: map['platform'] as String?,
    );
  }
}
