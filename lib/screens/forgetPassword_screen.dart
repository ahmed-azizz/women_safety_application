import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class forgetPassword_screen extends StatelessWidget {
  const forgetPassword_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(" Reset password ",
                style: TextStyle(
                  fontSize: 26.52,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: const Color(0xFFDD88CF),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Color(0xFFD688DD)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                hintText: "write your email address",
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDD88CF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                minimumSize: Size(width * 0.8, height * 0.07)),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFDD88CF),
                      ),
                    );
                  });

              final email = emailController.text.trim();
              final userSnapshot = await FirebaseFirestore.instance
                  .collection('users')
                  .doc(email)
                  .get();

              if (!userSnapshot.exists) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      titleTextStyle:
                          TextStyle(color: Color(0xFFDD88CF), fontSize: 18),
                      content: Text('Email is incorrect'),
                    );
                  },
                );
                return;
              }

              try {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Reset email successfully sent'),
                    );
                  },
                );
              } on FirebaseAuthException catch (e) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      titleTextStyle:
                          TextStyle(color: Color(0xFFDD88CF), fontSize: 18),
                      content: Text(
                          'An error occurred while sending the reset email'),
                    );
                  },
                );
              }
            },
            child: const Text(
              'Reset',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
