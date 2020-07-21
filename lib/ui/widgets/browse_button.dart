part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;
  final Function(String) onPressed;

  const BrowseButton({
    Key key,
    this.genre,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(getGenreId(genre)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xFFEEF1F8),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: SizedBox(
                  height: 36,
                  child: Image(image: AssetImage(getImageFromGenre(genre)))),
            ),
          ),
          Text(genre, style: blackText.copyWith(fontSize: 13))
        ],
      ),
    );
  }

  String getImageFromGenre(String genre) {
    switch (genre) {
      case "Horror":
        return "assets/ic_horror.png";
        break;
      case "Music":
        return "assets/ic_music.png";
        break;
      case "Action":
        return "assets/ic_action.png";
        break;
      case "Drama":
        return "assets/ic_drama.png";
        break;
      case "War":
        return "assets/ic_war.png";
        break;
      case "Crime":
        return "assets/ic_crime.png";
        break;
      default:
        return "";
    }
  }

  String getGenreId(String genre) {
    switch (genre) {
      case "Horror":
        return "27";
        break;
      case "Music":
        return "10402";
        break;
      case "Action":
        return "28";
        break;
      case "Drama":
        return "18";
        break;
      case "War":
        return "10752";
        break;
      case "Crime":
        return "80";
        break;
      default:
        return "";
    }
  }
}
