part of 'pages.dart';

class PreferencesPage extends StatefulWidget {
  final RegistrationData registrationData;
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime"
  ];
  final List<String> languages = ["Bahasa", "English", "Japanese", "Korean"];

  PreferencesPage({Key key, this.registrationData}) : super(key: key);
  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  List<String> selectedGenres = [];
  String selectedLang = "English";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationData.password = '';
        context.bloc<PageBloc>().add(GoToSignUpPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 56,
                      margin: EdgeInsets.only(top: 20, bottom: 4),
                      child: GestureDetector(
                        onTap: () {
                          widget.registrationData.password = '';
                          context
                              .bloc<PageBloc>()
                              .add(GoToSignUpPage(widget.registrationData));
                        },
                        child: Icon(Icons.arrow_back),
                      )),
                  Text(
                    "Select Your Four\nFavorite Genres",
                    style: blackText.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: buildGenres(context)),
                  SizedBox(height: 24),
                  Text(
                    "Movie Language\nYou Prefer",
                    style: blackText.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: buildLanguage(context)),
                  SizedBox(height: 30),
                  Center(
                      child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: mainColor,
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (selectedGenres.length != 4) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Please select 4 genres",
                        )..show(context);
                      } else {
                        widget.registrationData.selectedGenres = selectedGenres;
                        widget.registrationData.selectedLang = selectedLang;

                        context.bloc<PageBloc>().add(
                            GoToAccountConfirmationPage(
                                widget.registrationData));
                      }
                    },
                  )),
                  SizedBox(height: 50),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildGenres(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () => onSelectGenre(e),
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }

  List<Widget> buildLanguage(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLang == e,
              onTap: () {
                setState(() {
                  selectedLang = e;
                });
              },
            ))
        .toList();
  }
}
