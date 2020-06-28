part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigninIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30),
                      SizedBox(
                        height: 70,
                        child: Image.asset("assets/logo.png"),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 70, bottom: 40),
                          child: Text(
                            "Welcome Back, \nExplorer!",
                            style: blackText.copyWith(fontSize: 20),
                          )),
                      TextField(
                        controller: emailController,
                        onChanged: (text) {
                          setState(() {
                            isEmailValid = EmailValidator.validate(text);
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "Email Address",
                            hintText: "Email Address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        onChanged: (text) {
                          setState(() {
                            isPasswordValid = text.length >= 6;
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          Flushbar(
                            duration: Duration(milliseconds: 3500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message:
                                "Sorry, this feature isn't available right now",
                          )..show(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Forgot Password? ",
                              style: greyText.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Get Now",
                              style: purpleText.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 40, bottom: 30),
                            child: isSigninIn
                                ? SpinKitFadingCircle(color: mainColor)
                                : FloatingActionButton(
                                    elevation: 0,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: (isEmailValid && isPasswordValid)
                                          ? Colors.white
                                          : Color(0xFFBEBEBE),
                                    ),
                                    backgroundColor:
                                        (isEmailValid && isPasswordValid)
                                            ? mainColor
                                            : Color(0xFFE4E4E4),
                                    onPressed: (isEmailValid && isPasswordValid)
                                        ? () async {
                                            setState(() {
                                              isSigninIn = true;
                                            });

                                            SignInSignUpResult result =
                                                await AuthServices.signIn(
                                                    emailController.text,
                                                    passwordController.text);

                                            if (result.user == null) {
                                              setState(() {
                                                isSigninIn = false;
                                              });

                                              Flushbar(
                                                duration: Duration(seconds: 4),
                                                flushbarPosition:
                                                    FlushbarPosition.TOP,
                                                backgroundColor:
                                                    Color(0xFFFF5C83),
                                                message: result.message,
                                              )..show(context);
                                            }
                                          }
                                        : null,
                                  )),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToSignUpPage(RegistrationData()));
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Start Fresh Now? ",
                              style: greyText.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Sign Up",
                              style: purpleText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  )
                ],
              ))),
    );
  }
}
