import 'package:encryption_9_3/core/constants/strings.dart';
import 'package:encryption_9_3/features/home_layout/presentation/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: kmMainColor, backgroundColor: kmMainColor),
      getPages: [
        GetPage(name: "/", page: (() => HomeLayoutView())),
        // GetPage(name: "/cisar", page: (() => CisarCypherView())),
      ],
    );
  }
}
