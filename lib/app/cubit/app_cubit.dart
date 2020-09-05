import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:prajna/app/model/message_model.dart';
import 'package:prajna/app/model/post_model.dart';
import '../repository/repository/repository.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  List<MessageModel> _messageList;
  StreamSubscription<QuerySnapshot> _messageSubscription;

  UserRepository _userRepository = UserRepository();
  AppCubit({@required String userID}) : super(AppLoadingState()) {
    getUser(userID: userID);
  }

  Future getUser({@required String userID}) async {
    print("ok ok ");
    print(userID);
    emit(AppLoadingState());
    await _userRepository.getUser(userID: userID);
    dashboard();
  }

  void dashboard()async {
    emit(AppLoadingState());
    emit(DashBoardState(
      postModels: await _userRepository.getPosts(),
      dailyPsychology:  await _userRepository.getDailyPsychology()
    ));
  }

  Future dailyPsychology() async {
    emit(AppLoadingState());
    emit(DailyPsychologyState(
        imageLinks: await _userRepository.getDailyPsychology()));
  }

  Future getChatEvent() async {
    emit(AppLoadingState());
    _messageSubscription?.cancel();
    _messageSubscription = _userRepository.getChatList().listen((event) {
      _messageList = MessageModel.listFromSnapshot(event.docs.toList());
      emit(ChatPageState(msgList: _messageList));
    });
  }

  void sendMsg({@required MessageModel messageModel}) async {
    await _userRepository.sendNewMsg(msg: messageModel);
  }

  void detailsPage({@required PostModel postModel}){
    emit(DetailsState(postModel: postModel));
  }
}
