import 'package:get/get.dart';
import 'package:makeup_app/data/repository/http_controller.dart';
import 'package:makeup_app/data/repository/http_repository.dart';
import 'package:makeup_app/data/repository/product_repository.dart';

class HttpBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IProductRepository>(HttpRepository()); 
    Get.put(HttpController(Get.find()));
  }

}


//http_repository.dart