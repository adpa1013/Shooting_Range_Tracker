import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final cameraProvider = FutureProvider<PickedFile>((ref) async {
  PickedFile foto = await ImagePicker.platform
      .pickImage(source: ImageSource.camera, imageQuality: 50);
  return foto;
});

final galleryProvider = FutureProvider<PickedFile>((ref) async {
  PickedFile foto = await ImagePicker.platform
      .pickImage(source: ImageSource.gallery, imageQuality: 50);
  return foto;
});
