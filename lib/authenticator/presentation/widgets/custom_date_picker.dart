part of '../presentation.dart';
class CustomDateTimePicker extends StatefulWidget {
  final String title;
  final ValueChanged<DateTime> onChange;
  final DateTimeMode mode;
  final DateTime dateTime;
  final bool enabled;
  CustomDateTimePicker(
      {@required this.title,
        @required this.onChange,
        this.enabled = true,
        @required this.mode,
        @required this.dateTime})
      : assert(title != null),
        assert(onChange != null),
        assert(mode != null),
        assert(dateTime != null);

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime dateTime;

  @override
  void initState() {
    dateTime = widget.dateTime;
    super.initState();
  }

  CupertinoDatePickerMode cuperMode(DateTimeMode dateTimeMode) {
    CupertinoDatePickerMode _mode;
    switch (dateTimeMode) {
      case DateTimeMode.DATE:
        _mode = CupertinoDatePickerMode.date;
        break;
      case DateTimeMode.TIME:
        _mode = CupertinoDatePickerMode.time;
        break;
      case DateTimeMode.DATETIME:
        _mode = CupertinoDatePickerMode.dateAndTime;
        break;
    }
    return _mode;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.enabled) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: height * 25,
                    padding: EdgeInsets.only(top: 2),
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                              fontSize: width * 6, color: C.primaryTextWhite),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: cuperMode(widget.mode),
                        initialDateTime: dateTime,
                        onDateTimeChanged: (newDateTime) {
                          setState(() => dateTime = newDateTime);
                          widget.onChange.call(newDateTime);
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: C.bgGradient,
                        borderRadius: BorderRadius.circular(width * 5)),
                  );
                });
          }
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 24,
            top: 20,
          ),
          child: Row(children: <Widget>[
            Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: C.primaryTextBlack,
                    fontSize: 18,
                  ),
                )),
            Text(
              CommonDateHandler.formattedDateToString(dateTime, widget.mode),
              style: TextStyle(
                color: C.secondaryTextBlue,
                fontSize: 18,
              ),
            ),
          ]),
        ));
  }
}