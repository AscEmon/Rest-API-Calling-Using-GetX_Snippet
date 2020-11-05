import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getApi/Controller/HomeController.dart';
import 'package:getApi/Provider/apiProvider.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends GetView<HomeController> {
  // final HomeController homeController=Get.put(HomeController(repository: MyRepository(apiClient: MyApiClient(httpClient: http.Client(),),),));
  final TextEditingController nameController=TextEditingController();
  final TextEditingController jobController=TextEditingController();

  final MyApiClient apiClient=MyApiClient(httpClient: http.Client());
  //final  UserModel user=UserModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BoilerPlate of Get x')),
      body: Container(
        child: SingleChildScrollView(
                  child: Column(
            children: [
              Container(
                height: Get.height / 1.8,
                child: GetX<HomeController>(initState: (state) {
                  Get.find<HomeController>().getAll();
                }, builder: (_) {
                  return _.obj.length > 0
                      ? ListView.builder(
                          itemCount: _.obj.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text('${_.obj[index].name}'),
                                subtitle: Text('${_.obj[index].categoryName}'),
                              ),
                            );
                          })
                      : Center(child: CircularProgressIndicator());
                }),
              ),
              Container(
                 child: Column(
                   children: [
                     TextField(
                       controller:nameController ,
                     ),
                     TextField(
                       controller: jobController,
                     ),

                     SizedBox(height: 10,),

                     RaisedButton(
                       child: Text('Post'),
                       onPressed: () async{
                         String name =nameController.text;
                         String job=nameController.text;
                         await  apiClient.postData(name, job);   
 
                       },
                     ),
                     SizedBox(height: 10,),
                    //  Obx(()=>
                    //     Text(user.id+"is create and the name is "+user.name))
                       
                       


                   ],
                 ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
