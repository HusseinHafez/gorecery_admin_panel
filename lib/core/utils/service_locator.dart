import 'package:get_it/get_it.dart';
import 'package:groceryapp_admin_panel/core/functions/image_picker.dart';
import 'package:groceryapp_admin_panel/modules/Allproducts/controller/all_products_controller.dart';
import 'package:groceryapp_admin_panel/modules/Main_Screen/controller/main_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../modules/Add_product/controller/add_product_controller.dart';
final getIt=GetIt.instance;

Future<void> serviceLocator()async{
  getIt.registerLazySingleton<AppImagePicker>(() =>AppImagePicker(picker: ImagePicker()));
  getIt.registerLazySingleton<MainController>(() => MainController());
  getIt.registerLazySingleton<AllProductsController>(() => AllProductsController());
  getIt.registerLazySingleton<AddProductController>(() => AddProductController(appImagePicker: getIt()));
}