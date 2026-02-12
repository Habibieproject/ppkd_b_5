import 'package:flutter/material.dart';

/// ContainerDay7 adalah widget "stateless":
/// - Tidak menyimpan state/ubah-ubah data internal.
/// - Tampilan ditentukan murni dari build().
class ContainerDay7 extends StatelessWidget {
  /// Constructor const:
  /// - Membuat widget bisa di-compile-time constant jika memungkinkan.
  /// - Lebih efisien (rebuild lebih ringan) saat tidak ada state berubah.
  const ContainerDay7({super.key});

  @override
  Widget build(BuildContext context) {
    // build() mengembalikan struktur UI (widget tree) untuk ditampilkan.
    return Column(
      // children: daftar widget yang disusun vertikal (atas ke bawah).
      children: [
        Container(
          // padding: jarak di DALAM container (antara border/decoration dan child).
          padding: EdgeInsets.all(12),

          // margin: jarak di LUAR container (memisahkan container dari widget lain).
          margin: EdgeInsets.all(12),

          // color: warna background container (dinonaktifkan).
          // Catatan: kalau memakai decoration, biasanya jangan pakai color sekaligus.
          // color: Colors.black,

          // decoration: styling "kotak" (background, border radius, shadow, gradient, dsb).
          decoration: BoxDecoration(
            // color: warna dasar background.
            // Jika gradient diset, gradient akan "menimpa" color ini untuk area paint.
            color: Color(0xffcebfa2),

            // borderRadius: membulatkan sudut container.
            borderRadius: BorderRadius.circular(16),

            // boxShadow: membuat bayangan di belakang container.
            boxShadow: [
              BoxShadow(
                // color: warna bayangan (dengan opacity).
                color: Colors.black.withOpacity(0.80),

                // offset: arah pergeseran bayangan (x, y).
                // (4, 8) berarti ke kanan 4px dan ke bawah 8px.
                offset: Offset(4, 8),

                // blurRadius: tingkat blur (semakin besar semakin lembut).
                blurRadius: 10,
              ),
            ],

            // gradient: memberi gradasi warna sebagai background.
            gradient: LinearGradient(
              // begin/end: menentukan arah gradasi.
              // NOTE: biasanya pakai Alignment.topLeft / Alignment.bottomRight (bukan AlignmentGeometry).
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,

              // colors: daftar warna yang akan "di-interpolate".
              // Di sini dibuat pola hitam-putih bergantian.
              colors: [Colors.black, Colors.white, Colors.black, Colors.white],

              // stops: posisi tiap warna dari 0.0 s/d 1.0.
              // GOTCHA: stops idealnya meningkat (non-decreasing). Nilai [0.1, 0.1, 0, 0]
              // bisa bikin hasil aneh/ tidak konsisten. Umumnya disusun naik.
              stops: [0.1, 0.1, 0, 0],
            ),
          ),

          // child: isi utama dari container ini.
          child: Row(
            // mainAxisAlignment.spaceBetween:
            // - memberi jarak maksimum antara anak pertama dan terakhir.
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon kursi, size 100.
              Icon(Icons.chair, size: 100),

              // Column untuk teks promosi (disusun vertikal).
              Column(
                // crossAxisAlignment.start: rata kiri agar teks sejajar dari kiri.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("The Special", style: TextStyle(fontSize: 16)),
                  Text(
                    "Offer Up to",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // Text.rich: memungkinkan beberapa style dalam 1 paragraf.
                  Text.rich(
                    TextSpan(
                      // children: pecahan-pecahan teks dengan style berbeda.
                      children: [
                        TextSpan(
                          text: "30% ",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "Off", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),

                  // Container kecil sebagai tombol "Shop Now" (secara tampilan saja).
                  Container(
                    // padding: ruang dalam supaya terlihat seperti pill button.
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),

                    // decoration: membuat bentuk kapsul dan warna latar.
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff946921),
                    ),

                    child: Text(
                      "Shop Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Row kedua: menampilkan 3 kotak sejajar (horizontal).
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),

              // BoxDecoration dengan borderRadius + border.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(), // default warna hitam, ketebalan 1.
              ),

              // Row di dalam container (sebenarnya tidak perlu kalau hanya 1 Text).
              child: Row(children: [Text("Kotak Kosong")]),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              child: Row(children: [Text("Kotak Kosong")]),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              child: Row(children: [Text("Kotak Kosong")]),
            ),
          ],
        ),
      ],
    );
  }
}
