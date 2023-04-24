import 'dart:convert';
import 'package:oauth2demo/urls.dart';

Future<List> getNotes(var client) async {
  List response = json.decode((await client.post(geturlNotes())));

  return response;
}
