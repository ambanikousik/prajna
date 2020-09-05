part of 'presentation.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    ScreenSize().init(context);
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
//        child: CircularProgressIndicator(backgroundColor: C.primaryBackgroundColor,),
        child: SpinKitPouringHourglass(
          color: C.primaryBackgroundColor,
          size: 80,
        ),
        decoration: BoxDecoration(
            gradient: C.bgGradient
        ),
      ),
    );
  }
}
