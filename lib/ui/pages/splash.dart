part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Go to Sign In Page"),
          onPressed: () {
            context.bloc<PageBloc>().add(GoToSignInPage());
          },
        ),
      ),
    );
  }
}
