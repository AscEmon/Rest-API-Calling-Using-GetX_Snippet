import 'package:get/get.dart';
import 'package:getApi/Model/MyModel.dart';
import 'package:meta/meta.dart';
import 'package:getApi/Repository/reporsitory.dart';

class HomeController extends GetxController {

final MyRepository repository;

HomeController({@required this.repository}) : assert(repository != null);

  final _obj = List<Data>().obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj;

 

 Future getAll() async{
   await repository.getAll().then((data){
     obj=data;
   });
   

 }

}