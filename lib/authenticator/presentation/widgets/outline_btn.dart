part of '../presentation.dart';

class OutlineBtn extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  OutlineBtn({@required this.btnText,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFB40284A), width: 2),
            borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(color: Color(0xFFB40284A), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
