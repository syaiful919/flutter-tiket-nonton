part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          if (!(prevPageEvent is GoToMainPage)) {
            context.bloc<UserBloc>().add(LoadUser(state.user.uid));
            context.bloc<TicketBloc>().add(GetTickets(state.user.uid));
            prevPageEvent = GoToMainPage();
            context.bloc<PageBloc>().add(prevPageEvent);
          }
        } else if (state is AuthUnauthorized) {
          if (!(prevPageEvent is GoToSplashPage)) {
            prevPageEvent = GoToSplashPage();
            context.bloc<PageBloc>().add(prevPageEvent);
          }
        }
      },
      child: BlocBuilder<PageBloc, PageState>(
          builder: (_, pageState) => (pageState is OnSplashPage)
              ? SplashPage()
              : (pageState is OnSignInPage)
                  ? SignInPage()
                  : (pageState is OnSignUpPage)
                      ? SignUpPage(registrationData: pageState.registrationData)
                      : (pageState is OnPreferencesPage)
                          ? PreferencesPage(
                              registrationData: pageState.registrationData)
                          : (pageState is OnAccountConfirmationPage)
                              ? AccountConfimationPage(
                                  registrationData: pageState.registrationData)
                              : (pageState is OnMovieDetailPage)
                                  ? MovieDetailPage(
                                      movie: pageState.movie,
                                      upcoming: pageState.upcoming,
                                    )
                                  : (pageState is OnBrowseMoviePage)
                                      ? BrowseMoviePage(
                                          genreId: pageState.genreId,
                                          genre: pageState.genre,
                                        )
                                      : (pageState is OnSelectSchedulePage)
                                          ? SelectSchedulePage(
                                              pageState.movieDetail)
                                          : (pageState is OnSelectSeatPage)
                                              ? SelectSeatPage(pageState.ticket)
                                              : (pageState is OnCheckoutPage)
                                                  ? CheckoutPage(
                                                      pageState.ticket)
                                                  : (pageState is OnSuccessPage)
                                                      ? SuccessPage(
                                                          pageState.ticket,
                                                          pageState.transaction)
                                                      : (pageState
                                                              is OnTicketDetailPage)
                                                          ? TicketDetailPage(
                                                              pageState.ticket)
                                                          : (pageState
                                                                  is OnProfilePage)
                                                              ? ProfilePage()
                                                              : (pageState
                                                                      is OnTopUpPage)
                                                                  ? TopUpPage(
                                                                      pageState
                                                                          .pageEvent)
                                                                  : (pageState
                                                                          is OnWalletPage)
                                                                      ? WalletPage(
                                                                          pageState
                                                                              .pageEvent)
                                                                      : (pageState
                                                                              is OnEditProfilePage)
                                                                          ? EditProfilePage(
                                                                              pageState.user)
                                                                          : (pageState is OnMainPage)
                                                                              ? MainPage(
                                                                                  bottomNavBarIndex: pageState.bottomNavBarIndex,
                                                                                  isExpired: pageState.isExpired,
                                                                                )
                                                                              : Container()),
    );
  }
}
