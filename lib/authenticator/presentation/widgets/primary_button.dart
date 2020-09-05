part of '../presentation.dart';



class PrimaryButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  PrimaryButton({@required this.btnText,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFB40284A),
            borderRadius: BorderRadius.circular(50)
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}