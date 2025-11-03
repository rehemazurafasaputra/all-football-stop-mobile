# all_football_stop

<details>
<summary>Tugas 7</summary>
Widget Tree dalam Flutter adalah suatu struktur hirarki yang mendefinisikan bagaimana UI akan ditampilkan.

Widget yang digunakan dalam proyek ini:
- MyApp: Custom Widget yang berperan sebagai widget utama (root widget) aplikasi.
- StatelessWidget: Widget yang propertinya tidak dapat berubah (immutable)
- MaterialApp: Widget yang berfungsi biasanya sebagai Root Widget yang memiliki beberapa fungsionalitas dasar.
- MyHomePage: Custom Widget yang berperan untuk mengatur Home Page App.
- Scaffold: Widget yang berperan sebagai struktur tampilan.
- AppBar: Widget yang muncul di layar atas.
- InfoCard: Custom Widget yang menampilkan informasi dalam bentuk Card
- ItemCard: Custom Widget yang menampilkan item dengan gambar.

Fungsi dari MaterialApp widget adalah memberikan fungsi dasar yang dapat digunakan widget lain serta mengonfigurasi widget yang digunakan. Dengan fungsionalitas ini MateriapApp sering digunakan menjadi Root Widget

StatelessWidget adalah widget yang properties nya tidak berubah setelah dibuild sementara, StatefulWidget adalah widget yang memiliki internal state yang dapat diubah selama digunakan. StatelessWidget baik digunakan untuk hal yang tidak akan bisa diubah seperti text / gambar penting dalam halaman, sementara StatefulWidget baik digunakan untuk hal yang berinteraksi dengan User, sehingga tampilan dapat berubah yang dapat memberikan feedback ke user.

BuildContext adalah objek yang merepresentasikan lokasi dari suatu widget dalam widget tree. Dalam build, BuildContext dapat digunakan untuk mendapatkan data dari ancestor sehingga dapat digunakan kembali.

Hot Reload adalah mekanisme untuk mengapply code changes secara cepat. Hot Reload tidak akan menghilangkan state dari aplikasi. Hot Restart juga merupakan mekanisme untuk mengaply code changes, tetapi secara full. Hot Restart akan mereset state dari aaplikasi dengan menjalankan kembali main() dan initState().
</details>