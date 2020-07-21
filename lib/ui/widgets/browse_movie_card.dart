part of 'widgets.dart';

class BrowseMovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const BrowseMovieCard({Key key, this.movie, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 140,
        width: 210,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    NetworkImage(imageBaseUrl + 'w780' + movie.backdropPath))),
        child: Container(
          height: 140,
          width: 210,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.61),
                    Colors.black.withOpacity(0)
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: whiteText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingStars(voteAverage: movie.voteAverage)
            ],
          ),
        ),
      ),
    );
  }
}
