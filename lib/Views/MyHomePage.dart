import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getApi/Controller/HomeController.dart';
import 'package:getApi/Provider/apiProvider.dart';
import 'package:getApi/Repository/reporsitory.dart';
import 'package:http/http.dart'as http;

class MyHomePage extends GetView<HomeController> {
 // final HomeController homeController=Get.put(HomeController(repository: MyRepository(apiClient: MyApiClient(httpClient: http.Client(),),),));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('Covid 19')),

    body: Container(
      child: GetX<HomeController>(
        initState: (state){
          Get.find<HomeController>().getAll();
          },
        builder: (_){
          return _.obj.length>0?
          ListView.builder(
            itemCount: _.obj.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text('${_.obj[index].name}'),
                subtitle: Text('${_.obj[index].categoryName}'),

              );
            }
           ):
           Center(child:CircularProgressIndicator());
        }),
      ),
    );
  }
}