import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:cv_maker/screen/loginpage.dart';
import 'package:cv_maker/screen/homepage.dart';
void main() => runApp(App());
class App extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home:LandingPage(),
    );
  }
}
class LandingPage extends StatelessWidget
{
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(body:Center(child:Text("error ${snapshot.error}")));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
          builder:(context,snapshot)
              {
                if(snapshot.connectionState == ConnectionState.active)
                  {
                    User user =snapshot.data;
                  if(user == null)
                    {
                    return LoginPage();
                    }
                  else
                    {
                      return HomePage();
                    }
                  }
                return Scaffold(body:Center(child:Text("checking login")));
              }
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(body:Center(child:Text("connecting to app")));
      },
    );
  }
  }