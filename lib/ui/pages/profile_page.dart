part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: <Widget>[
                  BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) {
                      if (userState is UserLoaded) {
                        User user = userState.user;

                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 74, bottom: 10),
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitFadingCircle(
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: 120,
                                    // height: 120,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: (user.profilePicture != "")
                                                ? NetworkImage(
                                                    user.profilePicture)
                                                : AssetImage(
                                                    "assets/user_pic.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin,
                              child: Text(
                                user.name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: blackText.copyWith(fontSize: 18),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin,
                              margin: EdgeInsets.only(top: 8, bottom: 30),
                              child: Text(
                                user.email,
                                textAlign: TextAlign.center,
                                style: greyText.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        );
                      } else
                        return SizedBox();
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToEditProfilePage(
                                (userState as UserLoaded).user));
                          },
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child:
                                      Image.asset("assets/edit_profile.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Edit Profile",
                                style: blackText.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToWalletPage(GoToProfilePage()));
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset("assets/my_wallet.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "My Wallet",
                              style: blackText.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
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
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset("assets/language.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Change Language",
                              style: blackText.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
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
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset("assets/help_centre.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Help Centre",
                              style: blackText.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      GestureDetector(
                        onTap: () {
                          Flushbar(
                            duration: Duration(milliseconds: 3500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message:
                                "Sorry, Tiket Nonton isn't available at playstore right now",
                          )..show(context);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset("assets/rate.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Rate Tiket Nonton App",
                              style: blackText.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await AuthServices.signOut();
                          context.bloc<UserBloc>().add(SignOut());
                          context.bloc<AuthBloc>().add(SignOutAction());
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                      color: Color(0xFFFBD460),
                                    ),
                                    Icon(
                                      MdiIcons.logout,
                                      color: secondaryColor,
                                      size: 24,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sign Out",
                              style: blackText.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin),
              child: GestureDetector(
                onTap: () {
                  context.bloc<PageBloc>().add(GoToMainPage());
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
