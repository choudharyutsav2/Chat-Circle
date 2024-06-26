import 'package:flutter/material.dart';
import 'package:chat_circle/components/RoundedButtons.dart';
import 'package:chat_circle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  
  bool showSpinner=false;
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/rmlogo.png'),
                ),
              ),
        
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                },
                decoration:kMessageTextFieldDecoration.copyWith(hintText: 'Enter your email')
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value;
                },
                decoration: kMessageTextFieldDecoration.copyWith(hintText: 'Enter your password')
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(title: 'Register', colour: Colors.blueAccent,
                  onPressed: ()async {
                    setState(() {
                      showSpinner=true;
                    });
                try{
                  final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newUser !=null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    showSpinner=false;
                  });
                }
                catch(e){
                  print(e);
                }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
