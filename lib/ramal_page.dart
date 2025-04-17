import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RamalPage extends StatelessWidget {
  final String nama;
  final DateTime tanggalLahir;

  const RamalPage({super.key, required this.nama, required this.tanggalLahir});

  String getZodiac(DateTime date) {
    int day = date.day;
    int month = date.month;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'Aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'Taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'Gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'Cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'Leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'Virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'Libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) return 'Scorpio';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) return 'Sagitarius';
    if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) return 'Capricorn';
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) return 'Aquarius';
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return 'Pisces';
    return 'Tidak diketahui';
  }

  String getZodiacInfo(String zodiac) {
    Map<String, String> zodiakInfo = {
      'Aries': 'Orang yang lahir antara 21 Maret hingga 20 April memiliki zodiak Aries, yang digambarkan dengan lambang biri-biri jantan. Aries dikenal berani, yakin, inisiatif, dan memiliki daya juang. Namun, mereka bisa cenderung kasar, sombong, dan agresif. Aries termasuk dalam kategori kardinal, yang berarti aktif dan cocok untuk memulai proyek baru. Selain Aries, zodiak kardinal lainnya adalah Capricorn, Cancer, dan Libra..',
      'Taurus': 'Taurus cenderung praktis, loyal, tabah, dan gemar berpelesiran. Mereka juga bisa terlalu kebendaan, keras hati, dan suka mengekang. Taurus cocok untuk memastikan sesuatu berjalan lancar. Termasuk kategori tetap, seperti Scorpio, Leo, dan Aquarius.',
      'Gemini': 'Gemini kreatif, cerdas, terampil berkomunikasi, dan suka bepergian. Namun, mereka bisa gugup, berbicara kosong, dan tidak selalu praktis. Termasuk kategori variabel, seperti Sagitarius, Virgo, dan Pisces.',
      'Cancer': 'Cancer sangat peduli dengan keluarga dan rumah tangga, sensitif, dan sabar. Terkadang mereka bisa terlalu bertahan dan takut pada perpisahan. Termasuk kategori kardinal, seperti Aries, Capricorn, dan Libra.',
      'Leo': 'Leo berani, pemimpin alami, dan ramah. Mereka kadang-kadang egois, suka pamer, dan terlalu mengejar kemewahan. Termasuk kategori tetap, seperti Taurus, Aquarius, dan Scorpio.',
      'Virgo': 'Virgo praktis, perfeksionis, dan disiplin. Mereka bisa cerewet dan terlalu mengkritik. Termasuk kategori variabel, seperti Gemini, Pisces, dan Sagitarius.',
      'Libra': 'Libra seimbang, harmonis, dan suka berhubungan sosial. Terkadang mereka kurang tegas dan cenderung berpura-pura. Termasuk kategori kardinal, seperti Aries, Cancer, dan Capricorn.',
      'Scorpio': 'Scorpio intens, kreatif, dan penuh gairah. Mereka bisa cemburu, fanatik, dan suka membalas dendam. Termasuk kategori tetap, seperti Taurus, Leo, dan Aquarius.',
      'Sagitarius': 'Sagitarius optimis, bijaksana, dan suka eksplorasi. Mereka bisa ceroboh dan tidak mematuhi aturan. Termasuk kategori variabel, seperti Gemini, Virgo, dan Pisces.',
      'Capricorn': 'Mengutamakan kesuksesan, loyalitas, dan kebijaksanaan. Cenderung pesimis, khawatir, dan pemikiran sempit. Termasuk zodiak kardinal, cocok untuk memulai proyek baru.',
      'Aquarius': 'Tertarik pada petualangan, kemanusiaan, dan perubahan. Terkadang tak bisa diandalkan, membantah, dan kurang konsisten. Termasuk zodiak tetap, baik untuk memastikan keberhasilan.',
      'Pisces': ' Mengutamakan cinta, kerohanian, dan kreativitas. Cenderung bingung, mudah kecewa, dan khawatir. Termasuk zodiak variabel, kreatif meskipun tidak selalu praktis.',
    };
    return zodiakInfo[zodiac] ?? 'Informasi tidak tersedia';
  }

  String getMonthInfo(int month) {
    Map<int, String> monthInfo = {
      1: 'Januari si ambisius alias Keras kepala, ambisius, dan suka mengobservasi orang lain. Memiliki kemampuan leadership, tapi perlu pintar memposisikan diri.',
      2: 'Februari si kreatif alias Kreatif, cerdas, dan suka berpikir bebas. Cenderung memberontak terhadap aturan, tapi yakin dengan tujuan mereka.',
      3: 'Maret si penyayang alias Pemalu, tapi memiliki hati yang baik dan mampu menengahi konflik. Cenderung dipercaya oleh orang lain.',
      4: 'April si berani alias Suka tantangan dan mudah mengalahkan rasa takut. Senang mendapat perhatian dan penghargaan atas kerja keras mereka.',
      5: 'Mei si sabar alias Logis, cerdas, dan memiliki daya tarik. Suka fakta dan bisa sukses di bidang sains atau matematika.',
      6: 'Juni si pendiam alias Sensitif, pendengar yang baik, dan peduli dengan orang lain. Bisa mengalah demi orang lain, meskipun hal ini bisa merugikan.',
      7: 'Juli si ekstrovert alias Enerjik, asyik diajak hangout, dan punya selera humor yang cerdas. Mudah membuat orang merasa nyaman.',
      8: 'Agustus si perfeksionis alias Bakat alami dalam leadership, namun banyak yang tidak menyadari potensi ini. Dikenal karena pesona dan kemampuan memimpin.',
      9: 'September si teliti alias Perfeksionis dan detail-oriented. Memiliki manajemen waktu yang baik dan ekspektasi tinggi.',
      10: 'Oktober si adil alias Independen, selalu fokus pada sisi positif, dan mudah membuat teman baru. Menyenangkan dan talkative.',
      11: 'November si misterius alias Keras kepala, cenderung menyimpan rahasia, dan sangat fokus pada tujuan mereka. Tidak mudah menerima bantuan dari orang lain.',
      12: 'Desember si ceria alias Aktif, bangga dengan diri sendiri, dan gigih mempertahankan harga diri. Sering kali menjadi pusat perhatian.',
    };
    return monthInfo[month] ?? 'Tidak diketahui';
  }

  @override
  Widget build(BuildContext context) {
    String zodiac = getZodiac(tanggalLahir);
    String zodiacInfo = getZodiacInfo(zodiac);
    String monthInfo = getMonthInfo(tanggalLahir.month);

    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Ramalan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Halo, $nama!', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('Bintang Anda: $zodiac', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Info tentang bintang Anda:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(zodiacInfo),
            const SizedBox(height: 20),
            Text('Menurut bulan: $monthInfo', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
