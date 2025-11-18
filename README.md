# all_football_stop
<details>
<summary>Tugas 9</summary>
Membuat model Dart untuk interaksi JSON dibandingkan langsung menggunakan Map membuat input lebih aman pertama dengan menggunakan model membuat tipe dari input JSON teratur (Type Safe). Selain itu, adanya model bisa memastikan bahwa input dihandle secara aman dan tidak memiliki point ke null (Null Safety). Penggunaan model juga memudahkan developer dalam mengubah atau memaintain hal-hal yang terkait dengan interaksi JSON.

HTTP berperan sebagai alat komunikasi untuk mengirim dan menerima data dari Internet (alamat server). Sementara CookieRequest diperlukan untuk melakukan session handling (status login).

Alasan CookieRequest harus disimpan diberikan semua komponen di aplikasi Flutter adalah untuk menjaga session yang digunakan oleh semua komponen di flutter sama dan tidak ada yang membuat koneksi baru sendiri.

Agar aplikasi flutter dapat berinteraksi dengan server Django pertama adalah dengan mengonfiguarasikan ALLOWED_HOSTS. Penambahan 10.0.2.2 ke ALLOWED_HOSTS dilakukan sehingga jika ada permintaan dari host 10.0.2.2 (emulator Android Flutter), server Django membolehkan host tersebut untuk melakukan permintaannya. Selanjutnya diperlukan pengonfigurasian CORS.  Tujuannya adalah agar permintaan dari Flutter diberikan oleh server Django. Kemudian diperlukan pengaturan SameSite dan Cookie. Ini diperlukan agar atribut Cookie dan sessionid Django diberikan ke Flutter sehingga hal-hal yang memerlukan Cookie (seperti form) dapat berjalan. Terakhir mengonfigurasi android sehingga memperbolehkan untuk mengakses Internet sehingga aplikasi yang dibuat dapat berinteraksi dengan Internet di Android.

Alur data di flutter:
Pertama, input dari flutter akan diproses oleh widget yang berkaitan. Lalu, Widget akan meminta data JSON dari server Django (melalui http.get). View django yang berkaitan akan memproses permintaan dan memberikan data JSON. Setelah menerima data JSON, model Dart yang berkaitan akan melakukan parsing dan membuat list objek model dart. Saat data sudah dibuat, data tersebut akan ditampilkan oleh Widget yang berkaitan.

mekanisme register, login, logout flutter:
Register: mengisi field akun untuk registrasi. Widget mengconvert input ke JSON dan mengirim data ke url view autentikasi register (melalui http.post). View melakukan validasi berdasarkan data. Jika aman view akan membuat user baru. View lalu memberikan respons. Flutter lalu menampilkan tampilan berdasarkan respons server.

Login: mengisi field akun untuk login. Widget mengconvert input ke JSON dan mengirim data ke url view autentikasi login. View melakukan validasi login berdasarkan data. Jika berhasil login, server akan mengirimkan respons beserta cookie sessionid ke flutter. Flutter lalu menyimpan sessionid sebagai cookie dan melakukan navigasi ke menu yang sesuai.

Logout: melakukan permintaan logout (biasanya melalui tombol logout). Flutter akan melakukan http.post ke url logout dan juga mengirim cookie sessionid. View Django akan memproses logout dan memberikan respons. Setelah respons diterima, app flutter menghapus cookie sessionid nya.

Cara sya mengimplementasikan checklist:
- Membuat app autentikasi (untuk autentikasi flutter) di projek Django.
- Membuat view untuk melakukan registrasi, login, dan logout di app autentikasi flutter - dan melakukan routing url
- Membuat widget untuk autentikasi di flutter (yang mengintegrasikan app autentikasi Django).
- Mengubah homepage menjadi LoginPage().
- Menambahkan view django untuk memberi JSON product user.
- Membuat widget list product
- Membuat view untuk add product dari aplikasi flutter
- Melink widget form product ke django
- Menambah tombol logout

</details>


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