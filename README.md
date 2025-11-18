## Tugas 7

### 1. Soal Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

**Widget Tree** adalah representasi hierarki komponen visual pada Flutter yang berbentuk pohon. Setiap node (simpul) dalam pohon ini adalah sebuah Widget. Widget paling atas disebut **Root Widget**.

* **Hubungan Parent-Child:**
    * **Parent (Induk):** Widget yang bertugas menyusun, mengatur, atau mengelola tata letak (layout) Widget lain di dalamnya.
    * **Child (Anak):** Widget yang dikelola atau diatur oleh Parent-nya.
* **Mekanisme Perubahan:** Ketika terjadi perubahan data (State), Flutter hanya menggambar ulang (re-render) bagian spesifik dari Widget Tree yang terpengaruh oleh perubahan tersebut, sehingga menghemat sumber daya dan mempercepat pembaruan UI.

---

### 2. Soal Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

| No. | Widget / Kelas | Fungsi Utama |
| :---: | :--- | :--- |
| 1. | `MaterialApp` | Mengatur tema, judul, dan *routing* (halaman awal) aplikasi berbasis Material Design. |
| 2. | `Scaffold` | Menyediakan struktur dasar halaman (AppBar, Body, Drawer, dll.). |
| 3. | `AppBar` | Menampilkan bar navigasi di bagian atas halaman. |
| 4. | `Padding` | Memberikan jarak (*spacing*) di sekitar widget anak. |
| 5. | `Column` | Menyusun widget anak secara vertikal. |
| 6. | `Row` | Menyusun widget anak secara horizontal. |
| 7. | `Center` | Menempatkan widget anak tepat di tengah area yang tersedia. |
| 8. | `Container` | Widget *box model* serbaguna untuk *styling* (warna, dekorasi) dan *layout*. |
| 9. | `SizedBox` | Membuat kotak dengan ukuran tetap (*fixed size*). |
| 10. | `GridView.count` | Menampilkan item dalam bentuk *grid* dengan jumlah kolom yang telah ditetapkan. |
| 11. | `Text` | Menampilkan string teks di layar. |
| 12. | `Icon` | Menampilkan ikon dari pustaka Material Design. |
| 13. | `Card` | Widget berbentuk kartu dengan elevasi (*bayangan*) untuk memvisualisasikan konten. |
| 14. | `Material` | Menyediakan visual Material Design dan efek sentuhan (*ink effects*). |
| 15. | `InkWell` | Membuat widget responsif terhadap sentuhan dengan efek *ripple* (gelombang). |
| 16. | `SnackBar` | Menampilkan pesan notifikasi singkat di bagian bawah layar. |
| 17. | `ScaffoldMessenger` | Mengelola dan menampilkan `SnackBar` dalam konteks `Scaffold`. |
| 18. | `Theme` | Mengakses tema aplikasi yang telah didefinisikan di `MaterialApp`. |
| 19. | `MediaQuery` | Mendapatkan informasi tentang dimensi dan orientasi layar perangkat. |
| 20. | `MyApp` | Widget *root* aplikasi (Custom Widget). |
| 21. | `MyHomePage` | Halaman utama aplikasi (Custom Widget). |
| 22. | `InfoCard` | Widget kustom untuk menampilkan kartu informasi (Custom Widget). |
| 23. | `ItemCard` | Widget kustom untuk menampilkan tombol dengan ikon, teks, dan warna (Custom Widget). |
| 24. | `ItemHomepage` | *Model class* untuk menyimpan data tombol (Bukan Widget). |
| 25. | `TextStyle` | Mengatur gaya tampilan teks (font, ukuran, warna). |
| 26. | `EdgeInsets` | Mengatur nilai padding atau margin. |
| 27. | `BorderRadius` | Mengatur sudut membulat (*rounded corners*). |
| 28. | `ColorScheme` | Skema warna aplikasi yang didefinisikan di `MaterialApp`. |
| 29. | `Colors` | Kumpulan warna standar. |

---

### 3. Soal apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

**Fungsi `MaterialApp`:**

* `MaterialApp` adalah widget pembungkus seluruh aplikasi Flutter yang mengadopsi Material Design.
* Fungsinya adalah menyediakan konfigurasi dan struktur dasar aplikasi agar widget Material Design lainnya (seperti `Scaffold`, `AppBar`, `Theme`) dapat berfungsi dan tampil sesuai gaya desain.

**Alasan sebagai Widget Root:**

* **Pemusatan Konfigurasi:** `MaterialApp` memungkinkan pendefinisian tema (`Theme`), rute navigasi (`Routes`), dan lokalisasi secara terpusat.
* **Konsistensi:** Tanpa `MaterialApp`, banyak komponen Material Design tidak akan memiliki konteks (Theme, Directionality, dll.) yang diperlukan untuk menggambar diri mereka secara konsisten di seluruh aplikasi.

---

### 4. Soal jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

| Fitur | StatelessWidget | StatefulWidget |
| :--- | :--- | :--- |
| **Sifat** | Statis (Tidak Berubah) | Dinamis (Dapat Berubah) |
| **Data Internal** | Tidak bisa menyimpan atau mengubah data internal (*state*). | Dapat menyimpan dan memodifikasi *state* (*data internal*). |
| **Metode Utama** | Hanya memiliki metode `build()`. | Memiliki `createState()` yang kemudian memanggil `build()` di dalam kelas `State`. |
| **Pembaruan** | Diperbarui hanya ketika Widget *Parent* memanggil `build()` ulang. | Dapat diperbarui kapan pun secara internal dengan memanggil `setState()`. |
| **Kinerja** | Lebih cepat dan ringan karena tidak ada mekanisme pemantauan *state*. | Sedikit lebih berat karena perlu memantau dan mengelola perubahan *state*. |

**Kapan Memilih:**

* **`StatelessWidget`:** Dipilih ketika tampilan UI *tidak* bergantung pada perubahan data yang terjadi setelah widget dibuat (misalnya: `Text` statis, `Icon`, `Padding`).
* **`StatefulWidget`:** Dipilih ketika tampilan UI *harus* berubah sebagai respons terhadap interaksi pengguna atau perubahan data (misalnya: *Checkbox*, *Form Input*, *Button* yang berubah teks/warna setelah diklik).

---

### 5. Soal apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

**BuildContext** adalah sebuah objek yang merepresentasikan posisi sebuah Widget di dalam sebuah Widget Tree. Ini berfungsi sebagai "alamat" unik dari sebuah widget pada waktu tertentu.

**Pentingnya:**

* **Akses Hierarki:** `BuildContext` memungkinkan sebuah widget untuk mengetahui di mana ia berada dan mengakses widget atau data di atasnya dalam *tree*.
* **Akses Layanan:** Ini sangat penting untuk mengakses layanan yang diwariskan (*inherited services*) seperti `Theme.of(context)`, `MediaQuery.of(context)`, atau `ScaffoldMessenger.of(context)`.

**Penggunaan di `build()`:**

* Setiap metode `build()` menerima `BuildContext context` sebagai parameter.
* Contoh: Untuk mendapatkan warna tema aplikasi, kita menggunakan `Theme.of(context)`. Dengan adanya `context`, Flutter tahu dari posisi widget mana ia harus mencari data tema.

---

### 6. Soal jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

| Fitur | Hot Reload | Hot Restart |
| :--- | :--- | :--- |
| **Kecepatan** | Sangat Cepat (Sub-detik) | Cepat (Beberapa detik) |
| **State Aplikasi** | **Dipertahankan.** Data dan *state* aplikasi (seperti posisi *scroll* atau nilai *counter*) tidak hilang. | **Di-*reset*.** Aplikasi dimulai ulang dari awal (*initial state*), semua *state* dan data hilang. |
| **Perubahan Kode** | Hanya menyuntikkan kode baru yang dimodifikasi ke dalam Dart Virtual Machine yang sedang berjalan. | Memuat ulang seluruh kode Dart dan Java/Kotlin/Swift, menjalankan fungsi `main()` dari awal. |
| **Kapan Digunakan** | Untuk sebagian besar perubahan UI dan logika. | Untuk perubahan yang memerlukan inisialisasi ulang (misalnya, perubahan pada `main()` atau variabel `final` global). |

---

## Tugas 8

### 1. PSoal jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

| Metode | Mekanisme | Efek Tombol Back | Kasus Penggunaan (Football Shop) |
| :--- | :--- | :--- | :--- |
| `Navigator.push()` | Menambahkan halaman baru **di atas** halaman saat ini ke dalam *stack* navigasi. | User **bisa** kembali ke halaman sebelumnya. | Untuk melihat **Detail Produk** (agar bisa kembali ke Daftar Produk) atau membuka **Form Create Produk** (agar bisa *cancel* dan kembali ke Home). |
| `Navigator.pushReplacement()` | **Mengganti** halaman saat ini dengan halaman baru; halaman sebelumnya **dihapus** dari *stack*. | User **tidak bisa** kembali ke halaman sebelumnya. | Setelah **Login Berhasil** (agar user tidak bisa kembali ke halaman login dengan tombol *back*). |

---

### 2. Soal Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

* **`Scaffold`:** Berfungsi sebagai fondasi yang konsisten di semua halaman (`HomePage`, `ProductFormPage`, dll.). `Scaffold` menyediakan struktur standar (AppBar + Body + Drawer), memastikan layout dasar seragam.
* **`AppBar`:** Digunakan untuk menciptakan *header* yang seragam di seluruh aplikasi. Semua halaman memiliki *header* dengan warna, *style*, dan biasanya fungsi yang sama.
* **`Drawer`:** Menyediakan navigasi global yang konsisten. Dengan menempatkan `Drawer` di dalam `Scaffold`, User dapat mengakses semua halaman utama dari menu navigasi samping yang sama, tanpa harus kembali ke Home terlebih dahulu.

---

### 3. Soal dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

| Widget | Kelebihan | Contoh Penggunaan dalam Aplikasi |
| :--- | :--- | :--- |
| **`Padding`** | Memberikan ruang yang nyaman (*spacing*) antar elemen, meningkatkan keterbacaan (*readability*), dan mencegah UI terlihat terlalu padat (*cramped*). | Digunakan pada `body` `Scaffold` di `ProductFormPage` dengan `EdgeInsets.all(16.0)` agar form tidak menempel pada tepi layar. |
| **`SingleChildScrollView`** | Mengatasi *overflow* (konten melebihi layar), mendukung berbagai ukuran layar (*responsive*), dan mencegah *keyboard overlap* dengan *input field* saat *user* mengetik. | Digunakan sebagai *wrapper* untuk `Column` yang berisi semua *form fields* agar seluruh inputan tetap bisa diakses melalui *scroll* saat *keyboard* muncul. |
| **`ListView` / `GridView`** | Efisien untuk daftar panjang (*lazy loading*), memiliki fitur *scrolling* bawaan, dan hemat memori karena hanya merender elemen yang terlihat di layar. | Menggunakan **`GridView.count`** (dengan `shrinkWrap: true`) di halaman utama untuk menampilkan 3 tombol (`All Products`, `My Products`, `Create Product`) dalam tata letak *grid* 3 kolom yang terstruktur. |

---

### 4. Soal bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Warna tema disesuaikan di file `main.dart` menggunakan konfigurasi tema berbasis Material Design 3.

* **Penerapan Warna:** Digunakan `ColorScheme.fromSeed()` dengan menetapkan warna **Kuning Emas (`#EAB308`)** sebagai warna `primary` dan warna **Putih** sebagai `secondary`. Warna ini dipilih untuk mencerminkan identitas visual toko (misalnya, Real Madrid).
* **Konsistensi:** Dengan mengakses warna melalui **`Theme.of(context).colorScheme.primary`** di semua komponen (seperti `AppBar`, tombol, dan *background*), warna tema yang telah ditentukan akan otomatis diterapkan, memastikan konsistensi visual di seluruh aplikasi tanpa perlu *hardcode* warna di setiap widget.


---

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

### 1. Soal jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model Dart diperlukan untuk mengonversi data JSON menjadi objek Dart yang terstruktur dan type-safe. Tanpa model, kita hanya akan bekerja dengan Map<String, dynamic> yang memiliki beberapa konsekuensi:

**Konsekuensi tanpa Model:**
- **Validasi Tipe:** Tidak ada pengecekan tipe saat compile-time, error baru muncul saat runtime.
- **Null-Safety:** Sulit mengelola nullable values, risiko null pointer exception lebih tinggi.
- **Maintainability:** Kode sulit dipelihara karena harus mengingat struktur JSON dan key names, typo tidak terdeteksi hingga runtime.
- **Autocomplete:** IDE tidak bisa memberikan code suggestion karena tidak tahu struktur data.

**Keuntungan dengan Model:**
- Type-safe: Compiler menjamin tipe data benar.
- Null-safe: Dapat mendefinisikan field mana yang nullable.
- Readable: Kode lebih mudah dibaca dengan properti yang jelas.
- Reusable: Model dapat digunakan di berbagai bagian aplikasi.

### 2. Soal apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

**Package http:**
- Berfungsi untuk melakukan HTTP request dasar (GET, POST, PUT, DELETE).
- Tidak mengelola session atau cookie secara otomatis.
- Cocok untuk API stateless yang tidak memerlukan autentikasi berbasis cookie.

**CookieRequest (dari pbp_django_auth):**
- Mengelola session dan cookie secara otomatis.
- Menyimpan cookie autentikasi dari Django.
- Mengirimkan cookie di setiap request untuk menjaga session tetap aktif.
- Menyediakan method login/logout yang terintegrasi dengan Django.

**Perbedaan Peran:**
- http: Request tanpa session, setiap request independen.
- CookieRequest: Request dengan session persistence, mendukung autentikasi berbasis cookie Django.

### 2. Soal jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke semua komponen menggunakan Provider agar:

**Alasan Sharing:**
- **Konsistensi Session:** Semua komponen menggunakan session yang sama, cookie autentikasi tersimpan di satu tempat.
- **State Management:** Status login dapat diakses dari mana saja tanpa passing parameter.
- **Efisiensi:** Tidak perlu membuat instance baru di setiap widget, menghemat memori.
- **Sinkronisasi:** Perubahan state login otomatis tersinkronisasi ke seluruh aplikasi.

### 2. Soal jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

**Konfigurasi yang Diperlukan:**

1. **ALLOWED_HOSTS + 10.0.2.2:**
   - 10.0.2.2 adalah alamat localhost dari perspektif Android Emulator.
   - Tanpa ini, Django akan menolak request dari emulator.

2. **CORS (Cross-Origin Resource Sharing):**
   - Mengizinkan Flutter (domain berbeda) mengakses API Django.
   - Tanpa CORS, browser/app akan memblokir request karena same-origin policy.

3. **SameSite/Cookie Settings:**
   - Mengatur bagaimana cookie dikirim antara domain.
   - Diperlukan agar cookie session dapat diterima dari Flutter.

4. **Internet Permission (Android):**
   - Menambahkan permission di AndroidManifest.xml.
   - Tanpa ini, aplikasi Android tidak bisa melakukan network request.

**Konsekuensi jika tidak dikonfigurasi:**
- Request akan ditolak dengan error CORS atau Connection Refused.
- Cookie session tidak tersimpan atau tidak terkirim.
- Autentikasi gagal meskipun kredensial benar.

### 5. Soal jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

**Alur Pengiriman Data:**

1. **Input di Flutter:**
   - User mengisi form di ProductFormPage.
   - Data disimpan dalam state variables (_name, _price, dll).

2. **Validasi:**
   - Form divalidasi menggunakan validator pada setiap TextFormField.

3. **Pengiriman ke Django:**
   - Data dikonversi ke JSON menggunakan jsonEncode().
   - Dikirim via CookieRequest.postJson() ke endpoint Django.

4. **Proses di Django:**
   - Django menerima request, memvalidasi data.
   - Membuat instance model Product dan menyimpan ke database.
   - Mengembalikan response JSON (status success/fail).

5. **Response di Flutter:**
   - Flutter menerima response, mengecek status.
   - Menampilkan SnackBar untuk feedback.
   - Redirect ke HomePage jika berhasil.

6. **Menampilkan Data:**
   - Di ProductEntryListPage, memanggil fetchProducts().
   - Django mengembalikan JSON array semua produk.
   - JSON di-parse menjadi List<ProductEntry>.
   - Ditampilkan menggunakan ListView.builder.

### 6. Soal jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

**Alur Login:**

1. **Input di Flutter:**
   - User memasukkan username dan password di LoginPage.

2. **Kirim ke Django:**
   - Data dikirim via request.login() ke endpoint /auth/login/.

3. **Proses Django:**
   - Django memvalidasi kredensial menggunakan authenticate().
   - Jika valid, membuat session dan mengirim cookie.
   - Response berisi status dan informasi user.

4. **Response Flutter:**
   - CookieRequest menyimpan cookie session.
   - Status loggedIn berubah menjadi true.
   - Redirect ke MyHomePage.

**Alur Register:**

1. **Input di Flutter:**
   - User mengisi form registrasi (username, password, confirm password).

2. **Kirim ke Django:**
   - Data dikirim ke endpoint /auth/register/.

3. **Proses Django:**
   - Validasi data (password match, username unique).
   - Membuat user baru dengan User.objects.create_user().
   - Response berisi status success/fail.

4. **Response Flutter:**
   - Menampilkan dialog sukses/gagal.
   - Jika berhasil, redirect ke LoginPage.

**Alur Logout:**

1. **Trigger di Flutter:**
   - User menekan tombol Logout.

2. **Kirim ke Django:**
   - request.logout() memanggil endpoint /auth/logout/.

3. **Proses Django:**
   - Django menghapus session.
   - Response konfirmasi logout.

4. **Response Flutter:**
   - CookieRequest menghapus cookie lokal.
   - Status loggedIn menjadi false.
   - Redirect ke LoginPage.

### 7. Soal jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

**Setup Awal:**
1. Install package provider dan pbp_django_auth via flutter pub add.
2. Modifikasi main.dart untuk menyediakan CookieRequest menggunakan Provider.
3. Konfigurasi AndroidManifest.xml untuk menambahkan internet permission.

**Autentikasi:**
1. Buat login.dart untuk halaman login dengan form username/password.
2. Buat register.dart untuk halaman registrasi dengan validasi password.
3. Implementasi integrasi dengan Django auth endpoints.
4. Tambahkan logout functionality di product_card.dart.

**Model dan Integrasi Data:**
1. Buat model ProductEntry di models/product_entry.dart dengan factory fromJson dan toJson.
2. Tambahkan field isFeatured sesuai dengan model Django.
3. Buat product_entry_list.dart untuk fetch dan display data dari Django JSON endpoint.
4. Implementasi FutureBuilder untuk handling async data fetching.

**UI Components:**
1. Buat product_entry_card.dart untuk menampilkan card produk dengan thumbnail, nama, harga, category, dan badge featured.
2. Buat product_detail.dart untuk halaman detail produk dengan semua informasi lengkap.
3. Update productlist_form.dart untuk menambahkan checkbox is_featured dan integrasi POST ke Django.

**Navigasi:**
1. Update left_drawer.dart untuk menambahkan menu Product List.
2. Implementasi Navigator.push di product_entry_list.dart untuk navigasi ke detail page.
3. Update routing di semua halaman untuk konsistensi navigasi.

**Testing dan Refinement:**
1. Test alur login-register-logout.
2. Test CRUD produk (create via form, read via list, view detail).
3. Perbaiki indentasi dan formatting di semua file.
4. Commit dan push ke GitHub repository.