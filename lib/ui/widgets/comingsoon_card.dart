part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const ComingSoonCard({Key key, this.movie, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageBaseUrl + 'w342' + movie.posterPath))),
    );
  }
}
