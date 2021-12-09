import 'package:equatable/equatable.dart';

abstract class PhotoListEvent extends Equatable{
  const PhotoListEvent();

  @override
  List<Object?> get props => [];
}

class PhotoListProducerUidChanged extends PhotoListEvent{
  const PhotoListProducerUidChanged({required this.producerUid});

  final String producerUid;

  @override
  List<Object?> get props => [super.props];
}

class PhotoListMoreLoaded extends PhotoListEvent{
  const PhotoListMoreLoaded();
}

class PhotoListReloaded extends PhotoListEvent{
  const PhotoListReloaded();
}