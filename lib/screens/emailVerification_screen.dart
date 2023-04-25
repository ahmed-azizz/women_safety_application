import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:women_safety_final_project/screens/signup_screen.dart';
import 'package:women_safety_final_project/screens/main_screen.dart';

class emailVerification_screen extends StatefulWidget {
  const emailVerification_screen({Key? key}) : super(key: key);

  @override
  State<emailVerification_screen> createState() => _MainScreenState();
}

class _MainScreenState extends State<emailVerification_screen> {
  int opt = 0;

  @override
  void initState() {
    super.initState();
    signup_screen();
  }


  void verifyEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    //Check if user is not verified
    if (!(user!.emailVerified)) {
      user.sendEmailVerification();
    }
  }

  void sendResetPassword() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.sendPasswordResetEmail(
      email: user!.email.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            GestureDetector(
              onTap: () {
                verifyEmail();

                User? user = FirebaseAuth.instance.currentUser;
                //Check if user is not verified
                if ((user!.emailVerified)) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Example();
                  }));
                }
              },
              child: Container(

                height: 50,
                width: 200,
                color: Color(0xFFDD88CF),
                margin: EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Text(

                    "Verify Email",
                  ),
                ),

              ),

            ),


          ],
        ),
      ),
    );
  }
}