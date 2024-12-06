import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/login_page.dart';
import 'package:myapp/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Verifica se o usuário já está logado ao abrir o app
  User? user = FirebaseAuth.instance.currentUser;
  Widget startPage = user != null ? HomePage() : LoginPage(); // Decide a tela inicial
  
  runApp(MyApp(startPage: startPage));
}

class MyApp extends StatelessWidget {
  final Widget startPage;

  const MyApp({Key? key, required this.startPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Veículos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: startPage,
    );
  }
}
