# Dokumentasi Jawaban Tugas Flutter (Tugas 7 & 8)

Dokumen ini berisi penjelasan mendalam mengenai konsep-konsep dasar Flutter dan implementasinya dalam proyek aplikasi toko.

---

## Tugas 7: Konsep Dasar Flutter

### 1. Widget Tree dan Hubungan Induk-Anak (Parent-Child)

**Widget Tree** adalah representasi hierarki komponen visual pada Flutter yang berbentuk pohon. Setiap node (simpul) dalam pohon ini adalah sebuah Widget. Widget paling atas disebut **Root Widget**.

* **Hubungan Parent-Child:**
    * **Parent (Induk):** Widget yang bertugas menyusun, mengatur, atau mengelola tata letak (layout) Widget lain di dalamnya.
    * **Child (Anak):** Widget yang dikelola atau diatur oleh Parent-nya.
* **Mekanisme Perubahan:** Ketika terjadi perubahan data (State), Flutter hanya menggambar ulang (re-render) bagian spesifik dari Widget Tree yang terpengaruh oleh perubahan tersebut, sehingga menghemat sumber daya dan mempercepat pembaruan UI.

---

### 2. Daftar dan Fungsi Widget yang Digunakan dalam Proyek

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

### 3. Fungsi Widget `MaterialApp` dan Perannya sebagai Widget Root

**Fungsi `MaterialApp`:**

* `MaterialApp` adalah widget pembungkus seluruh aplikasi Flutter yang mengadopsi Material Design.
* Fungsinya adalah menyediakan konfigurasi dan struktur dasar aplikasi agar widget Material Design lainnya (seperti `Scaffold`, `AppBar`, `Theme`) dapat berfungsi dan tampil sesuai gaya desain.

**Alasan sebagai Widget Root:**

* **Pemusatan Konfigurasi:** `MaterialApp` memungkinkan pendefinisian tema (`Theme`), rute navigasi (`Routes`), dan lokalisasi secara terpusat.
* **Konsistensi:** Tanpa `MaterialApp`, banyak komponen Material Design tidak akan memiliki konteks (Theme, Directionality, dll.) yang diperlukan untuk menggambar diri mereka secara konsisten di seluruh aplikasi.

---

### 4. Perbedaan StatelessWidget dan StatefulWidget

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

### 5. BuildContext dan Pentingnya di Flutter

**BuildContext** adalah sebuah objek yang merepresentasikan posisi sebuah Widget di dalam sebuah Widget Tree. Ini berfungsi sebagai "alamat" unik dari sebuah widget pada waktu tertentu.

**Pentingnya:**

* **Akses Hierarki:** `BuildContext` memungkinkan sebuah widget untuk mengetahui di mana ia berada dan mengakses widget atau data di atasnya dalam *tree*.
* **Akses Layanan:** Ini sangat penting untuk mengakses layanan yang diwariskan (*inherited services*) seperti `Theme.of(context)`, `MediaQuery.of(context)`, atau `ScaffoldMessenger.of(context)`.

**Penggunaan di `build()`:**

* Setiap metode `build()` menerima `BuildContext context` sebagai parameter.
* Contoh: Untuk mendapatkan warna tema aplikasi, kita menggunakan `Theme.of(context)`. Dengan adanya `context`, Flutter tahu dari posisi widget mana ia harus mencari data tema.

---

### 6. Konsep "Hot Reload" dan Perbedaannya dengan "Hot Restart"

| Fitur | Hot Reload | Hot Restart |
| :--- | :--- | :--- |
| **Kecepatan** | Sangat Cepat (Sub-detik) | Cepat (Beberapa detik) |
| **State Aplikasi** | **Dipertahankan.** Data dan *state* aplikasi (seperti posisi *scroll* atau nilai *counter*) tidak hilang. | **Di-*reset*.** Aplikasi dimulai ulang dari awal (*initial state*), semua *state* dan data hilang. |
| **Perubahan Kode** | Hanya menyuntikkan kode baru yang dimodifikasi ke dalam Dart Virtual Machine yang sedang berjalan. | Memuat ulang seluruh kode Dart dan Java/Kotlin/Swift, menjalankan fungsi `main()` dari awal. |
| **Kapan Digunakan** | Untuk sebagian besar perubahan UI dan logika. | Untuk perubahan yang memerlukan inisialisasi ulang (misalnya, perubahan pada `main()` atau variabel `final` global). |

---

## Tugas 8: Navigasi dan Struktur UI

### 1. Perbedaan Navigator.push() dan Navigator.pushReplacement()

| Metode | Mekanisme | Efek Tombol Back | Kasus Penggunaan (Football Shop) |
| :--- | :--- | :--- | :--- |
| `Navigator.push()` | Menambahkan halaman baru **di atas** halaman saat ini ke dalam *stack* navigasi. | User **bisa** kembali ke halaman sebelumnya. | Untuk melihat **Detail Produk** (agar bisa kembali ke Daftar Produk) atau membuka **Form Create Produk** (agar bisa *cancel* dan kembali ke Home). |
| `Navigator.pushReplacement()` | **Mengganti** halaman saat ini dengan halaman baru; halaman sebelumnya **dihapus** dari *stack*. | User **tidak bisa** kembali ke halaman sebelumnya. | Setelah **Login Berhasil** (agar user tidak bisa kembali ke halaman login dengan tombol *back*). |

---

### 2. Pemanfaatan Hierarchy Widget untuk Konsistensi Halaman

* **`Scaffold`:** Berfungsi sebagai fondasi yang konsisten di semua halaman (`HomePage`, `ProductFormPage`, dll.). `Scaffold` menyediakan struktur standar (AppBar + Body + Drawer), memastikan layout dasar seragam.
* **`AppBar`:** Digunakan untuk menciptakan *header* yang seragam di seluruh aplikasi. Semua halaman memiliki *header* dengan warna, *style*, dan biasanya fungsi yang sama.
* **`Drawer`:** Menyediakan navigasi global yang konsisten. Dengan menempatkan `Drawer` di dalam `Scaffold`, User dapat mengakses semua halaman utama dari menu navigasi samping yang sama, tanpa harus kembali ke Home terlebih dahulu.

---

### 3. Kelebihan Layout Widget (Padding, SingleChildScrollView, ListView) untuk Elemen Form

| Widget | Kelebihan | Contoh Penggunaan dalam Aplikasi |
| :--- | :--- | :--- |
| **`Padding`** | Memberikan ruang yang nyaman (*spacing*) antar elemen, meningkatkan keterbacaan (*readability*), dan mencegah UI terlihat terlalu padat (*cramped*). | Digunakan pada `body` `Scaffold` di `ProductFormPage` dengan `EdgeInsets.all(16.0)` agar form tidak menempel pada tepi layar. |
| **`SingleChildScrollView`** | Mengatasi *overflow* (konten melebihi layar), mendukung berbagai ukuran layar (*responsive*), dan mencegah *keyboard overlap* dengan *input field* saat *user* mengetik. | Digunakan sebagai *wrapper* untuk `Column` yang berisi semua *form fields* agar seluruh inputan tetap bisa diakses melalui *scroll* saat *keyboard* muncul. |
| **`ListView` / `GridView`** | Efisien untuk daftar panjang (*lazy loading*), memiliki fitur *scrolling* bawaan, dan hemat memori karena hanya merender elemen yang terlihat di layar. | Menggunakan **`GridView.count`** (dengan `shrinkWrap: true`) di halaman utama untuk menampilkan 3 tombol (`All Products`, `My Products`, `Create Product`) dalam tata letak *grid* 3 kolom yang terstruktur. |

---

### 4. Penyesuaian Warna Tema Aplikasi (Identitas Visual)

Warna tema disesuaikan di file `main.dart` menggunakan konfigurasi tema berbasis Material Design 3.

* **Penerapan Warna:** Digunakan `ColorScheme.fromSeed()` dengan menetapkan warna **Kuning Emas (`#EAB308`)** sebagai warna `primary` dan warna **Putih** sebagai `secondary`. Warna ini dipilih untuk mencerminkan identitas visual toko (misalnya, Real Madrid).
* **Konsistensi:** Dengan mengakses warna melalui **`Theme.of(context).colorScheme.primary`** di semua komponen (seperti `AppBar`, tombol, dan *background*), warna tema yang telah ditentukan akan otomatis diterapkan, memastikan konsistensi visual di seluruh aplikasi tanpa perlu *hardcode* warna di setiap widget.
