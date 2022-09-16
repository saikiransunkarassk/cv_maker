import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

String _email,_password,message="OK";
bool pp=false;
class LoginPage extends StatefulWidget
{
  _LoginPage createState() => _LoginPage();
}
class _LoginPage extends State<LoginPage>
{
  Future<void> _createUser() async
  {
    try{
      pp=false;
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
    }on FirebaseAuthException catch (e)
    {
      setState(() {
        message="error:$e";
        pp=true;
      });

    }
    catch(e)
    {
      setState(() {
        message="error:$e";
        pp=true;
      });

    }
  }
  Future<void> _login() async
  {
    try{
      pp=false;
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    }on FirebaseAuthException catch (e)
    {
      setState(() {
        message="error:$e";
        pp=true;
      });
    }
    catch(e)
    {
      setState(() {
        message="error:$e";
        pp=true;
      });
    }
  }
  Widget build(BuildContext context)
  {
    int wf=(MediaQuery.of(context).size.width/360.0).floor();
    int hf=(MediaQuery.of(context).size.height/740.0).floor();
    return Scaffold(resizeToAvoidBottomInset:false,body:Center(child:Container(decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assert/ba.jpg"),
        fit: BoxFit.cover,

      ),

    ),width:double.infinity,height:double.infinity,child:
    Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        SizedBox(height: 30*hf+0.0),
       Visibility(child:Text(message,style:TextStyle(color: Colors.red)),visible:pp),
        SizedBox(height: 220*hf+0.0),Container(width:300,child:TextField(keyboardType: TextInputType.emailAddress,
        style:TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter Email",
          hintStyle:TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.black54,
        ),
        onChanged: (value)
        {
          _email=value;
        },
      )),
        SizedBox(height: 20*hf+0.0),
       Container(
           width:300,child: TextField(keyboardType: TextInputType.visiblePassword,
         style:TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Password",
            hintStyle:TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.black54,
          ),

         obscureText: true,
          cursorColor: Colors.white,

          onChanged: (value)
          {
            _password=value;
          },
        )),
        MaterialButton(onPressed: _login,
          child:Text("             Log-in             "),
          color: Colors.blue,
          focusColor:Colors.lightBlue,

        ),
        SizedBox(height: 200*hf+0.0),
        MaterialButton(onPressed:_createUser,
          child:Text("Create New Account",style:TextStyle(color: Colors.white)),
          color: Colors.indigo,
          focusColor:Colors.cyan,
        )
      ]
    )
    )
    )
    );
  }
}