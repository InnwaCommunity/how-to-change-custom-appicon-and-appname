part of 'home_state_manage_bloc.dart';

sealed class HomeStateManageEvent extends Equatable {
  const HomeStateManageEvent();

  @override
  List<Object> get props => [];
}

class ChangePicEvent extends HomeStateManageEvent{
  final List<LogoStatus> logoStatus;
  const ChangePicEvent({required this.logoStatus});
}
