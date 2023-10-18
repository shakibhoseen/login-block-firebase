part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable{

  const AuthenticationEvent();
  
}

class AuthenticationUserChanged extends AuthenticationEvent{
  final User? user;

    const AuthenticationUserChanged(this.user);
    
      @override
      // TODO: implement props
      List<Object?> get props => [user];
}
