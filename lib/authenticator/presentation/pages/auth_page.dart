part of '../presentation.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return BlocBuilder<AuthCubit, AuthState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return LoadingPage();
        }
        if (state is LandingState) {
          return WillPopScope(
              onWillPop: ()async => false,
              child: LoginPage());
        }
        if (state is AuthAppState) {
          return BlocProvider(
              create: (context) => AppCubit(userID: state.uuid),
              child: AppPage(),
        );
        }
        if(state is AuthErrorState) {
          return WillPopScope(
              onWillPop: ()async {
                context.bloc<AuthCubit>().checkLogin();
                return false;
              },
              child: ErrorScreen());
        }
      },
    );
  }
}