import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/views/organize/organize_view.dart';
import 'package:imagetopdf/views/scan_document/scan_document_view.dart';
import 'package:imagetopdf/views/setting/settings_view.dart';
import 'package:imagetopdf/views/splash/splash_view.dart';
import 'package:imagetopdf/views/pdf_detail/pdf_detail_view.dart'; // Yeni import

export 'package:go_router/go_router.dart' show GoRouter;
export 'package:flutter/material.dart' show GlobalKey, NavigatorState;

final _rootNavigatorKey = GlobalKey<NavigatorState>();

Page<dynamic> fadeScalePage({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
  );
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) => NoTransitionPage(child: SplashView()),
    ),
    GoRoute(
      path: '/organize',
      pageBuilder: (context, state) =>
          fadeScalePage(child: OrganizeView(), state: state),
    ),
    GoRoute(
      path: '/doc-scan',
      pageBuilder: (context, state) =>
          fadeScalePage(child: ScanDocumentView(), state: state),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) =>
          fadeScalePage(child: SettingsView(), state: state),
    ),
    GoRoute(
      path: '/pdf-detail',
      pageBuilder: (context, state) => fadeScalePage(
        child: PdfDetailView(pdfPath: state.extra as String),
        state: state,
      ),
    ),
  ],
);

final GoRouter appRouter = router;
final GlobalKey<NavigatorState> rootNavigatorKey = _rootNavigatorKey;
