part of '../presentation.dart';

class AuthTextBox extends StatefulWidget {
  final CustomTextFieldController controller;
  final IconData icon;
  final String hint;
  final bool isPassword;
  final Validate validate;

  AuthTextBox({
    this.validate,
    this.isPassword,
    @required this.controller,
    @required this.icon,
    @required this.hint});

  @override
  _AuthTextBoxState createState() => _AuthTextBoxState();
}

class _AuthTextBoxState extends State<AuthTextBox> {
  final FocusNode _focusNode = FocusNode();
  String _errorText = "";

  @override
  void initState() {
    super.initState();
//    _focusNode.addListener((){if(mounted)setState(() {});});
    widget.controller._init(_getTextHandler, _setTextHandler, _clearTextHandler,
        _isValidHandler, _setErrorText);
  }

  String _getTextHandler() {
    return widget.controller._textEditingController.text;
  }

  _setTextHandler(String txt) {
    widget.controller._textEditingController.text = txt;
    _isValidHandler();
  }

  _setErrorText(String value) {
    _setErrorTextColor(value);
  }

  bool _isValidHandler() {
    if (widget.validate != null) {
      var data = widget.validate._validate(
          widget.controller._textEditingController.text, widget.hint);
      if (data == null || data.isEmpty) {
        // valid data
        _setErrorTextColor("");
        return true;
      } else {
        //invalid data
        _setErrorTextColor(data);
        return false;
      }
    } else
      return true;
  }

  _clearTextHandler() {
    widget.controller._textEditingController.clear();
  }

  void _setErrorTextColor(String x) {
    if (mounted)
      setState(() {
        _errorText = x;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFBC7C7C7),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )
          ),
          Expanded(
            child: TextField(

              focusNode: _focusNode,
              controller: widget.controller._textEditingController,
              autofocus: false,
              obscureText: widget.isPassword ??false,
              decoration: InputDecoration(
                errorText: _errorText != null&& _errorText.isNotEmpty?_errorText:null,
                  contentPadding: EdgeInsets.symmetric(vertical: _errorText !=null && _errorText.isNotEmpty?0:20,),
                  border: InputBorder.none,
                  hintText: widget.hint
              ),
              onChanged: (x) {
                _isValidHandler();
              },
            ),
          )
        ],
      ),
    );
  }
}



class CustomTextFieldController {
  final TextEditingController _textEditingController = TextEditingController();
  var tag;
  String Function() _getTextHandler;
  bool Function() _isValidHandler;
  void Function() _clearTextHandler;
  void Function(String value) _setTextHandler;
  void Function(String value) _setErrorText;
  _init(
      String Function() getTextHandler,
      Function(String value) setTextHandler,
      Function() clearTextHandler,
      bool Function() isValidHandler,
      Function(String value) setErrorText) {
    _getTextHandler = getTextHandler;
    _setTextHandler = setTextHandler;
    _isValidHandler = isValidHandler;
    _clearTextHandler = clearTextHandler;
    _setErrorText = setErrorText;
  }

  String get text => _getTextHandler?.call();
  set text(String value) => _setTextHandler?.call(value);
  set errorText(String value) => _setErrorText?.call(value);
  bool get isValid => _isValidHandler?.call();
  void clear() {
    _clearTextHandler?.call();
  }
}

class Validate {
  bool isRequired;
  int minLength;
  int maxLength;
  bool isEmail;
  bool isNumber;
  String checkPassword;

  Validate.withOption(
      {this.isRequired,
        this.isEmail = false,
        this.minLength,
        this.checkPassword,
        this.maxLength = 50,
        this.isNumber = false});

  String _validate(String value, String fieldName) {
    String _field =
        "${fieldName[0].toUpperCase()}${fieldName.substring(1).toLowerCase()}";
    if (isRequired != null && isRequired && (value == null || value.isEmpty)) {
      return "$_field is required!";
    }
    if (minLength != null && (value == null || value.length < minLength)) {
      return "Minimum $minLength characters required!";
    }
    if(checkPassword != null && (value == null || value != checkPassword)){
      return "Password didn't match";
    }
    if (maxLength != null && (value == null || value.length > maxLength)) {
      return "Maximum $maxLength characters allowed!";
    }
    if (isEmail && (value == null || !RegExp(_emailPattern).hasMatch(value))) {
      return "Invalid email address!";
    }
    if (isNumber && (value == null || double.tryParse(value) == null)) {
      return "Not a valid number!";
    }
    return "";
  }
}

final String _emailPattern =
    r"^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\.[a-zA-Z](-?[a-zA-Z0-9])*)+$";
