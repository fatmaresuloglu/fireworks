import 'package:firebase_core/firebase_core.dart'; // Bunu ekle
import 'package:flutter/material.dart';
import 'firebase_options.dart'; // CLI'ın oluşturduğu dosya buraya gelmeli

void main() async {
  // Burası çok kritik, hata almamak için şart:
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'i başlatan motor burası:
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fireworks',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(),
    );
  }
}
