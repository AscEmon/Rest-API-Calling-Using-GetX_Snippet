import 'dart:convert';
import 'package:getApi/Model/MyModel.dart';
import 'package:getApi/Model/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://app.ringersoft.com/api/ringersoftfoodapp/test-category/2?fbclid=IwAR3OfylOShIlzWs7pQEt5kLSyBfQhLrjhlWcbA4P6GIr-GUj0WDQaDgjTd0';

const postUrl='https://reqres.in/api/users';

class MyApiClient {

final http.Client httpClient;

MyApiClient({@required this.httpClient});


getAll() async {
  try {
    var response = await httpClient.get(baseUrl);
    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<Data> listMyModel = jsonResponse['data'].map<Data>((map) { 
          return Data.fromJson(map);
        }).toList();
      return listMyModel;
    }else print ('erro -get');
  } catch(_){ }
}

Future<UserModel> postData(String name,String job )async{
   final response =await httpClient.post(postUrl,
   body: {
     "name":name,
     "job":job
   });

   if(response.statusCode==201)
   {
     print('Succesfully sent this data');
    final String responseString =response.body;
     return userModelFromJson(responseString);
   }
   else {
     return null;
   }




}




}