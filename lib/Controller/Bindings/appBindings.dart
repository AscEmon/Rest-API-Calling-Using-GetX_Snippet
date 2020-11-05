import 'package:get/get.dart';
import 'package:getApi/Controller/HomeController.dart';
import 'package:getApi/Provider/apiProvider.dart';
import 'package:getApi/Repository/reporsitory.dart';
import 'package:http/http.dart' as http;

class AppBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< HomeController>(() => HomeController(
    repository: MyRepository(
    apiClient: MyApiClient(httpClient: http.Client(),),),),);
  }
}