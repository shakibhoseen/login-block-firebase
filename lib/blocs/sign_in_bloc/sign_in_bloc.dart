import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc({
    required UserRepository userRepository 
  }) :_userRepository = userRepository, super(SignInInitial()) {
    on<SignInRequired>((event, emit) async{
      // TODO: implement event handler
      emit(SignInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      }on FirebaseAuthException catch (e){
         emit(SignInFailure(message: e.message));
      }
       catch (e) {
        emit(SignInFailure(message: 'unknown'));
      }
    });

    on<SignOutRequired>((event, emit)async{
       await _userRepository.logOut();
    });
  }
}
