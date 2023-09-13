import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/features/home/data/models/get_user_response.dart';
import 'package:untitled/features/home/domain/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetUsersEvent>(_getUsers);
  }

  final _homeRepository = HomeRepository();

  Future<void> _getUsers(GetUsersEvent event,
      Emitter<HomeState> emit) async {
    final result = await _homeRepository.getUsers();

    emit(state.copyWith(
      usersList: result,
    ));
  }

}
