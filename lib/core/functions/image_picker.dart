import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker{
  final ImagePicker picker ;
  AppImagePicker({required this.picker});

  pickImage({bool isCamera=false})async {
    if(!kIsWeb){
      XFile? image = await picker.pickImage(source:isCamera?ImageSource.camera:ImageSource.gallery);
      if(image !=null){
      return File(image.path);
      }
    }else if(kIsWeb){
        XFile? image = await picker.pickImage(source:isCamera?ImageSource.camera:ImageSource.gallery);
        if(image !=null){
          return image.readAsBytes();
        }
    }else{
      if (kDebugMode) {
        print('No Image Picked');
      }
    }
  }
}