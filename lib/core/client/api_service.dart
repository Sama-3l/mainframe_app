import 'package:dio/dio.dart';
import 'package:mainframe_app/core/client/api_response.dart';
import 'package:mainframe_app/core/constants/api_endpoints.dart';
import 'package:mainframe_app/features/gallery/domain/models/gallery_model.dart';
import 'package:mainframe_app/features/pair/domain/models/pair_response_model.dart';
import 'package:mainframe_app/features/upload/domain/models/delete_media_response_model.dart';
import 'package:mainframe_app/features/upload/domain/models/upload_media_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

/// dart run build_runner build --delete-conflicting-outputs

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  // /// POST /auth/bootstrap
  @POST(ApiEndpoints.upload)
  Future<ApiResponse<List<UploadMediaElementModel>>> uploadData(
    @Body() FormData body,
  );

  @GET(ApiEndpoints.images)
  Future<ApiResponse<List<GalleryModel>>> getImages(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @DELETE("${ApiEndpoints.images}/{mediaId}")
  Future<ApiResponse<DeleteMediaResponseModel>> deleteImage(
    @Path('mediaId') String mediaId,
  );

  @POST(ApiEndpoints.pair)
  Future<ApiResponse<PairResponseModel>> pair(
    @Body() Map<String, dynamic> body,
  );
  // // ── Invites ───────────────────────────────────────────────────────

  // /// GET /invites/verify?code=<code> — pre-signup validity check, no auth.

  // /// POST /invites/verify — authenticated invite verification.
  // @POST(ApiEndpoints.verifyInvite)
  // Future<ApiResponse<InviteVerifyModel>> verifyInvitePost(
  //   @Body() Map<String, dynamic> body,
  // );

  // @POST(ApiEndpoints.createInvite)
  // Future<ApiResponse<GenerateInviteCodeModel>> generateInvite(
  //   @Body() Map<String, dynamic> body,
  // );

  // // ── Users ─────────────────────────────────────────────────────────

  // /// GET /users/me — returns the full private context for the authenticated,
  // /// onboarded user. Requires a Bootstrapped JWT.
  // @GET(ApiEndpoints.me)
  // Future<ApiResponse<UserMeModel>> getMe();

  // /// GET /users/:userId — returns a user's public profile.
  // @GET('/users/{userId}')
  // Future<ApiResponse<UserProfileDetailsModel>> getUserProfile(
  //   @Path('userId') String userId,
  // );

  // /// GET /users/search?q=:query&page=:page&limit=:limit
  // @GET(ApiEndpoints.searchUsers)
  // Future<ApiResponse<List<SearchUserModel>>> searchUsers(
  //   @Query('q') String query,
  //   @Query('page') int page,
  //   @Query('limit') int limit,
  // );

  // /// PATCH /users/profile — update the authenticated user's public profile.
  // /// Send only the fields you want to change.
  // @PATCH(ApiEndpoints.patchProfile)
  // Future<ApiResponse<UserProfileDetailsModel>> patchProfile(
  //   @Body() Map<String, dynamic> body,
  // );

  // /// GET /users/username/available?username=<username>
  // /// success:true + data.available:true  → username is free
  // /// success:true + data.available:false → username is taken
  // @GET(ApiEndpoints.checkUsername)
  // Future<ApiResponse<CheckUsernameModel>> checkUsername(
  //   @Query('username') String username,
  // );

  // @POST(ApiEndpoints.uploadUrl)
  // Future<ApiResponse<List<GetSignedUrlModel>>> getUploadUrl(
  //   @Body() Map<String, dynamic> body,
  // );

  // @POST(ApiEndpoints.onboarding)
  // Future<ApiResponse<UserMeModel>> onboarding(
  //   @Body() Map<String, dynamic> body,
  // );

  // @POST(ApiEndpoints.createPosts)
  // Future<ApiResponse<CreatePostModel>> createPost(
  //   @Body() Map<String, dynamic> body,
  // );

  // @GET(ApiEndpoints.getFeed)
  // Future<ApiResponse<List<PostDetailModel>>> getFeed(
  //   @Query('page') int page,
  //   @Query('limit') int limit,
  // );

  // /// GET /posts/user/:userId — paginated posts belonging to a specific user.
  // @GET('/posts/user/{userId}')
  // Future<ApiResponse<List<PostDetailModel>>> getUserPosts(
  //   @Path('userId') String userId,
  //   @Query('page') int page,
  //   @Query('limit') int limit,
  // );

  // /// GET /posts/:postId — full detail of a single post.
  // @GET('/posts/{postId}')
  // Future<ApiResponse<PostDetailModel>> getPost(
  //   @Path('postId') String postId,
  // );

  // /// DELETE /posts/:postId — soft-delete a post (author only).
  // @DELETE('/posts/{postId}')
  // Future<ApiResponse<void>> deletePost(
  //   @Path('postId') String postId,
  // );

  // // ── Social ───────────────────────────────────────────────────────

  // /// PUT /users/:userId/follow — toggle follow / unfollow. Idempotent.
  // /// Requires a Bootstrapped JWT.
  // @PUT('/users/{userId}/follow')
  // Future<ApiResponse<FollowModel>> toggleFollow(@Path('userId') String userId);

  // /// GET /users/:userId/followers — paginated list of followers. No auth.
  // @GET('/users/{userId}/followers')
  // Future<ApiResponse<List<SocialUserModel>>> getFollowers(
  //   @Path('userId') String userId,
  //   @Query('page') int page,
  //   @Query('limit') int limit,
  // );

  // /// GET /users/:userId/following — paginated list of users the given user follows.
  // @GET('/users/{userId}/following')
  // Future<ApiResponse<List<SocialUserModel>>> getFollowing(
  //   @Path('userId') String userId,
  //   @Query('page') int page,
  //   @Query('limit') int limit,
  // );

  // @PUT('/posts/{postId}/like')
  // Future<ApiResponse<ToggleLikeModel>> toggleLike(
  //   @Path('postId') String userId,
  // );

  // // ── Comments ───────────────────────────────────────────────

  // /// GET /posts/:postId/comments
  // @GET('/posts/{postId}/comments')
  // Future<ApiResponse<List<CommentModel>>> getComments(
  //   @Path('postId') String postId,
  //   @Query('page') int page,
  //   @Query('limit') int limit,
  // );

  // /// POST /posts/:postId/comments
  // @POST('/posts/{postId}/comments')
  // Future<ApiResponse<CommentModel>> createComment(
  //   @Path('postId') String postId,
  //   @Body() Map<String, dynamic> body,
  // );

  // /// DELETE /posts/comments/:commentId
  // @DELETE('/posts/comments/{commentId}')
  // Future<ApiResponse<void>> deleteComment(
  //   @Path('commentId') String commentId,
  // );

  // // ── Feedback ─────────────────────────────────────────────────────

  // /// POST /feedback — submit in-app feedback.
  // @POST(ApiEndpoints.submitFeedback)
  // Future<ApiResponse<FeedbackModel>> submitFeedback(
  //   @Body() Map<String, dynamic> body,
  // );

  // // ── Reports ───────────────────────────────────────────────────────

  // /// POST /reports — submit a report on a post, comment, or user.
  // @POST(ApiEndpoints.submitReport)
  // Future<ApiResponse<ReportModel>> submitReport(
  //   @Body() Map<String, dynamic> body,
  // );

  // // ── Notifications ─────────────────────────────────────────────────

  // /// GET /notifications — list notifications for the authenticated user.
  // @GET(ApiEndpoints.getNotifications)
  // Future<ApiResponse<List<NotificationModel>>> getNotifications(
  //   @Query('page') int page,
  //   @Query('limit') int limit,
  // );

  // /// PATCH /notifications/read — mark notifications as read.
  // @PATCH(ApiEndpoints.markNotificationsRead)
  // Future<ApiResponse<MarkReadResponseModel>> markNotificationsRead(
  //   @Body() Map<String, dynamic> body,
  // );
}
