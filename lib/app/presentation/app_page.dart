part of 'presentation.dart';

class AppPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is AppLoadingState) {
          return LoadingPage();
        }
        if (state is DashBoardState) {
          return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: DashBoardPage(
                postModels: state.postModels,
                dailyPsychology: state.dailyPsychology,
              ));
        }

        if (state is AppErrorState) {
          return WillPopScope(
              onWillPop: () async {
                context.bloc<AppCubit>().dashboard();
                return false;
              },
              child: ErrorScreen());
        }

        if (state is DailyPsychologyState) {
          return WillPopScope(
              onWillPop: () async {
                context.bloc<AppCubit>().dashboard();
                return false;
              },
              child: DailyPsychologyPage(
                imageLinks: state.imageLinks,
              ));
        }
        if (state is ChatPageState) {
          return WillPopScope(
              onWillPop: () async {
                context.bloc<AppCubit>().dashboard();
                return false;
              },
              child: ChatPage(
                msgList: state.msgList,
              ));
        }
        if (state is DetailsState) {
          return WillPopScope(
              onWillPop: () async {
                context.bloc<AppCubit>().dashboard();
                return false;
              },
              child: DetailsPage(
                postModel: state.postModel,
              ));
        }
      },
    );
  }
}
