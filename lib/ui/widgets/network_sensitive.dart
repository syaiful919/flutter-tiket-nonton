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
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
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
  }
}
