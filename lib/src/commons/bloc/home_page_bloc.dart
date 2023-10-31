import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageLoading()) {
    on<HomePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

sealed class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageLoading extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageReady extends HomePageState {
  @override
  List<Object> get props => [];
}

sealed class HomePageEvent extends Equatable {

  const HomePageEvent();
}
