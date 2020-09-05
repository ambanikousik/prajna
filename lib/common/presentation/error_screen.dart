part of 'presentation.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Something Went Wrong',
            style: TextStyle(
                fontSize: width*12,
                fontWeight: FontWeight.w700,
                color: C.primaryTextWhite.withOpacity(0.7)),),
        ),
        decoration: BoxDecoration(
            gradient: C.bgGradient
        ),
      ),
    );
  }
}
