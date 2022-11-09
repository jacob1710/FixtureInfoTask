import 'package:fixture_info_task/router.dart';
import 'package:fixture_info_task/services/navigation_service.dart';
import 'package:fixture_info_task/views/base_model.dart';
import 'package:fixture_info_task/views/fixtures/fixtures_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants/app_styles.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  var flavor = await MethodChannel('flavor').invokeMethod<String>('getFlavor');
  runApp(MyApp(flavor: flavor));
}

class MyApp extends StatelessWidget {
  MyApp({required this.flavor});
  String? flavor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FixtureInfo',
      theme: ThemeData(
        primarySwatch: AppStyles.createMaterialColor(AppStyles.kPrimaryColor),
      ),
      home: ChangeNotifierProvider(
        create: (context) => BaseModel(),
        //child: AuthView(),
        child: FixturesScreen(flavor: flavor ?? "error"),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}