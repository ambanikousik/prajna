part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class LandingState extends AuthState {}
class AuthErrorState extends AuthState{}
class AuthLoadingState extends AuthState {}
class AuthAppState extends AuthState {
  final String uuid;
  AuthAppState({@required this.uuid});
  @override
  List<Object> get props => [uuid];
}
