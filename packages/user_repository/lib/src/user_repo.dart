
import 'package:firebase_auth/firebase_auth.dart';

import 'models/models.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> setUserdata(MyUser user);
  Future<MyUser> signUp(MyUser user, String password);
  Future<void> signIn(String email, String password);
}