# 📱 Parahita App — Aplikasi Android

> **The Real Uniform & Promotion** — Aplikasi mobile resmi PT. Parahita Prima Sentosa

---

## 🎯 Fitur Utama

| Fitur | Deskripsi |
|-------|-----------|
| 🏠 **Company Profile** | Halaman utama dengan info perusahaan, statistik, dan promo |
| 🎠 **Promo Carousel** | Banner promo otomatis yang dapat dikustomisasi |
| 📦 **Katalog Produk** | 8 kategori produk dengan galeri foto |
| 📋 **Form Pemesanan** | Formulir inquiry + integrasi WhatsApp langsung |
| 🔔 **Notifikasi** | Notifikasi promo & info dengan badge counter |
| 🗺️ **Kontak & Maps** | Google Maps + tombol direct ke WA/Telepon/Web |
| ❓ **FAQ** | Pertanyaan umum yang bisa di-expand |

---

## 🛠️ Teknologi

- **Framework**: Flutter 3.x (cross-platform Android + iOS)
- **Bahasa**: Dart
- **Maps**: Google Maps Flutter
- **Notifikasi**: Flutter Local Notifications
- **Animasi**: animate_do + Flutter animations
- **HTTP**: url_launcher (WA, telepon, browser)
- **UI**: Material Design 3 + custom theme

---

## 🚀 Cara Menjalankan

### Prasyarat
- Flutter SDK 3.0+ terinstall
- Android Studio / VS Code dengan plugin Flutter
- Android device / emulator

### Langkah Setup

```bash
# 1. Clone / extract project
cd parahita_app

# 2. Install dependencies
flutter pub get

# 3. Download font Playfair Display & Outfit dari Google Fonts
#    Letakkan di folder: assets/fonts/
#    - PlayfairDisplay-Regular.ttf
#    - PlayfairDisplay-Bold.ttf
#    - Outfit-Regular.ttf
#    - Outfit-Medium.ttf
#    - Outfit-Bold.ttf

# 4. Tambahkan Google Maps API Key di:
#    android/app/src/main/AndroidManifest.xml
#    Ganti: YOUR_GOOGLE_MAPS_API_KEY

# 5. Jalankan aplikasi
flutter run
```

---

## ⚙️ Konfigurasi yang Perlu Diubah

### 1. Google Maps API Key
Di file `android/app/src/main/AndroidManifest.xml`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="ISI_API_KEY_ANDA_DI_SINI"/>
```
> Dapatkan API Key di: https://console.cloud.google.com

### 2. Nomor WhatsApp
Di file `lib/theme.dart`:
```dart
static const String waNumber = '628XXXXXXXXXX'; // Ganti nomor WA aktif
```

### 3. Data Produk & Promo
Di file `lib/models/app_data.dart` — edit daftar `categories` dan `promos`

### 4. Koordinat Kantor
Di file `lib/screens/contact_screen.dart`:
```dart
static const LatLng _officeLocation = LatLng(-6.xxxx, 106.xxxx);
```

---

## 📁 Struktur Proyek

```
lib/
├── main.dart                    # Entry point
├── theme.dart                   # Tema & warna & konstanta
├── models/
│   └── app_data.dart            # Data model & data statis
└── screens/
    ├── splash_screen.dart       # Splash screen animasi
    ├── main_nav.dart            # Bottom navigation
    ├── home_screen.dart         # Beranda + promo + kategori
    ├── product_screen.dart      # Katalog produk + galeri
    ├── order_screen.dart        # Form pemesanan
    ├── notification_screen.dart # Notifikasi & promo
    └── contact_screen.dart      # Kontak + Google Maps + FAQ
```

---

## 🎨 Design System

| Token | Value |
|-------|-------|
| **Primary** | `#1A2B4A` — Deep Navy |
| **Secondary** | `#C8A84B` — Gold |
| **Surface** | `#F8F7F4` — Warm White |
| **Font Display** | Playfair Display |
| **Font Body** | Outfit |

---

## 📦 Build APK

```bash
# Debug APK
flutter build apk --debug

# Release APK (perlu signing)
flutter build apk --release

# App Bundle untuk Play Store
flutter build appbundle --release
```

---

## 📞 Kontak

**PT. Parahita Prima Sentosa**  
Kawasan Industri Multiguna Blok B No. 10A  
📞 021-5399261  
🌐 www.seragamparahita.com

---

*Dibuat dengan ❤️ menggunakan Flutter*
