part of 'login_bloc.dart';

class LoginState extends Equatable {
  final ApiStatus? apiStatus;
  final String? message;
  const LoginState({this.apiStatus, this.message});

  LoginState copyWith({ApiStatus? apiStatus,String? message}){
    return LoginState(apiStatus:this.apiStatus ?? apiStatus,message: this.message ?? message);
  }

  @override
  List<Object?> get props => [apiStatus,message];
}
