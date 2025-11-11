Tugas 7

  Soal jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    Widget Tree adalah hirarki pada flutter yang berbentuk pohon. Setiap node pada tree adalah widget, kemudian widget paling atas disebut root widget. Setiap widget dapat memiliki parent dan child tergantung
    hirarkinya. Parent adalah widget yang menyusun atau mengatur widget lain dan Child adalah widget yang dikelola atau diatur oleh parent-nya. Secara garis besar Ketika terjadi perubahan, Flutter tidak menggambar
    ulang seluruh layar, tapi hanya bagian widget tree yang berubah.
  
  Soal sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    1. MaterialApp untuk mengatur tema, judul, dan halaman awal aplikasi.
    2. Scaffold untuk menyediakan struktur dasar halaman dengan AppBar dan body.
    3. AppBar untuk bar navigasi di bagian atas halaman.
    4. Padding untuk memberikan jarak/spacing di sekitar widget child.
    5. Column untuk menyusun widget children secara vertikal.
    6. Row untuk menyusun widget children secara horizontal.
    7. Center untuk menempatkan widget child di tengah area yang tersedia.
    8. Container untuk widget box model yang serbaguna untuk styling dan layout.
    9. SizedBox untuk box dengan ukuran fixed/tetap.
    10. GridView.count untuk menampilkan children dalam bentuk grid dengan jumlah kolom tetap.
    11. Text untuk menampilkan teks dilayar.
    12. Icon, menampilkan ikon material design.
    13. Card untuk widget dengan elevasi/bayangan.
    14. Material untuk menyediakan visual material design dan ink effects.
    15. InkWell untuk widget responsif terhadap sentuhan dengan efek ripple.
    16. SnackBar untuk menampilkan pesan notifikasi singkat di bagian bawah layar.
    17. ScaffoldMessenger untuk mengelola dan menampilkan SnackBar dalam Scaffold.
    18. Theme untuk mengakses tema aplikasi yang didefinisikan di MaterialApp.
    19. MediaQuery mendapatkan informasi tentang ukuran dan orientasi layar.
    20. MyApp, widget root aplikasi.
    21. MyHomePage untuk halaman utama aplikasi.
    22. InfoCard, widget custom untuk menampilkan kartu informasi.
    23. ItemCard, widget custom untuk menampilkan tombol dengan ikon, teks, dan warna.
    24. ItemHomepage, model class untuk menyimpan data tombol
    25. TextStyle untuk mengatur style teks.
    26. EdgeInsets untuk mengatur padding/margin.
    27. BorderRadius untuk rounded sudut.
    28. ColorScheme untuk skema warna aplikasi yang didefinisikan di MaterialApp
    29. Colors untuk warna.

Soal apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
  MaterialApp adalah widget yang fungsinya untuk pembungkus seluruh aplikasi Flutter berbasis Material Design. MaterialApp menyediakan konfigurasi dan struktur dasar aplikasi agar widget lain
  bisa tampil dan berfungsi sesuai gaya desain. MaterialApp sering dijadikan widget root karena tanpa MaterialApp banyak komponen Material Design tidak akan tahu bagaimana cara menggambar diri mereka dan daripada
  mendefinisikan tema atau route di setiap halaman, MaterialApp menjadikannya terpusat dan konsisten. 

Soal jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
  1. StatelessWidget:
     - Statis
     - Tidak bisa menyimpan atau mengubah data internal.
     - Metode utamanya cuma build() saja.
     - Diperbarui hanya ketika parent memanggil build() ulang.
     - kinerja lebih cepat dan ringan karena tidak ada state.

  3. StatefulWidget:
     - Dinamis
     - Dapat menyimpan dan mengubah state.
     - Bisa createState() lalu build() di dalam State class.
     - Dapat diperbarui kapan pun dengan setState().
     - Sedikit lebih berat karena perlu memantau perubahan state.

Soal apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
  BuildContext adalah sebuah objek yang merepresentasikan posisi sebuah widget di dalam sebuah widget tree, bahasa mudahnya seperti alamat dari sebuah widget tersebut. Digunakan di metode build() 
  agar widget tahu di mana ia berada dan apa yang bisa diakses.

Soal jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
  1. Hot Reload adalah jika ada perubahan dalam kode kita bisa melihat langsung hasilnya di aplikasi yang sedang kita buat tanpa menutupnya, jadi aplikasi tidak mulai dari awal
     data yang sedang kamu lihat tidak hilang.
  2. Hot Restart adalah lawan dari hot reload yaitu aplikasi dijalankan ulang dari awal, tapi tanpa menutup emulator atau perangkatnya. Jadi semua data yang disimpan sebelumnya hilang dan kembali ke awal.


Tugas 8

Soal jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
  1. Navigator.push() cara kerjanya adalah menambahkan halaman baru di atas halaman saat ini dalam navigation stack, jadi halaman sebelumnya tetap ada di memori dan user isa kembali ke halaman sebelumnya
     dengan tombol back. Digunakan ketika ingin lihat detail produk jadi user bisa kembali ke daftar produk dan juga ketika membuka form create produk jadi user bisa kembali jika ingin cancel dan kembali ke home.
     
  2. Navigator.pushReplacement() cara kerjanya adalah mengganti halaman saat ini dengan halaman baru, halaman sebelumnya dihapus dari navigation stack, jadi user tidak bisa tekan tombol back. Digunakan ketika
     sesi login berhasil jadi user tidak bisa kembali ke halaman login dengan menekan tombol back.

Soal bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
  1. Scaffold
       Fondasi yang konsisten karena digunakan di semua halaman (HomePage, ProductFormPage, dll), menyediakan struktur standar seperti AppBar + Drawer + Body, dan konsistensi layout otomatis.
  2. AppBar
     Header seragam, semua halaman punya header dengan warna & style yang sama.
  3. Drawer
     Navigasi di seluruh halaman, jadi selalu tersedia di semua halaman dan User bisa akses halaman manapun dari drawer.

Soal Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu?
  1. Kelebihan Padding:
    - Memberikan ruang antar elemen.
     - Meningkatkan readability.
     - Membuat UI tidak cramped.
  Penggunaan di ProductFormPage yaitu saya memakai Padding pada bagian body Scaffold dengan EdgeInsets.all(16.0) untuk memberikan jarak 16 pixel dari semua sisi layar. Ini membuat form tidak menempel langsung ke
  tepi layar sehingga lebih nyaman dibaca.

  2. Kelebihan SingleChildScrollView:
    - Mengatasi overflow saat konten melebihi layar.
     - Support berbagai ukuran layar (responsive).
     - Mencegah keyboard overlap dengan form.
  Saya memakai SingleChildScrollView sebagai wrapper Column yang berisi semua form fields. Form memiliki 5 input field yang cukup panjang Ketika keyboard muncul saat user mengetik, field yang ada di bawah tetap
  bisa diakses dengan scroll

  3. Kelebihan ListView:
     - Efisien untuk list panjang (lazy loading).
     - Built-in scrolling.
     -  Memory efficient karena render yang terlihat saja.
  Saya memakai GridView.count untuk menampilkan 3 tombol product (All Products, My Products, Create Product) dalam bentuk grid dengan 3 kolom. Properti shrinkWrap: true membuat GridView hanya mengambil ruang
  sebesar kontennya saja, tidak expand ke seluruh layar.

Soal bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
  Saya menyesuaikan warna tema di main.dart menggunakan ColorScheme.fromSeed() dengan warna kuning emas (#EAB308) sebagai primary dan putih sebagai secondary, mencerminkan warna khas Real Madrid. Dengan
  menggunakan Theme.of(context).colorScheme.primary di semua komponen (AppBar, tombol, dll), warna tema otomatis diterapkan tanpa hardcode.

  
