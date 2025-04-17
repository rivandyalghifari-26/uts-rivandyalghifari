import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan ini merujuk ke file home_page.dart yang kamu buat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Zodiak',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: HomePage(), // Arahkan ke halaman HomePage yang kamu buat
    );
  }
}
