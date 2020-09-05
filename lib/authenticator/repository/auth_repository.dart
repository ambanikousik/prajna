import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/models.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../client.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth ;
  final GraphQLClient _client = client.value;

  AuthRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<String> signInWithCredentials(LoginModel loginModel) async {
    String _fireID = await _firebaseAuth
        .signInWithEmailAndPassword(
          email: loginModel.email,
          password: loginModel.password,
        )
        .then((value) => value.user.uid);

    return await FirebaseFirestore.instance
        .doc("informations/$_fireID")
        .get()
        .then((x) => x.data()['uuid']);
  }

  Future<void> signUp(SignUpModel signUpModel) async {
    String _fireID = await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: signUpModel.email,
          password: signUpModel.password,
        )
        .then((value) => value.user.uid);
    String _gqId = await _client
        .mutate(MutationOptions(
            documentNode: gql(signUpModel.mutationString),
            variables: signUpModel.toMap()))
        .then((value) => value.data['insert_user_one']['id']);
    return await FirebaseFirestore.instance
        .doc("informations/$_fireID")
        .set({'uuid': _gqId});
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String> getUser() async {
    String _uid = _firebaseAuth.currentUser.uid;
    print(_uid);
   return await FirebaseFirestore.instance
      .doc("informations/$_uid")
      .get()
      .then((x) {
        print(x.data());
        return x.data()['uuid'];});}
}
