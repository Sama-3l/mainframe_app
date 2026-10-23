class PairResponseEntity {
  final String deviceId;
  // deviceId.secret ----- (token)
  final String deviceToken;
  PairResponseEntity({required this.deviceId, required this.deviceToken});
}
