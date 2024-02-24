part of 'home_state_manage_bloc.dart';

sealed class HomeStateManageState extends Equatable {
  const HomeStateManageState();
  
  @override
  List<Object> get props => [];
}

final class HomeStateManageInitial extends HomeStateManageState {}

class ChangedPicState extends HomeStateManageState{
  final List<LogoStatus> logoStatus;
  final DateTime date;
  const ChangedPicState({required this.logoStatus,required this.date});

  @override
  List<Object> get props => [logoStatus,date];
}
