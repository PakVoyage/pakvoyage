import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/Screens/City%20Guide/Provider/city_guide_provider.dart';
import 'package:pak_voyage/Screens/Profile/Provider/profile_provider.dart';
import 'package:pak_voyage/Screens/Sign%20in/Provider/signin_provider.dart';
import 'package:pak_voyage/Screens/Tours/Provider/tour_provider.dart';
import 'package:pak_voyage/Screens/splash_screen.dart';
import 'package:pak_voyage/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log('Firebase initialized successfully');
  } catch (e) {
    log('Firebase initialization error: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TourProvider>(create: (_) => TourProvider()),
        ChangeNotifierProvider<CityProvider>(create: (_) => CityProvider()),
        ChangeNotifierProvider<SigninProvider>(create: (_) => SigninProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
