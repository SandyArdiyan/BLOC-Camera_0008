import 'dart:io';

import 'package:flutter/material.dart';

sealed class CameraEvent {}

final class InitializeCamera extends CameraEvent {}
final class SwitchCamera extends CameraEvent {}
final class ToggleFlash extends CameraEvent {}
final class TakePicture extends CameraEvent {
  final void Function(File imageFile) onPictureTaken;
  TakePicture(this.onPictureTaken);
}
final class TopFoucus extends CameraEvent {\
  final Offset position;
  final Size previewSize;
  TopFoucus(this.position, this.previewSize);
}



