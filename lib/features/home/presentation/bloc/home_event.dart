part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetUsersEvent extends HomeEvent {
  const GetUsersEvent();

  @override
  List<Object?> get props => [];
}

