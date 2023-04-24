import 'package:oauth2/oauth2.dart' as oauth2;

getCredential(String username, String password) async {
  final authorizationEndpoint = Uri.http("127.0.0.1:8000", "o/token/");
  const identifier = 'Fthi5DtlQuN8zPH4RfJlb8UUSy9jo9BoKH9xCGHV';
  const secret =
      '4gHae8nPrXMCQmWmEWwKmjzoX2UBLybTg5iIRUrly3YmgI6Vph6qnyOm4ZbFivCIll3OOLccNlbrbbNeO04VtwW7liAUI6N6i0nGMij3lzPdD9bZZpjLXoX0WW3zv6Sn';

  // Make a request to the authorization endpoint that will produce the fully
  // authenticated Client.
  oauth2.Client client = await oauth2.resourceOwnerPasswordGrant(
      authorizationEndpoint, username, password,
      identifier: identifier, secret: secret);

  //debugPrint(client.credentials.accessToken.toString());

  return client;
}
