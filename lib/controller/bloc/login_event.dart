part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class Login extends LoginEvent{
  final String username;
  final String password;

  Login({required this.username, required this.password});
}
