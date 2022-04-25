import 'package:eshop_spot/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eshop Spot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const WelcomeScreen(),
      initialRoute: Routes.welcomeScreen,
      getPages: AppRoutes.routes,
    );
  }
}
