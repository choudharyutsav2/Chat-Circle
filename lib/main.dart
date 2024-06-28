import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyD0zmBH_pN2lJ3hGmTaCNvkZ0TuWdmlqtA',
      authDomain: 'com.example.chat_circle',
      projectId: 'chatcircle-93c87',
      storageBucket: 'chatcircle-93c87.appspot.com',
      messagingSenderId: '989439111496',
      appId: '1:989439111496:android:fd96d45e622cbe07aa037d',
    ),
  );
  runApp(chatcircle());
}

class chatcircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegistrationScreen.id:(context) => RegistrationScreen(),
          LoginScreen.id:(context) => LoginScreen(),
          ChatScreen.id:(context) => ChatScreen()
        });
  }
}
