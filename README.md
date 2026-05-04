# Pokémon Dex - Nama - Kelas

Aplikasi Flutter sederhana untuk mengenal berbagai jenis Pokémon. Aplikasi ini menampilkan daftar Pokémon, detail tipe, ability, weakness, role, dan partner yang cocok.

## Deskripsi

Aplikasi ini dibuat untuk tugas UAS pengembangan aplikasi dengan fitur:
- Daftar Pokémon lengkap dengan filter berdasarkan tipe
- Halaman detail Pokémon dengan informasi komprehensif
- Tipe Pokémon ditampilkan dengan badge berwarna untuk identifikasi visual
- Progress bar untuk setiap stat (HP, ATK, DEF, SP.ATK, SP.DEF, SPEED) dengan color coding:
  - Hijau: stat ≥ 120 (sangat tinggi)
  - Biru: stat ≥ 100 (tinggi)
  - Oranye: stat ≥ 80 (sedang)
  - Merah: stat < 80 (rendah)
- Mode gelap dan terang (Dark/Light mode) yang dapat diaktifkan dari tombol AppBar
- Informasi ability, weakness, deskripsi, role dalam tim, dan partner yang cocok
- Gambar Pokémon dari folder `images` dengan fallback emoji
- Desain Material 3 dengan Card yang elevated untuk tampilan modern

## Struktur Project

- `lib/main.dart` - entry point aplikasi
- `lib/models/pokemon.dart` - model data Pokémon
- `lib/screens/home_screen.dart` - tampilan daftar Pokémon
- `lib/screens/detail_screen.dart` - tampilan detail Pokémon
- `web/index.html` - konfigurasi title dan metadata web

## Cara Menjalankan

1. Buka terminal di folder project
2. Jalankan:
   ```bash
   flutter pub get
   flutter run
   ```

## Nama & Kelas

- Nama: Nama
- Kelas: Kelas

(Ganti `Nama` dan `Kelas` dengan data diri yang sebenarnya sebelum upload ke GitHub.)

## Deploy ke GitHub Pages

1. Buat repository baru di GitHub
2. Tambahkan project ini ke repo:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/username/repo-name.git
   git push -u origin main
   ```
3. Build web app:
   ```bash
   flutter build web --base-href "/repo-name/"
   ```
4. Deploy hasil build ke GitHub Pages:
   - Gunakan branch `gh-pages`, atau
   - Gunakan GitHub Actions dengan Flutter web deploy

## Catatan

- Pastikan file `web/index.html` sudah berisi title `Nama - Kelas | Pokémon Dex`.
- Ganti placeholder `username`, `repo-name`, `Nama`, dan `Kelas` sesuai akun GitHub dan data diri.
