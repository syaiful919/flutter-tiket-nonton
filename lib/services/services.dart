import 'dart:convert';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiket_nonton/enums/connectivity_status.dart';
import 'package:tiket_nonton/models/models.dart';
import 'package:tiket_nonton/extensions/extensions.dart';

import 'package:http/http.dart' as http;
import 'package:tiket_nonton/shared/shared.dart';

part 'auth_services.dart';
part 'user_services.dart';
part 'movie_services.dart';
part 'ticket_services.dart';
part 'app_transaction_services.dart';
part 'connectivity_services.dart';
