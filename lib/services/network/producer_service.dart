import 'package:awsl/models/producer.dart';
import 'package:awsl/services/network/network_manager.dart';
import 'package:awsl/services/network/network_service.dart';
import 'package:awsl/services/network/requests/photo/get_producer_photo_count_request.dart';
import 'package:awsl/services/network/requests/producer/list_producer_request.dart';
import 'package:awsl/services/network/responses/photo/get_producer_photo_count_response.dart';
import 'package:awsl/services/network/responses/producer/list_producer_response.dart';

class ProducerService extends NetworkService{

  Future<List<Producer>> listProducers(){
    ListProducerRequest request = ListProducerRequest();

    return NetworkManager.shared.request(request, 'GET').then((json){
      ListProducerResponse response = ListProducerResponse.fromJson(json);
      List<Producer> producers = response.producers;

      return producers;
    });
  }


  Future<int> getProducerPhotoCount(uid){
    GetProducerPhotoCountRequest request = GetProducerPhotoCountRequest();
    request.uid = uid;

    return NetworkManager.shared.request(request, 'GET').then((json){
      GetProducerPhotoCountResponse response = GetProducerPhotoCountResponse.fromJson(json);
      int count = response.count;

      return count;
    });
  }

}