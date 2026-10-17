// import 'package:json_annotation/json_annotation.dart';
// import 'package:theo/features/auth/domain/entities/bootstrap_entity.dart';

// part 'bootstrap_response_model.g.dart';

// /// Data model for the `data` object inside the bootstrap response envelope.
// /// Mirrors the server JSON exactly — used only in the data layer.
// /// Run `dart run build_runner build` to generate the `.g.dart` file.
// @JsonSerializable()
// class BootstrapResponseModel {
//   final bool authenticated;
//   final BootstrapUserModel user;

//   const BootstrapResponseModel({
//     required this.authenticated,
//     required this.user,
//   });

//   factory BootstrapResponseModel.fromJson(Map<String, dynamic> json) =>
//       _$BootstrapResponseModelFromJson(json);

//   Map<String, dynamic> toJson() => _$BootstrapResponseModelToJson(this);

//   /// Maps this composite model to the flat [BootstrapEntity] used by the
//   /// domain and presentation layers.
//   BootstrapEntity toEntity() => BootstrapEntity(
//     authenticated: authenticated,
//     userId: user.id,
//     username: user.username,
//     displayName: user.displayName,
//     onboarded: user.onboarded,
//     inviteVerified: user.inviteVerified,
//     createdAt: user.createdAt,
//   );

//   BootstrapResponseModel copyWith({
//     bool? authenticated,
//     BootstrapUserModel? user,
//   }) => BootstrapResponseModel(
//     authenticated: authenticated ?? this.authenticated,
//     user: user ?? this.user,
//   );
// }

// @JsonSerializable()
// class BootstrapUserModel {
//   final String id;
//   final String? username;
//   final String? displayName;
//   final bool onboarded;
//   final bool inviteVerified;
//   final DateTime createdAt;

//   const BootstrapUserModel({
//     required this.id,
//     this.username,
//     this.displayName,
//     required this.onboarded,
//     required this.inviteVerified,
//     required this.createdAt,
//   });

//   factory BootstrapUserModel.fromJson(Map<String, dynamic> json) =>
//       _$BootstrapUserModelFromJson(json);

//   Map<String, dynamic> toJson() => _$BootstrapUserModelToJson(this);

//   /// Reconstructs a [BootstrapUserModel] from the flat [BootstrapEntity].
//   /// Note: [BootstrapEntity.authenticated] is not stored on this sub-model.
//   factory BootstrapUserModel.fromEntity(BootstrapEntity entity) =>
//       BootstrapUserModel(
//         id: entity.userId,
//         username: entity.username,
//         displayName: entity.displayName,
//         onboarded: entity.onboarded,
//         inviteVerified: entity.inviteVerified,
//         createdAt: entity.createdAt,
//       );

//   BootstrapUserModel copyWith({
//     String? id,
//     String? username,
//     String? displayName,
//     bool? onboarded,
//     bool? inviteVerified,
//     DateTime? createdAt,
//   }) => BootstrapUserModel(
//     id: id ?? this.id,
//     username: username ?? this.username,
//     displayName: displayName ?? this.displayName,
//     onboarded: onboarded ?? this.onboarded,
//     inviteVerified: inviteVerified ?? this.inviteVerified,
//     createdAt: createdAt ?? this.createdAt,
//   );
// }
