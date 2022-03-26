part of 'pages.dart';

class TicketPage extends StatefulWidget {
  final bool isExpiredTicket;

  TicketPage({this.isExpiredTicket = false});

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpiredTickets;

  @override
  void initState() {
    super.initState();

    isExpiredTickets = widget.isExpiredTicket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // note: CONTENT
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BlocBuilder<TicketBloc, TicketState>(
                    builder: (_, ticketState) => Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: TicketViewer(isExpiredTickets
                              ? ticketState.tickets
                                  .where((ticket) =>
                                      ticket.time.isBefore(DateTime.now()))
                                  .toList()
                              : ticketState.tickets
                                  .where((ticket) =>
                                      !ticket.time.isBefore(DateTime.now()))
                                  .toList()),
                        )),
                SizedBox(height: 100),
              ],
            ),
          ),
          // note: HEADER
          Container(
            height: 90,
            color: accentColor1,
          ),
          SafeArea(
              child: ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 113,
              color: accentColor1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 24, bottom: 32),
                      child: Text(
                        "My Tickets",
                        style: whiteText.copyWith(fontSize: 20),
                      )),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpiredTickets = !isExpiredTickets;
                              });
                            },
                            child: Text(
                              "Newest",
                              style: whiteText.copyWith(
                                  fontSize: 16,
                                  color: !isExpiredTickets
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 4,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: !isExpiredTickets
                                ? accentColor2
                                : Colors.transparent,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpiredTickets = !isExpiredTickets;
                              });
                            },
                            child: Text(
                              "Oldest",
                              style: whiteText.copyWith(
                                  fontSize: 16,
                                  color: isExpiredTickets
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 4,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: isExpiredTickets
                                ? accentColor2
                                : Colors.transparent,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketViewer extends StatelessWidget {
  final List<Ticket> tickets;

  TicketViewer(this.tickets);

  @override
  Widget build(BuildContext context) {
    var sortedTickets = tickets;
    sortedTickets
        .sort((ticket1, ticket2) => ticket1.time.compareTo(ticket2.time));

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: sortedTickets.length,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                context
                    .bloc<PageBloc>()
                    .add(GoToTicketDetailPage(sortedTickets[index]));
              },
              child: Container(
                margin: EdgeInsets.only(top: index == 0 ? 133 : 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(imageBaseUrl +
                                  'w500' +
                                  sortedTickets[index].movieDetail.posterPath),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            70 -
                            16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              sortedTickets[index].movieDetail.title,
                              style: blackText.copyWith(fontSize: 18),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              sortedTickets[index]
                                  .movieDetail
                                  .genresAndLanguage,
                              style: greyText.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              sortedTickets[index].theater.name,
                              style: greyText.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ));
  }
}
