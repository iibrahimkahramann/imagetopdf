import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetopdf/config/router/go_router.dart' as app_router;
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:imagetopdf/providers/pdf_provider/pdf_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  await container.read(pdfListProvider.notifier).loadPdfs();

  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  final bool _appIsReady = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_appIsReady) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp.router(
      title: 'SwipeWipe',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.themeData(context),
      routerConfig: app_router.router,
    );
  }
}
