import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/homepage.dart';
import 'package:todo/screens/login.dart';
import 'package:todo/screens/signup.dart';
import 'package:todo/screens/todoprovider.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ToDo',
          initialRoute: Login.id,
          routes: {
            Welcome.id: (context) => Welcome(),
            Login.id: (context) => Login(),
            Signup.id: (context) => Signup(),
            Homepage.id: (context) => Homepage(),
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
