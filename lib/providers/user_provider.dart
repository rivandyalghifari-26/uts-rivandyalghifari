import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _nama = '';
  DateTime? _tanggalLahir;

  String get nama => _nama;
  DateTime? get tanggalLahir => _tanggalLahir;

  void setUser(String nama, DateTime tanggalLahir) {
    _nama = nama;
    _tanggalLahir = tanggalLahir;
    notifyListeners();
  }
}

