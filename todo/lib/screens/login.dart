import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/homepage.dart';
import 'package:todo/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.green,
                Colors.red,
                Colors.blue,
              ])),
            ),
            Center(
              child: Container(
                color: Colors.white,
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Form(
                        key: _formkey,
                        child: TextFormField(
                          validator: (value) {
                            return value!.contains('@')
                                ? null
                                : "Enter valid Email";
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value.trim();
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: 'Enter email',
                              labelText: 'email'),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      
                        child: TextFormField(
                          validator: (value) {
                            return value!.length > 6
                                ? null
                                : "Password must be min 6 letters";
                          },
                          onChanged: (value) {
                            _password = value;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: 'Enter Password',
                              labelText: 'password'),
                        ),
                      ),
                    
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 150),
                          child: RaisedButton(
                            onPressed: () {
                              auth.signInWithEmailAndPassword(
                                  email: _email, password: _password);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage()),
                                  (route) => false);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            'Dont have an account?',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Signup.id);
                            },
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
