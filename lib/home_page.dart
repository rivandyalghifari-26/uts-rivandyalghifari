import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_rivandyalghifari_2310501100_mobilelanjut/ramal_page.dart'; // Import RamalPage
import 'package:provider/provider.dart';
import 'package:uts_rivandyalghifari_2310501100_mobilelanjut/providers/user_provider.dart';

void main() => runApp(ZodiacApp());

class ZodiacApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  DateTime? selectedDate;

  // Fungsi untuk memilih tanggal lahir
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zodiac App'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/foto_profile.jpeg'),
            ),
            SizedBox(height: 20),
            Text(
              'Nama: Rivandy Alghifari', // Ganti dengan nama kamu
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'NIM: 2310501100', // Ganti dengan NIM kamu
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Input nama pengguna
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Masukkan Nama'),
            ),
            SizedBox(height: 20),
            // Input tanggal lahir
            Row(
              children: [
                Text(
                  selectedDate == null
                      ? 'Pilih Tanggal Lahir'
                      : DateFormat('yyyy-MM-dd').format(selectedDate!),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Tombol untuk navigasi ke halaman ramal
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && selectedDate != null) {
                  // Simpan ke Provider
                  Provider.of<UserProvider>(context, listen: false)
                      .setUser(nameController.text, selectedDate!);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RamalPage(
                        nama: nameController.text,  // Mengirimkan nama yang dimasukkan
                        tanggalLahir: selectedDate!,  // Mengirimkan tanggal lahir yang dipilih
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Mohon lengkapi data terlebih dahulu.'),
                  ));
                }
              },
              child: Text('Ramal Zodiak'),
            ),

          ],
        ),
      ),
    );
  }
}
