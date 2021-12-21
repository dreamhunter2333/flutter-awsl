import 'package:awsl/blocs/base_bloc.dart';
import 'package:awsl/blocs/photo_list/photo_list_event.dart';
import 'package:awsl/blocs/photo_list/photo_list_state.dart';
import 'package:awsl/models/photo.dart';
import 'package:awsl/models/producer.dart';
import 'package:awsl/services/network/photo_service.dart';
import 'package:awsl/services/network/producer_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListBloc extends BaseBloc<PhotoListEvent, PhotoListState>{
  PhotoListBloc({PhotoListState? initialState}) : super(initialState ?? const PhotoListStateInitial()){

    // FIXME: this should be injected in constructor.
    services = [PhotoService(), ProducerService()];

    on<PhotoListMoreLoaded>(_onMoreLoaded);
    on<PhotoListReloaded>(_onReloaded);
    on<PhotoListProducerUidChanged>(_onProducerUidChanged);

  }

  Future<void> _onMoreLoaded(PhotoListMoreLoaded event, Emitter<PhotoListState> emit) async {

    PhotoService photoService = findService(PhotoService);

    int nextLoadPage = state.nextLoadPage;

    emit(PhotoListStateLoadMoreInProgress.fromState(state));

    try {
      List<Photo> photos = await photoService.listPhotos(
          uid: state.producer?.uid ?? '', page: nextLoadPage, limit: 10);

      emit(PhotoListStateLoadSuccess.fromState(state, currentPhotos: (state.currentPhotos ?? []) + photos, nextLoadPage: nextLoadPage + 1));
    }
    catch (e){
      emit(PhotoListStateLoadFailure.fromState(state));
    }
  }

  void _onReloaded(PhotoListReloaded event, Emitter<PhotoListState> emit) async{

    PhotoService photoService = findService(PhotoService);

    int nextLoadPage = 1;

    emit(PhotoListStateLoadMoreInProgress.fromState(state));

    try {
      List<Photo> photos = await photoService.listPhotos(
          uid: state.producer?.uid ?? '', page: nextLoadPage, limit: 10);

      emit(PhotoListStateLoadSuccess.fromState(state, currentPhotos: photos, nextLoadPage: nextLoadPage + 1));
    }
    catch (e){
      emit(PhotoListStateLoadFailure.fromState(state));
    }
  }

  void _onProducerUidChanged(PhotoListProducerUidChanged event, Emitter<PhotoListState> emit) async{

    PhotoService photoService = findService(PhotoService);

    String uid = event.producer?.uid ?? '';
    int nextLoadPage = 1;

    emit(PhotoListStateLoadMoreInProgress.fromState(state));

    try {
      List<Photo> photos = await photoService.listPhotos(
          uid: uid, page: nextLoadPage, limit: 10);

      emit(PhotoListStateLoadSuccess.fromState(state, producer: event.producer , currentPhotos: photos, nextLoadPage: nextLoadPage + 1));
    }
    catch (e){
      emit(PhotoListStateLoadFailure.fromState(state));
    }

  }
}