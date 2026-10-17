import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mainframe_app/injection/injection_container.dart';
import 'package:mainframe_app/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initializeDependencies();

  Uri? initialUri;
  // final appLinks = AppLinks(); // AppLinks is singleton
  runApp(MyApp(initialUri: initialUri));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.initialUri});

  final Uri? initialUri;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(widget.initialUri);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.router,
      builder: (context, child) => child!,
    );
  }
}
