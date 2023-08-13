import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp_admin_panel/core/functions/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductController extends ChangeNotifier {
  AddProductController({required this.appImagePicker});
  final AppImagePicker appImagePicker;
  static AddProductController get(BuildContext context) => Provider.of(context);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? categoryValue;
  String kgRadioButtonValue = 'kg';
  String pieceRadioButtonValue = 'piece';
  bool isPiece = false;
  String? radioButtonGroupValue;

  void onChangedKgRadioButton(String? value) {
    radioButtonGroupValue = value;
    isPiece = false;
    notifyListeners();
  }

  void onChangedPieceRadioButton(String? value) {
    radioButtonGroupValue = value;
    isPiece = true;
    notifyListeners();
  }

  void onChangedDropDownMeun(String? value) {
    categoryValue = value!;
    notifyListeners();
  }

  File? pickedImage;
  Uint8List? webImage=Uint8List(8);
  pickImage() async {
    if (kIsWeb) {
      webImage = await appImagePicker.pickImage();
      pickedImage=File('a');
      notifyListeners();
    } else if (!kIsWeb) {
      pickedImage = await appImagePicker.pickImage();
      notifyListeners();
    } else {
      if (kDebugMode) {
        print('Something is Wrong');
      }
    }
  }
  clearImage(){
    pickedImage=null;
    webImage=Uint8List(8);
    notifyListeners();
  }

  clearForm(){
    pickedImage=null;
    categoryValue=null;
    webImage=Uint8List(8);
    titleController.clear();
    priceController.clear();
    isPiece=false;
    radioButtonGroupValue=null;
    notifyListeners();
  }
}
