import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagesProvider = StateNotifierProvider<ImagesState>((ref) {
  return ImagesState();
});

class ImagesState extends StateNotifier<List<Image>> {
  ImagesState()
      : super([
          Image.network(
              'https://www.vb-paradise.de/index.php/Attachment/10922-Zielscheibe-01-JPG/')
        ]);
  void addImage({String choice}) async {
    if (choice == 'gallery') {
      final file = await AsyncValue.guard(() => gallery());
      state.add(Image(image: FileImage(File(file.data.value.path))));
    } else {
      final file = await AsyncValue.guard(() => camera());
      state.add(Image(image: FileImage(File(file.data.value.path))));
    }
  }
}

Future<PickedFile> gallery() async => ImagePicker.platform
    .pickImage(source: ImageSource.gallery, imageQuality: 50);
Future<PickedFile> camera() async => ImagePicker.platform
    .pickImage(source: ImageSource.camera, imageQuality: 50);
