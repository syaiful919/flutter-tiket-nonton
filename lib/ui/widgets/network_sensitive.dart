part of 'widgets.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final double opacity;

  NetworkSensitive({
    this.child,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityStatus>(
      builder: (context, value, _) {
        if (value == null) {
          return Container();
        }
        if (value == ConnectivityStatus.WiFi) {
          return child;
        }
        if (value == ConnectivityStatus.Cellular) {
          return child;
        }
        return Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.1,
              child: child,
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/astronaut.png",
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  Text(
                    "Oh no,\nWe lost internet connection",
                    textAlign: TextAlign.center,
                    style: whiteText.copyWith(
                      decoration: TextDecoration.none,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
