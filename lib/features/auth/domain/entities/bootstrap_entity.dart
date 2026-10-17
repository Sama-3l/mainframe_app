/// Pure domain entity — no JSON, no Flutter, no external dependencies.
/// Used in the domain and presentation layers only.
class BootstrapEntity {
  final bool authenticated;
  final String userId;
  final String? username;
  final String? displayName;
  final bool onboarded;
  final bool inviteVerified;
  final DateTime createdAt;

  const BootstrapEntity({
    required this.authenticated,
    required this.userId,
    this.username,
    this.displayName,
    required this.onboarded,
    required this.inviteVerified,
    required this.createdAt,
  });

  BootstrapEntity copyWith({
    bool? authenticated,
    String? userId,
    String? username,
    String? displayName,
    bool? onboarded,
    bool? inviteVerified,
    DateTime? createdAt,
  }) => BootstrapEntity(
    authenticated: authenticated ?? this.authenticated,
    userId: userId ?? this.userId,
    username: username ?? this.username,
    displayName: displayName ?? this.displayName,
    onboarded: onboarded ?? this.onboarded,
    inviteVerified: inviteVerified ?? this.inviteVerified,
    createdAt: createdAt ?? this.createdAt,
  );
}
