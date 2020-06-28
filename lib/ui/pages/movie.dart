part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      // note: HEADER
      Container(
        padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
        decoration: BoxDecoration(
            color: accentColor1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((value) {
                  imageFileToUpload = null;
                  context.bloc<UserBloc>().add(UpdateData(profileImage: value));
                });
              }
              return Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () =>
                        context.bloc<PageBloc>().add(GoToProfilePage()),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: accentColor3, width: 1)),
                      child: Stack(
                        children: <Widget>[
                          SpinKitFadingCircle(
                            color: accentColor2,
                            size: 50,
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: (userState.user.profilePicture == ''
                                        ? AssetImage("assets/user_pic.png")
                                        : NetworkImage(
                                            userState.user.profilePicture))),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (2 * defaultMargin + 78),
                          child: Text(
                            userState.user.name,
                            style: whiteText.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          )),
                      Text(
                        NumberFormat.currency(
                                locale: "id_ID",
                                decimalDigits: 0,
                                symbol: "IDR ")
                            .format(userState.user.balance),
                        style: yellowNumber.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              );
            } else {
              return SpinKitFadingCircle(color: accentColor2, size: 50);
            }
          },
        ),
      ),
      // note: NOW PLAYING
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
        child: Text(
          "Now Playing",
          style: blackText.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 140,
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(0, 9);
              return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin : 0,
                            right: (index == movies.length - 1)
                                ? defaultMargin
                                : 16),
                        child: MovieCard(
                          movie: movies[index],
                          onTap: () {
                            context
                                .bloc<PageBloc>()
                                .add(GoToMovieDetailPage(movies[index]));
                          },
                        ),
                      ));
            } else {
              return SpinKitFadingCircle(color: mainColor, size: 50);
            }
          },
        ),
      ),

      // note: BROWSE MOVIE
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
        child: Text("Browse Movie",
            style:
                blackText.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      BlocBuilder<UserBloc, UserState>(
        builder: (_, userState) {
          if (userState is UserLoaded) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    userState.user.selectedGenres.length,
                    (index) => BrowseButton(
                        genre: userState.user.selectedGenres[index])),
              ),
            );
          } else {
            return SpinKitFadingCircle(color: mainColor, size: 50);
          }
        },
      ),

      // note: COMING SOON
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
        child: Text(
          "Coming Soon",
          style: blackText.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 140,
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(10);
              return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin : 0,
                            right: (index == movies.length - 1)
                                ? defaultMargin
                                : 16),
                        child: ComingSoonCard(movie: movies[index]),
                      ));
            } else {
              return SpinKitFadingCircle(color: mainColor, size: 50);
            }
          },
        ),
      ),

      // note: GET LUCKY DAY
      Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text("Get Lucky Day",
              style: blackText.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold))),
      Column(
          children: dummyPromos
              .map((e) => Padding(
                  padding:
                      EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                  child: PromoCard(promo: e)))
              .toList()),
      SizedBox(height: 100)
    ]);
  }
}
