part of 'authentication_bloc.dart';

enum AuthenticationStatus{unknown, unAuthenticated, authenticated}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState._( { this.status = AuthenticationStatus.unknown ,  this.user});

  const AuthenticationState.unknown(): this._();

  const AuthenticationState.authenticated(User user): this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unAuthenticated() : this._(status: AuthenticationStatus.unAuthenticated);
  

  @override
  // TODO: implement props
  List<Object?> get props => [status, user];

}


