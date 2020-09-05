part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}

class AppLoadingState extends AppState {}

class DashBoardState extends AppState {
 final List<String> dailyPsychology;
 final List<PostModel> postModels;
  DashBoardState({@required this.dailyPsychology,@required this.postModels});
}

class AppErrorState extends AppState {}

class DailyPsychologyState extends AppState{
  final List<String>  imageLinks;
  DailyPsychologyState({@required this.imageLinks});
}

class ChatPageState extends AppState {
  final List<MessageModel> msgList;
  const ChatPageState(
      {@required this.msgList,})
      : assert(msgList != null);
  @override
  List<Object> get props => [msgList];
}

class DetailsState extends AppState{
  final PostModel postModel;
  DetailsState({@required this.postModel});
}
