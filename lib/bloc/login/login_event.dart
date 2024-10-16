part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class ClickLoginEvent extends LoginEvent{
  final String firstname,lastname;

  const ClickLoginEvent(this.firstname, this.lastname);

  @override
  List<Object?> get props => [firstname,lastname];

}