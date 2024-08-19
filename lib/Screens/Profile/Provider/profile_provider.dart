import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  XFile? _image;
  XFile? get image => _image;
// Pick an image.
  void getImage() async {
    _image = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  // seePass
  bool _seePass = false;
  bool get seePass => _seePass;

  void seePassCode() {
    if (_seePass == false) {
      _seePass = true;
    } else {
      _seePass = false;
    }
    notifyListeners();
  }
}
