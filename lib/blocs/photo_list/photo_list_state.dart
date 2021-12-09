import 'package:awsl/models/photo.dart';
import 'package:awsl/models/producer.dart';
import 'package:equatable/equatable.dart';

class PhotoListState extends Equatable{
  const PhotoListState({
    required this.producer,
    required this.nextLoadPage,
    required this.currentPhotos
  });

  List<Photo> get photos => currentPhotos ?? [];
  final List<Photo>? currentPhotos;

  final int? nextLoadPage;
  final Producer? producer;

  @override
  List<Object?> get props => [];
}

class PhotoListStateInitial extends PhotoListState{
  const PhotoListStateInitial({
    Producer? producer,
    int? nextLoadPage,
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos
  }): super(
    producer: producer,
    nextLoadPage: nextLoadPage,
    currentPhotos: currentPhotos
  );

  @override
  List<Photo> get photos => (currentPhotos ?? []) + List.filled(10, Photo());
}

class PhotoListStateLoadMoreInProgress extends PhotoListState {
  const PhotoListStateLoadMoreInProgress({
    Producer? producer,
    int? nextLoadPage,
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateLoadMoreInProgress.fromState(PhotoListState state,
      {
        Producer? producer,
        int? nextLoadPage,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos
      })
      : this(
      producer: state.producer,
      nextLoadPage: state.nextLoadPage,
      currentPhotos: state.currentPhotos
  );

  @override
  List<Photo> get photos => (currentPhotos ?? []) + List.filled(10, Photo());
}

class PhotoListStateReloadInProgress extends PhotoListState {
  const PhotoListStateReloadInProgress({
    Producer? producer,
    int? nextLoadPage,
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateReloadInProgress.fromState(PhotoListState state,
      {
        Producer? producer,
        int? nextLoadPage,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos
      })
      : this(
      producer: state.producer,
      nextLoadPage: state.nextLoadPage,
      currentPhotos: state.currentPhotos
  );

  @override
  List<Photo> get photos => List.filled(10, Photo());
}

class PhotoListStateLoadSuccess extends PhotoListState {
  const PhotoListStateLoadSuccess({
    Producer? producer,
    int? nextLoadPage,
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateLoadSuccess.fromState(PhotoListState state,
      {
        Producer? producer,
        int? nextLoadPage,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos
      })
      : this(
      producer: state.producer,
      nextLoadPage: state.nextLoadPage,
      currentPhotos: state.currentPhotos
  );

  @override
  List<Photo> get photos => currentPhotos ?? [];
}

class PhotoListStateLoadFailure extends PhotoListState {
  const PhotoListStateLoadFailure({
    Producer? producer,
    int? nextLoadPage,
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateLoadFailure.fromState(PhotoListState state,
      {
        Producer? producer,
        int? nextLoadPage,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos
      })
      : this(
      producer: state.producer,
      nextLoadPage: state.nextLoadPage,
      currentPhotos: state.currentPhotos
  );

  @override
  List<Photo> get photos => currentPhotos ?? [];
}