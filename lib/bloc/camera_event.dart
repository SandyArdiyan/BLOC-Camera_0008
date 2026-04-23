import 'dart:io';
import 'package:flutter/material.dart';

//membatasi akses ke kelas-kelas yang mewarisi CameraEvent hanya dalam file ini saja
sealed class CameraEvent {}

final class InitializeCamera extends CameraEvent {}
final class SwitchCamera extends CameraEvent {}
final class ToggleFlash extends CameraEvent {}
final class TakePicture extends CameraEvent {
  final void Function(File imageFile) onPictureTaken;
  TakePicture(this.onPictureTaken);
}

final class TapToFocus extends CameraEvent {
  final Offset position;
  final Size previewSize;
  TapToFocus(this.position, this.previewSize);
}

final class PickImageFromGallery extends CameraEvent {}
final class OpenCameraAndCapture extends CameraEvent {
  final BuildContext context;
  OpenCameraAndCapture(this.context);
}

final class DeleteImage extends CameraEvent {}
final class ClearSnackbar extends CameraEvent {}
final class RequestPermissions extends CameraEvent {}

// kesimpulan: Kode ini mendefinisikan berbagai event yang dapat terjadi dalam aplikasi kamera, 
// seperti inisialisasi kamera, pengambilan gambar, dan pengaturan fokus. 
// Setiap event memiliki data yang relevan untuk menjalankan aksi yang sesuai.