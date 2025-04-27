import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async{
      emit(LoginLoading());
      await Future.delayed( const Duration(seconds: 2));

      if(event.username == 'admin' && event.password == 'password'){
        emit(LoginSuccess());
      }else{
        emit(LoginFailure("Invalid username and password"));
      }
    });
  }
}
