import 'dart:io';
import 'package:camera/camera.dart';

//membatasi akses ke kelas-kelas yang mewarisi CameraState hanya dalam file ini saja
sealed class CameraState {}

// CameraInitial adalah state awal sebelum kamera diinisialisasi.
final class CameraInitial extends CameraState {}

// CameraReady adalah state yang menunjukkan bahwa kamera sudah siap digunakan.
final class CameraReady extends CameraState {
  // controller: Mengontrol kamera, seperti memulai preview atau mengambil gambar.
  final CameraController controller;
  // selectedIndex: Menunjukkan kamera yang sedang aktif (misalnya, kamera depan atau belakang).
  final int selectedIndex;
  // flashMode: Menunjukkan mode flash saat ini (misalnya, auto, on, off).
  final FlashMode flashMode;
  // imageFile: Menyimpan file gambar yang baru saja diambil, jika ada.
  final File? imageFile;
  // snackbarMessage: Pesan yang akan ditampilkan di snackbar, jika ada.
  final String? snackbarMessage;

  CameraReady({
    // Semua parameter ini diperlukan untuk memastikan bahwa state ini 
    // memiliki semua informasi yang dibutuhkan untuk menampilkan UI kamera dengan benar.
    required this.controller,
    required this.selectedIndex,
    required this.flashMode,
    this.imageFile,
    this.snackbarMessage,
  });

  CameraReady copyWith({
    // copyWith memungkinkan kita membuat salinan dari state ini dengan beberapa nilai yang diubah.
    CameraController? controller,
    int? selectedIndex,
    FlashMode? flashMode,
    File? imageFile,
    String? snackbarMessage,  
    // clearSnackbar: Jika true, ini akan menghapus pesan snackbar dengan mengaturnya menjadi null.
    bool clearSnackbar = false,
  }) {
    return CameraReady(
      // Jika parameter baru diberikan, gunakan itu; jika tidak, gunakan nilai yang sudah ada.
      controller: controller ?? this.controller,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      flashMode: flashMode ?? this.flashMode,
      imageFile: imageFile ?? this.imageFile,
      // Jika clearSnackbar true, set snackbarMessage menjadi null; 
      // jika tidak, gunakan nilai yang sudah ada atau yang baru jika diberikan.
      snackbarMessage: clearSnackbar ? null : snackbarMessage ?? this.snackbarMessage,
    );
  }
}