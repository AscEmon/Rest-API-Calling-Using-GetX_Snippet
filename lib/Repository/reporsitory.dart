import 'package:meta/meta.dart';
import 'package:getApi/Provider/apiProvider.dart';

class MyRepository {

final MyApiClient apiClient;

MyRepository({@required this.apiClient}) : assert(apiClient != null);

getAll(){
  return apiClient.getAll();
}

}