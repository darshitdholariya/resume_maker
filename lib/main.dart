import 'package:code/screen/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants/color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.android) {
    await Firebase.initializeApp();
  } else {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDHp0kYKHRRBLC0iwdJtDeGF6kU8u7DExQ",
          appId: "1:139962975665:web:c79e8b4253e8fa496ee990",
          messagingSenderId: "139962975665",
          projectId: "interview-65018",
          storageBucket: "interview-65018.appspot.com",
        ),
      );
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: kColorsDarkNavy,
      ),
      home: const SplashScreen(),
    );
  }
}
