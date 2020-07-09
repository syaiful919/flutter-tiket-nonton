part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveSafeArea(builder: (context, size) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 136,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/logo.png"))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 70, bottom: 16),
                        child: Text(
                          "New Experience",
                          style: blackText.copyWith(fontSize: 20),
                        ),
                      ),
                      Text(
                        "Watch a new movie much\n easier than any before",
                        style: greyText.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: 250,
                        height: 46,
                        margin: EdgeInsets.only(top: 70, bottom: 19),
                        child: RaisedButton(
                          child: Text(
                            "Get Started",
                            style: whiteText.copyWith(fontSize: 16),
                          ),
                          color: mainColor,
                          onPressed: () {
                            context
                                .bloc<PageBloc>()
                                .add(GoToSignUpPage(RegistrationData()));
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account? ",
                            style:
                                greyText.copyWith(fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () =>
                                context.bloc<PageBloc>().add(GoToSignInPage()),
                            child: Text("Sign In", style: purpleText),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          );
        }),
      ),
    );
  }
}
