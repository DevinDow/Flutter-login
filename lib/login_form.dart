import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Autofill"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: AutofillGroup(
            child: Column(
          children: [
            const TextField(
              autofillHints: [AutofillHints.username],
              decoration: InputDecoration(hintText: "Username"),
            ),
            const TextField(
              obscureText: true,
              autofillHints: [AutofillHints.password],
              decoration: InputDecoration(hintText: "Password"),
            ),
            ElevatedButton(
                onPressed: () {
                  //--- trigger Password Save
                  TextInput.finishAutofillContext();

                  //--- OR ----
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Panel();
                  }));
                },
                child: const Text("Log In"))
          ],
        )),
      ),
    );
  }
}

class Panel extends StatelessWidget {
  const Panel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
    );
  }
}
