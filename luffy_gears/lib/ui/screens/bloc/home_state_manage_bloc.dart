import 'package:connect_native/models/logo_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state_manage_event.dart';
part 'home_state_manage_state.dart';

class HomeStateManageBloc extends Bloc<HomeStateManageEvent, HomeStateManageState> {
  HomeStateManageBloc() : super(HomeStateManageInitial()) {
    on<HomeStateManageEvent>((event, emit) {});
    on<ChangePicEvent>((event, emit) {
      DateTime date=DateTime.now();
       List<LogoStatus> logoStatus=event.logoStatus;
       emit(ChangedPicState(logoStatus: logoStatus,date: date));
    },);
  }
}
