part of'../presentation.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback action;
  final String title;
  final Widget leading;
  final Widget tail;

  CustomAppBar(
      {Key key, this.action, this.leading, this.tail, @required this.title})
      : preferredSize = Size.fromHeight(height * 8),
        assert(title != null),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
//            height:height*15 ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.leading ?? SizedBox.shrink(),
            Flexible(
              child: Center(
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: C.primaryTextWhite,
                        fontSize: width *6,
                        fontWeight: FontWeight.w700),
                  )),
            ),
            widget.tail ?? SizedBox.shrink(),
          ],
        ),
        decoration: BoxDecoration(
          gradient: C.bgGradient,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(width *5),
              bottomLeft: Radius.circular(width * 5)),
          boxShadow: [new BoxShadow(blurRadius: 2)],
        ),
      ),
    );
  }
}
