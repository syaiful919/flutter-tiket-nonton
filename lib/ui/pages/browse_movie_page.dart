part of 'pages.dart';

class BrowseMoviePage extends StatelessWidget {
  final String genreId;
  final String genre;

  const BrowseMoviePage({Key key, this.genreId, this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrowseMovieBloc()..add(FetchMovieByGenre(genreId)),
      child: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());
          return;
        },
        child: NetworkSensitive(
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                Container(color: accentColor1),
                SafeArea(child: Container(color: Colors.white)),
                SafeArea(
                  child: Container(
                    margin:
                        EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
                    child: ListView(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToMainPage());
                                  },
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    genre,
                                    style: blackText.copyWith(fontSize: 20),
                                  ),
                                ),
                                BlocBuilder<BrowseMovieBloc, BrowseMovieState>(
                                  builder: (_, browseMovieState) {
                                    if (browseMovieState is BrowseMovieLoaded) {
                                      return Container(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                BrowseMovieCard(
                                                  movie: browseMovieState
                                                      .movies[index],
                                                  onTap: () {
                                                    context.bloc<PageBloc>().add(
                                                        GoToMovieDetailPage(
                                                            movie:
                                                                browseMovieState
                                                                        .movies[
                                                                    index]));
                                                  },
                                                ),
                                            itemCount:
                                                browseMovieState.movies.length),
                                      );
                                    } else {
                                      return ConstrainedBox(
                                        constraints: BoxConstraints(
                                            minHeight: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                100),
                                        child: Center(
                                            child: SpinKitFadingCircle(
                                                color: mainColor, size: 50)),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
