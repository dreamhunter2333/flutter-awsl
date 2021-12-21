import 'package:awsl/services/base_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocServable{

  List<BaseService>? services;

  T? findService<T>(Type type){

    if(services == null){
      return null;
    }
    
    return services!.where((element) => element.runtimeType == type).first as T;
  }
}

class BaseBloc<T,V> extends Bloc<T,V> with BlocServable{
  BaseBloc(V initialState) : super(initialState);
  BaseBloc.fromServices(V initialState, {required this.services}) : super(initialState);

  @override
  List<BaseService>? services;

  void dispose() {
    // Implemented by subclass.
  }
}

