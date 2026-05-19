# PDF Table Extractor Dashboard

Dashboard untuk mengekstrak tabel dari file PDF, dengan preview, pencarian keyword, dan ekspor multi-format.

## 🚀 Cara Menjalankan

### Persyaratan
- Python 3.8+
- pip

### Langkah:
```bash
# 1. Install dependensi (otomatis lewat script)
bash start.sh

# Atau manual:
pip install flask pdfplumber camelot-py tabula-py openpyxl pypdf

# 2. Jalankan aplikasi
python3 app.py

# 3. Buka browser
# http://localhost:5050
```

## ✨ Fitur

| Fitur | Keterangan |
|-------|-----------|
| 📁 Upload PDF | Drag & drop atau klik untuk upload (maks 50MB) |
| 👁️ Preview PDF | Tampilan langsung file PDF di browser |
| 🔍 Pencarian Keyword | Cari tabel/halaman berdasarkan kata kunci |
| ⚡ Ekstraksi Multi-metode | pdfplumber + camelot sebagai fallback |
| 📥 Export CSV | Export tabel ke format CSV |
| 📥 Export JSON | Export ke JSON dengan key dari header |
| 📥 Export Excel | Export ke .xlsx dengan styling otomatis |

## 🔧 Metode Ekstraksi

### 1. Auto (Rekomendasi)
Mencoba `pdfplumber` terlebih dahulu, jika gagal otomatis beralih ke `camelot`.

### 2. pdfplumber
- Terbaik untuk tabel dengan garis (grid lines)
- Strategi fallback: `lines → text`
- Cocok untuk dokumen BPS, laporan pemerintah

### 3. camelot
- Terbaik untuk tabel yang kompleks/merged cells
- Mode: `lattice` (garis fisik) → `stream` (spasi/kolom)
- Menampilkan accuracy score

## 📂 Struktur Folder

```
pdf_dashboard/
├── app.py          # Aplikasi Flask utama
├── start.sh        # Script startup
├── uploads/        # File PDF yang diupload
└── exports/        # File hasil ekspor (CSV/JSON/Excel)
```

## 📋 Contoh Penggunaan

1. Upload file `kecamatan-tirto-dalam-angka-2025.pdf`
2. Di kolom pencarian, ketik `5.7` → klik **Cari**
3. Klik **Hal. 103** di hasil pencarian
4. Klik **Ekstrak Tabel** → tabel muncul
5. Klik **CSV / JSON / Excel** untuk download

## ⚠️ Troubleshooting

| Masalah | Solusi |
|---------|--------|
| Tidak ada tabel ditemukan | Coba ganti metode ekstraksi |
| Tabel berantakan | Gunakan `camelot` untuk tabel kompleks |
| PDF tidak bisa dibaca | PDF mungkin scan/gambar, perlu OCR |
| Error camelot | Install `opencv-python`: `pip install opencv-python` |
