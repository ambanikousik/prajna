part of 'presentation.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('pressed back');
        return false;
      },
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text('Coming Soon !!',
              style: TextStyle(
                  fontSize: width*12,
                  fontWeight: FontWeight.w700,
                  color: C.primaryTextWhite.withOpacity(0.7)),),
          ),
          decoration: BoxDecoration(
              gradient: C.bgGradient
          ),
        ),
      ),
    );
  }
}
