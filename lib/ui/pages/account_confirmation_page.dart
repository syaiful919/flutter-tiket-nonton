part of 'pages.dart';

class AccountConfimationPage extends StatefulWidget {
  final RegistrationData registrationData;

  const AccountConfimationPage({Key key, this.registrationData})
      : super(key: key);
  @override
  _AccountConfimationPageState createState() => _AccountConfimationPageState();
}

class _AccountConfimationPageState extends State<AccountConfimationPage> {
  bool isSingingUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToPreferencesPage(widget.registrationData));
          return;
        },
        child: NetworkSensitive(
          child: Scaffold(
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 55),
                      height: 56,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () => context.bloc<PageBloc>().add(
                                  GoToPreferencesPage(widget.registrationData)),
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                          Center(
                              child: Text(
                            "Confirm\nNewAccount",
                            style: blackText.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ))
                        ],
                      ),
                    ),
                    Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: (widget.registrationData.profileImage ==
                                        null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(widget
                                        .registrationData.profileImage)))),
                    Text(
                      "Welcome",
                      style: blackText.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "${widget.registrationData.name}",
                      style: blackText.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: 110),
                    (isSingingUp)
                        ? SpinKitFadingCircle(color: Color(0xFF3E9D9D))
                        : SizedBox(
                            height: 45,
                            width: 250,
                            child: RaisedButton(
                                color: Color(0xFF3E9D9D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text("Create My Account",
                                    style: whiteText.copyWith(fontSize: 16)),
                                onPressed: () async {
                                  setState(() {
                                    isSingingUp = true;
                                  });
                                  SignInSignUpResult result =
                                      await AuthServices.signUp(
                                          widget.registrationData.email,
                                          widget.registrationData.password,
                                          widget.registrationData.name,
                                          widget
                                              .registrationData.selectedGenres,
                                          widget.registrationData.selectedLang);

                                  imageFileToUpload =
                                      widget.registrationData.profileImage;

                                  if (result.user == null) {
                                    setState(() {
                                      isSingingUp = false;
                                    });
                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xFFFF5C83),
                                      message: result.message,
                                    )..show(context);
                                  }
                                }))
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
