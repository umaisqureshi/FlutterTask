import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Route/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,

      debugShowCheckedModeBanner: false,
      title: 'Task Tracking',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: Colors.teal,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            centerTitle: true,
            elevation: 0,
            titleTextStyle:
                GoogleFonts.aBeeZee(color: Colors.teal, fontSize: 25)),
        backgroundColor: Colors.black26,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
            .copyWith(onBackground: Colors.white),
      ),
      // home: const SplashScreenView(),
    );
  }
}
