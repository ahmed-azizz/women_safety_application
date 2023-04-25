import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:women_safety_final_project/screens/forgetPassword_screen.dart';
import 'package:women_safety_final_project/screens/login_screen.dart';
import 'package:women_safety_final_project/screens/main_screen.dart';
import 'package:women_safety_final_project/screens/signup_screen.dart';
import 'package:women_safety_final_project/screens/onBoard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _LoginPaeState();
}

class _LoginPaeState extends State<login_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("  Lets Sign you in",
                style: TextStyle(
                  fontSize: 35.05,
                  color: Color(0xFFD688DD),
                  fontWeight: FontWeight.bold,
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("   Welcome Back ,\n   You have been missed",
                style: TextStyle(
                  fontSize: 26.52,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: const Color.fromRGBO(246, 121, 82, 1),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Color(0xFFD688DD)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                hintText: "Email ,phone & username",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorColor: const Color.fromRGBO(246, 121, 82, 1),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password, color: Color(0xFFD688DD)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                hintText: "Password",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // FirebaseFirestore.instance
                  //     .collection('users')
                  //     .doc()
                  //     .set({
                  //   'last_login': DateTime.now(),
                  //
                  // });
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const forgetPassword_screen();
                  }));
                },
                child: const Text(
                  "Forget password ?     ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDD88CF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
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
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) {
                  return Example();
                }));
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text('Wrong Credentials'),
                      titleTextStyle:
                          TextStyle(color: Colors.deepOrange, fontSize: 18),
                      content: Text(
                          'Email and password are incorrect or user not created'),
                    );
                  },
                );
              }
            },
            child: Text('Sign in',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don’t have an Account ? ",
                style: TextStyle(color: Color(0xFF555454)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const signup_screen();
                  }));
                },
                child: const Text(
                  "Register now",
                  style: TextStyle(
                    color: Color(0xFFD688DD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//password:
//ahmed1122
