import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class HelperFunctions {
  static Future<void> onImageButtonPressed(
    ImageSource source,
    ImagePicker _picker,
  ) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );
      log(pickedFile!.path);
    } catch (e) {
      log(e.toString());
    }
  }
}
