import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:create_pdf/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generate PDF with Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Generate PDF with Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Lottie.asset(
            'assets/pdfSplash.json',
            //'https://assets5.lottiefiles.com/packages/lf20_KMqzGr.json',
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Convert \nTexts, \nParagraphs, \nTables, \nImages',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'to PDF',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      nextScreen: const HomeScreen(),
      backgroundColor: Colors.white,
      splashIconSize: 500,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      //pageTransitionType: PageTransitionType.leftToRight,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
