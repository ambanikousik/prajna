part of '../presentation.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  CustomTextFieldController _email = CustomTextFieldController();
  CustomTextFieldController _password = CustomTextFieldController();
  CustomTextFieldController _name = CustomTextFieldController();
  DateTime _dob = DateTime.now();


  bool _loginValidate() {
    return _email.isValid &&
        _password.isValid ;
  }

  bool _signupValidate() {
    return _email.isValid &&
        _password.isValid && _name.isValid ;
  }

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch(_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(
                    milliseconds: 1000
                ),
                color: _backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 0;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            AnimatedContainer(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: Duration(
                                  milliseconds: 1000
                              ),
                              margin: EdgeInsets.only(
                                top: _headingTop,
                              ),
                              child: Text(
                                "Prajna",
                                style: TextStyle(
                                    color: _headingColor,
                                    fontSize: width*8
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32
                              ),
                              child: Text(
                                "Every emotion matters",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: _headingColor,
                                    fontSize: 16
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32
                      ),
                      child: Center(
                        child: Image.asset("assets/images/splash_bg.png"),
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if(_pageState != 0){
                              _pageState = 0;
                            } else {
                              _pageState = 1;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(32),
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFB40284A),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
            ),
            AnimatedContainer(
              padding: EdgeInsets.all(32),
              width: _loginWidth,
              height: _loginHeight,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(_loginOpacity),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Login To Continue",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                      AuthTextBox(
                        controller: _email,
                        icon: Icons.email,
                        hint: "Enter Email...",
                        validate: Validate.withOption(
                          isRequired: true,
                          isEmail: true,
                        ),
                      ),
                      SizedBox(height: 20,),
                      AuthTextBox(
                        controller: _password,
                        isPassword: true,
                        icon: Icons.vpn_key,
                        hint: "Enter Password...",
                        validate: Validate.withOption(
                          isRequired: true,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      PrimaryButton(
                        onTap: (){
                          if(_loginValidate())
                          {
                            LoginModel _loginModel = LoginModel(
                              email: _email.text,
                              password: _password.text,
                            );
                            context.bloc<AuthCubit>().login(loginModel: _loginModel);}

                        },
                        btnText: "Login",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OutlineBtn(
                        onTap: () {
                          setState(() {
                            _pageState = 2;
                          });
                        },
                      btnText: "Create New Account",
                      )],
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              height: _registerHeight,
              padding: EdgeInsets.all(32),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              transform: Matrix4.translationValues(0, _registerYOffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Create a New Account",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                      AuthTextBox(
                        validate: Validate.withOption(
                          isRequired: true,
                        ),
                        controller: _name,
                        icon: Icons.email,
                        hint: "Name",
                      ),
                      AuthTextBox(
                        validate: Validate.withOption(
                          isEmail: true,
                          isRequired: true,
                        ),
                        controller: _email,
                        icon: Icons.email,
                        hint: "Enter Email...",
                      ),
                      SizedBox(height: 20,),
                      AuthTextBox(
                        validate: Validate.withOption(
                         isRequired: true,
                        ),
                        controller: _password,
                        isPassword: true,
                        icon: Icons.vpn_key,
                        hint: "Enter Password...",
                      )
                    ],
                  ),
                  CustomDateTimePicker(
                    dateTime: _dob,
                    title: 'Date of birth',
                    mode: DateTimeMode.DATE,
                    onChange: (x) => _dob = x,
                  ),
                  Column(
                    children: <Widget>[
                      PrimaryButton(
                        onTap: (){
                          if(_signupValidate()){
                            SignUpModel  _signupData = SignUpModel(
                              userName: _name.text,
                              password: _password.text,
                              dateOfBirth: _dob,
                              email: _email.text,
                            );
                            context.bloc<AuthCubit>().signup(signupModel: _signupData);
                          }
                        },
                        btnText: "Create Account",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OutlineBtn(
                        onTap: () {
                          setState(() {
                            _pageState = 1;
                          });
                        },
                        btnText: "Back To Login",
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






