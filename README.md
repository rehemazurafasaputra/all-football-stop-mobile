# all_football_stop
<details>
<summary>Tugas 8</summary>
Navigator.push() menambah screen ke stack tanpa menghilangkan screen sebelumnya. Hal ini memungkinkan untuk kembali ke screen sebelumnya dengan menggunakan Navigator.pop(). Navigator.push() dapat digunakan dalam navigasi menu utama (main menu) dalam aplikasi. Navigator.pushReplacement() menambah screen ke stack dengan menghilangkan screen sebelumnya. Penggunaan Navigator.pushReplacement() tidak memungkinkan untuk kembali ke screen sebelumnya. Hal ini cocok untuk sistem form dan login.

Untuk membuat halaman yang konsisten, scaffold dapat digunakan sebagai kerangka utama dari halaman. Dalam scaffold, terdapat tempat untuk menempatkan AppBar dan Drawer. AppBar dapat digunakan sebagai header dari halaman, sementara drawer dapat digunakan sebagai panel navigasi cepat antara menu.

Layout widget dalam halaman form digunakan agar form mudah digunakan oleh pengguna. Padding memberikan ruang sehingga elemen-elemen form tidak tertempel satu sama lain, contohnya penggunaan padding untuk setiap bagian dari input (nama, stok, harga, dll). SingleChildScrollView memungkinkan elemen form menjadi scrollable sehingga tidak terjadi overflow, Contohnya sebagai child dari Widget Form di product_form.dart. ListView mengkombinasikan widget Column dan SingleChildScrollView untuk memudahkan pembuatan form yang konsisten.

Penyesuaian warna tema dapat dilakukan di bagian MaterialApp di main.dart melalui theme. Dalam theme dapat dibuat ThemeData yang berisi colorScheme yang dapat memiliki color utama aplikasi. Data color dari theme lalu dapat digunakan dengan Theme.of(context).colorScheme.primary.
</details>


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