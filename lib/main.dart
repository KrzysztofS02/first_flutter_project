import 'package:dsw_51744/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MainApp());

  // runApp(
  //   const MaterialApp(
  //     title: 'Navigation Basics',
  //     debugShowCheckedModeBanner: false,
  //     home: LoginView(),
  //   ),
  // );

}

class MainApp extends StatelessWidget {
  static String title = 'Notes SQLite';

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const LoginView(),
    );
  }
}
