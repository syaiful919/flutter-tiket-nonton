part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      Firestore.instance.collection('tickets');

  static Future<void> saveTicket(String id, Ticket ticket) async {
    try {
      await ticketCollection.document().setData({
        'movieID': ticket.movieDetail.id ?? "",
        'userID': id ?? "",
        'theaterName': ticket.theater.name ?? 0,
        'time': ticket.time.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch,
        'bookingCode': ticket.bookingCode,
        'seats': ticket.seatsInString,
        'name': ticket.name,
        'totalPrice': ticket.totalPrice
      });
    } catch (e) {
      print(">>> $e");
    }
  }

  static Future<List<Ticket>> getTickets(String userId) async {
    try {
      QuerySnapshot snapshot = await ticketCollection.getDocuments();
      var documents = snapshot.documents
          .where((document) => document.data['userID'] == userId);

      List<Ticket> tickets = [];
      for (var document in documents) {
        MovieDetail movieDetail = await MovieServices.getDetails(null,
            movieID: document.data['movieID']);
        tickets.add(Ticket(
            movieDetail,
            Theater(document.data['theaterName']),
            DateTime.fromMillisecondsSinceEpoch(document.data['time']),
            document.data['bookingCode'],
            document.data['seats'].toString().split(','),
            document.data['name'],
            document.data['totalPrice']));
      }

      return tickets;
    } catch (e) {
      print(">>> $e");
    }
  }
}
