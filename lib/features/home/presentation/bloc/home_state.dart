part of 'home_bloc.dart';

class HomeState extends Equatable {
  final GetUserResponse? usersList;

  const HomeState({this.usersList});

  HomeState copyWith({
    GetUserResponse? usersList,
  }) {
    return HomeState(
      usersList: usersList ?? this.usersList,
    );
  }

  @override
  List<Object?> get props => [usersList];
}
