import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oauth2demo/validation.dart';
import 'package:http/http.dart' as http;
import 'first_page.dart';
import 'oauth2_login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  http.Client client = http.Client();

  final newLogin = TextEditingController();
  final newPassword = TextEditingController();
  final newEmail = TextEditingController();

  void routeToNewLoggedPage(client) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FirstPage(clientWithCredential: client)));
  }

  void tryRegistration() async {
    String login = newLogin.text;
    String password = newPassword.text;
    String email = newEmail.text;

    if (checkIfStringIsNotEmpty(login) &&
        checkIfStringIsNotEmpty(password) &&
        checkIfStringIsNotEmpty(email)) {
      try {
        Client client = Client();
        Response response = await client.post(
            Uri.http("127.0.0.1:8000", "user/"),
            body: {"username": login, "password": password, "email": email});

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registration successful")));

          Client client = await getCredential(login, password);
          routeToNewLoggedPage(client);

        } else if (response.statusCode == 400) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registration failed: bad request")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Unexpected error happened, try again later")));
        }
      } on Exception {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Unexpected error happened, try again later")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("all fields must be filled")));
    }

    //var notes = getNotes(client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registration"),
          automaticallyImplyLeading: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Registration",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 40)),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: newLogin,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Login',
                            hintText: 'Enter your login'),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: newPassword,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your password'),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: newEmail,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter your email'),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                        onPressed: tryRegistration,
                        child: const Text('Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
