// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:theo/core/constants/global_variables.dart';
// import 'package:theo/features/account/data/entities/menu_page_params.dart';
// import 'package:theo/features/account/presentation/screens/appearance_menu.dart';
// import 'package:theo/features/account/presentation/screens/create_invite_code.dart';
// import 'package:theo/features/account/presentation/screens/menu_page.dart';
// import 'package:theo/features/auth/presentation/entities/login_page_params.dart';
// import 'package:theo/features/feedback/presentation/screens/create_feedback_page.dart';
// import 'package:theo/features/feedback/presentation/screens/feedback_page.dart';
// import 'package:theo/features/follow/data/entities/follow_social_page_params.dart';
// import 'package:theo/features/follow/presentation/screens/follow_social_page.dart';
// import 'package:theo/features/onboarding/presentation/entities/create_profile_params.dart';
// import 'package:theo/features/onboarding/presentation/screens/create_profile.dart';
// import 'package:theo/features/auth/presentation/screens/login.dart';
// import 'package:theo/features/auth/presentation/screens/sign_up.dart';
// import 'package:theo/features/create/presentation/entities/caption_post_params.dart';
// import 'package:theo/features/create/presentation/screens/caption_post.dart';
// import 'package:theo/features/create/presentation/screens/create_post.dart';
// import 'package:theo/features/create/presentation/screens/create_theo.dart';
// import 'package:theo/features/mainapp/data/entities/content_view_params_entity.dart';
// import 'package:theo/features/mainapp/presentation/screens/content_view.dart';
// import 'package:theo/features/invites/presentation/screens/invite_code_page.dart';
// import 'package:theo/features/onboarding/presentation/screens/onboarding_view.dart';
// import 'package:theo/features/onboarding/presentation/screens/welcomed_by.dart';
// import 'package:theo/features/splash_screen/presentation/splash_screen.dart'
//     show SplashScreenProvider;
// import 'package:theo/features/users/presentation/screens/search_users_page.dart';
// import 'package:theo/features/users/presentation/screens/user_profile_page.dart';
// import 'package:theo/features/account/presentation/screens/report_page.dart';
// import 'package:theo/core/common/post/post_options_sheet.dart';
// import 'package:theo/features/notifications/presentation/screens/notifications_page.dart';
// import 'package:theo/features/post/presentation/screens/post_detail_page.dart';
// import 'package:theo/router/app_route_constants.dart';

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:mainframe_app/core/constants/global_variables.dart';
import 'package:mainframe_app/features/gallery/domain/entities/image_preview_widget_entity.dart';
import 'package:mainframe_app/features/gallery/presentation/screens/gallery.dart';
import 'package:mainframe_app/features/gallery/presentation/screens/image_preview.dart';
import 'package:mainframe_app/router/app_route_constants.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners(); // trigger an initial check
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  // static bool _initialHandled = false;
  Uri? _initialUri;

  // String getInitialLocation() {
  //   if (_initialHandled || _initialUri == null) return '/';

  //   _initialHandled = true;
  //   switch (_initialUri?.host ?? "") {
  //     case 'profile':
  //       return '/profile${_initialUri?.path}';
  //     case 'team-page':
  //       return '/team-page${_initialUri?.path}';
  //     case 'tournament-page':
  //       return '/tournament-page${_initialUri?.path}';
  //     case 'match':
  //       return '/match${_initialUri?.path}';
  //     default:
  //       return '/'; // fallback
  //   }
  // }

  // String _convertUriToRoute(Uri? uri) {
  //   if (uri == null) return '/';

  //   // Handle Universal Links (https://cricklo.com/...)
  //   if (uri.scheme == 'https' &&
  //       (uri.host == 'cricklo.com' || uri.host == 'www.cricklo.com')) {
  //     // Just return the path directly
  //     if (uri.path.startsWith('/match/') ||
  //         uri.path.startsWith('/profile/') ||
  //         uri.path.startsWith('/team-page/') ||
  //         uri.path.startsWith('/tournament-page/')) {
  //       return uri.path; // e.g., '/match/12345'
  //     }
  //   }
  //   // Handle custom URL scheme (crickloapp://...)
  //   else if (uri.scheme == 'crickloapp') {
  //     switch (uri.host) {
  //       case 'match':
  //         return '/match${uri.path}';
  //       case 'profile':
  //         return '/profile${uri.path}';
  //       case 'team-page':
  //         return '/team-page${uri.path}';
  //       case 'tournament-page':
  //         return '/tournament-page${uri.path}';
  //       default:
  //         return '/';
  //     }
  //   }

  //   return '/';
  // }

  AppRouter(this._initialUri);

  /// Builds a [CustomTransitionPage] with a simple fade transition, avoiding
  /// the white flash that [MaterialPage]'s default slide animation produces.

  late final GoRouter router = GoRouter(
    navigatorKey: GlobalVariables.navigatorKey,
    refreshListenable: Listenable.merge([GlobalVariables.authenticated]),
    redirect: (context, state) {
      // No redirect — the splash screen handles all initial navigation logic
      // via SplashScreenCubit. Returning null here lets every pushReplacement
      // call from the cubit reach its intended destination.
      //
      // If you later add route guards (e.g. redirect unauthenticated users to
      // login for protected routes), add them here — but never return a
      // hard-coded route unconditionally, or every navigation will be
      // intercepted.
      return null;
    },
    routes: [
      GoRoute(
        name: Routes.mainAppScreen,
        path: Routes.mainAppScreen,
        builder: (context, state) {
          return HomePage(title: "Home");
        },
      ),
      GoRoute(
        name: Routes.imagePreview,
        path: Routes.imagePreview,
        builder: (context, state) {
          final params = state.extra as ImagePreviewWidgetEntity;
          return ImagePreview(params: params);
        },
      ),
    ],
  );
}
