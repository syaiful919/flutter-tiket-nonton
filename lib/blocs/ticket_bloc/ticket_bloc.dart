import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiket_nonton/models/models.dart';
import 'package:tiket_nonton/services/services.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  @override
  TicketState get initialState => TicketState([]);

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if (event is BuyTicket) {
      await TicketServices.saveTicket(event.userID, event.ticket);

      List<Ticket> tickets = state.tickets + [event.ticket];

      yield TicketState(tickets);
    } else if (event is GetTickets) {
      List<Ticket> tickets = await TicketServices.getTickets(event.userID);

      yield TicketState(tickets);
    }
  }
}
