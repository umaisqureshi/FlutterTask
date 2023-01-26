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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Brightness? _brightness;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness;
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _brightness = WidgetsBinding.instance.window.platformBrightness;
      });
    }

    super.didChangePlatformBrightness();
  }

  ThemeData get _lightTheme => ThemeData(
        primaryColor: const Color.fromARGB(255, 248, 246, 246),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 208, 207, 207),
            centerTitle: true,
            elevation: 0,
            titleTextStyle:
                GoogleFonts.aBeeZee(color: Colors.teal, fontSize: 25)),
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
            .copyWith(onBackground: Colors.black, brightness: Brightness.light),
      );

  ThemeData get _darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 30, 29, 29),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 15, 15, 15),
            centerTitle: true,
            elevation: 0,
            titleTextStyle:
                GoogleFonts.aBeeZee(color: Colors.teal, fontSize: 25)),
        backgroundColor: Colors.black26,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
            .copyWith(onBackground: Colors.white, brightness: Brightness.dark),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      debugShowCheckedModeBanner: false,
      title: 'Task Tracking',
      themeMode: ThemeMode.system,
      theme: _brightness == Brightness.dark ? _darkTheme : _lightTheme,
    );
  }
}
