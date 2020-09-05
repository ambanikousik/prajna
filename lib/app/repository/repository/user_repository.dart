import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/models.dart';
import '../gateway/gateway.dart';
import 'package:meta/meta.dart';

class UserRepository {
  UserGateway _userGateway = UserGateway();
  UserModel _userModel;
  List<String> _links;
  List<PostModel> _posts;
  Future setUser({@required String userID}) async {
    _userModel = await _userGateway.getUser(userID: userID);
  }

  Future getUser({@required String userID}) async {
    if (_userModel == null) {
      await setUser(userID: userID);
    }
    return _userModel;
  }

  Future<List<String>> getDailyPsychology() async {
    if (_links == null) {
      _links = await _userGateway.getDailyPsychology();
    }
    return _links;
  }


  Future<List<PostModel>> getPosts() async {
    if (_posts == null) {
      _posts = await _userGateway.getPosts();
    }
    return _posts;
  }

  Stream<QuerySnapshot> getChatList() {
    try {
      return FirebaseFirestore.instance
          .collection("CROOM/${_userModel.id}/MESSAGES")
          .orderBy('time', descending: false)
          .snapshots();
    } catch (e) {
      print("chatlist get error: $e");
      throw e;
    }
  }

  Future sendNewMsg({@required MessageModel msg}) async {
    try {
      return await FirebaseFirestore.instance
          .collection("CROOM/${_userModel.id}/MESSAGES")
          .add(msg.toData())
          .whenComplete(() => print('sent'));
    } catch (e) {
      print("error: $e");
    }
  }
}
