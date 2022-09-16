import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget
{
  _HomePage createState() => _HomePage();
}
var fn;int hf,wf;
class _HomePage extends State<HomePage>
{
  Widget build(BuildContext context)
  {
   wf=(MediaQuery.of(context).size.width/360).floor();
   hf=(MediaQuery.of(context).size.width/780).floor();
    return Scaffold(appBar:AppBar(actions: [Positioned(height:20*hf+0.0 ,left:270*wf+0.0,child: MaterialButton(onPressed: ()async{
      await FirebaseAuth.instance.signOut();
    },child:Text("Sign-out",style:TextStyle(color: Colors.white),)))],backgroundColor: Colors.blueGrey,elevation:0,),body:Container(
     decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assert/ba.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      child: Stack(children:[
        Center(child:Container(color:Colors.black54,width:300*wf+0.0,height:500*hf+0.0,child:GridView.count(
          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0,50.0),
          crossAxisCount: 2,
          mainAxisSpacing: 37*hf+0.0,
          children: List.generate(3,(index){
            return GestureDetector(
                onTap: (){
                  fn=index;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FillPage()),

                  );
                },
                child:Image(image:
              FirebaseImage('gs://cvmaker-12026.appspot.com/templates/${index+1}.jpg'),
              width: 300*wf+0.0,
                )
           );
          }),

        )))

        ,Positioned(child: Card(child:Text("Select Template",style:TextStyle(fontSize: 25))),left:100*wf+0.0,top:60*hf+0.0),])
    ));
  }
}
class FillPage extends StatefulWidget {
  _FillPageState createState() => _FillPageState();
}
final _screenshotController = ScreenshotController();
class _FillPageState extends State<FillPage> {
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset : false,
      appBar:AppBar(actions: [Positioned(height:20*hf+0.0 ,left:270*wf+0.0,child: MaterialButton(onPressed: ()async{
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context);
    },child:Text("Sign-out",style:TextStyle(color:Colors.white))))],backgroundColor: Colors.blueGrey,),
      body: Screenshot(controller:_screenshotController,child:Container(height:double.infinity,width:double.infinity,decoration: BoxDecoration(image:DecorationImage(image:FirebaseImage('gs://cvmaker-12026.appspot.com/templates/${fn+1}.jpg'),)),
      child:Stack(children:
      [
     Stack(children:[Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 12*wf*hf+0.0,fontWeight: FontWeight.bold),),width:150,height:10),top:90,left:10),
      Positioned(child: Container(child: TextField(minLines:2,maxLines:3,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:200,height:70),top:95,left:10),
      Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 10)),width:30,height:10),top:180,left:10),
        Positioned(child: Container(child: TextField(minLines:2,maxLines:3,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:180,height:70),top:160,left:50),
      Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 10)),width:30,height:10),top:220,left:10),
        Positioned(child: Container(child: TextField(minLines:2,maxLines:3,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:180,height:70),top:200,left:50),
      Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 10)),width:30,height:10),top:260,left:10),
        Positioned(child: Container(child: TextField(minLines:2,maxLines:3,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:180,height:70),top:240,left:50),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 10)),width:30,height:10),top:320,left:10),
        Positioned(child: Container(child: TextField(minLines:2,maxLines:3,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:180,height:70),top:300,left:50),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 10*wf*hf+0.0)),width:30,height:10),top:360,left:10),
        Positioned(child: Container(child: TextField(minLines:2,maxLines:3,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:180,height:70),top:340,left:50),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 10*wf*hf+0.0)),width:30,height:10),top:400,left:10),
        Positioned(child: Container(child: TextField(minLines:2,maxLines:3,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:180,height:70),top:380,left:50),
        Positioned(child: Container(child: TextField(minLines:2,maxLines:5,style:TextStyle(fontSize: 10*wf*hf+0.0)),width:180,height:100),top:470,left:10),
        Positioned(child: Container(child: Text("Phone Number",style:TextStyle(fontSize: 12*wf*hf+0.0,fontWeight: FontWeight.bold)),width:100,height:20),top:200,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 12*wf*hf+0.0)),width:100,height:10),top:220,left:240),
        Positioned(child: Container(child: Text("Email-id",style:TextStyle(fontSize: 12*wf*hf+0.0,fontWeight: FontWeight.bold)),width:100,height:20),top:240,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9*wf*hf+0.0)),width:150,height:10),top:260,left:240),

        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9)),width:150,height:10),top:350,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9)),width:150,height:10),top:380,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9)),width:150,height:10),top:410,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9)),width:150,height:10),top:440,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9)),width:150,height:10),top:500,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9)),width:150,height:10),top:530,left:240),
        Positioned(child: Container(child: TextField(style:TextStyle(fontSize: 9)),width:150,height:10),top:560,left:240),
   ],),
        Positioned(child:MaterialButton(
          child:Text("Save"),
         color:Colors.blue,
         onPressed:_takeScreenshot,
        ),)
      ]
      )

      )
    ));

  }
  void _takeScreenshot() async {
    final uint8List = await _screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    await file.writeAsBytes(uint8List);
    await Share.shareFiles([file.path]);
  }
}


