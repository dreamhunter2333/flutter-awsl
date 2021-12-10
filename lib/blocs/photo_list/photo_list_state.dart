import 'package:awsl/models/photo.dart';
import 'package:awsl/models/producer.dart';
import 'package:equatable/equatable.dart';

class PhotoListState extends Equatable{
  const PhotoListState({
    required this.producer,
    required this.currentPhotos,
    required this.nextLoadPage
  });

  List<Photo> get photos => currentPhotos ?? [];
  final List<Photo>? currentPhotos;

  final Producer? producer;
  final int nextLoadPage;

  @override
  List<Object?> get props => [];
}

class PhotoListStateInitial extends PhotoListState{
  const PhotoListStateInitial({
    Producer? producer,
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos,
    int nextLoadPage = 0
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
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos,
    int nextLoadPage = 0
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateLoadMoreInProgress.fromState(PhotoListState state,
      {
        Producer? producer,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos,
        int nextLoadPage = 0
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
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos,
    int nextLoadPage = 0
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateReloadInProgress.fromState(PhotoListState state,
      {
        Producer? producer,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos,
        int nextLoadPage = 0
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
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos,
    int nextLoadPage = 0
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateLoadSuccess.fromState(PhotoListState state,
      {
        Producer? producer,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos,
        int nextLoadPage = 0
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
    List<Photo>? currentPhotos,
    List<Photo>? emptyPhotos,
    int nextLoadPage = 0
  }): super(
      producer: producer,
      nextLoadPage: nextLoadPage,
      currentPhotos: currentPhotos
  );

  PhotoListStateLoadFailure.fromState(PhotoListState state,
      {
        Producer? producer,
        List<Photo>? currentPhotos,
        List<Photo>? emptyPhotos,
        int nextLoadPage = 0
      })
      : this(
      producer: state.producer,
      nextLoadPage: state.nextLoadPage,
      currentPhotos: state.currentPhotos
  );

  @override
  List<Photo> get photos => currentPhotos ?? [];
}