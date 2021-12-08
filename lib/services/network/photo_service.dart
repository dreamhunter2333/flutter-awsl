import 'package:awsl/models/photo.dart';
import 'package:awsl/services/network/network_manager.dart';
import 'package:awsl/services/network/network_service.dart';
import 'package:awsl/services/network/requests/photo/list_photo_request.dart';
import 'package:awsl/services/network/responses/photo/list_photo_response.dart';

class PhotoService extends NetworkService{

  Future<List<Photo>> listPhotos(uid, {page = 1, limit = 10}){
    ListPhotoRequest request = ListPhotoRequest();
    request.uid = uid;
    request.page = page;
    request.limit = limit;

    return NetworkManager.shared.request(request, 'GET').then((json){
      ListPhotoResponse response = ListPhotoResponse.fromJson(json);
      List<Photo> photos = response.photos;

      return photos;
    });
  }
}