import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'user_list_page.dart'; // Yeni oluşturduğun dosyayı import et

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fireworks App',
      theme: ThemeData(primarySwatch: Colors.red),
      // Ana sayfa olarak senin oluşturduğun sayfayı belirliyoruz
      home: UserListScreen(),
    );
  }
}
