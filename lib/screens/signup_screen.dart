import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:women_safety_final_project/screens/emailVerification_screen.dart';
import 'package:women_safety_final_project/screens/login_screen.dart';
import 'package:women_safety_final_project/screens/signup_screen.dart';
import 'package:women_safety_final_project/screens/onBoard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({Key? key}) : super(key: key);

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birthday = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String dropdownValue = 'Erbil';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Text("Lets Register account",
                    style: TextStyle(
                      fontSize: 35.05,
                      color: Color(0xFFD688DD),
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: Text("Hello user , you have a \ngreatful journey",
                      style: TextStyle(
                        fontSize: 26.52,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    controller: name,
                    textInputAction: TextInputAction.next,
                    cursorColor: Color.fromRGBO(246, 121, 82, 1),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      hintText: "Full name",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    cursorColor: Color.fromRGBO(246, 121, 82, 1),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      hintText: "Phone number",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: Color.fromRGBO(246, 121, 82, 1),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      hintText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter at min 6 characters'
                        : null,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    cursorColor: Color.fromRGBO(246, 121, 82, 1),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      hintText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    controller: birthday,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.done,
                    cursorColor: Color.fromRGBO(246, 121, 82, 1),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      hintText: "Birthday",
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(15),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    value: dropdownValue,
                    items: <String>['Erbil', 'Sulaymani', 'Duhok', 'Hallabja']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          "   " + value,
                          style: TextStyle(),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        print(dropdownValue);
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB400FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: Size(width * 0.8, height * 0.07)),
                  onPressed: () async {
                    try {
                      final result = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(result.user?.uid)
                          .set({
                        'name': name.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                        'phone': phone.text,
                        'id': result.user?.uid,
                        'birthday': birthday.text,
                        'created_at': DateTime.now(),
                        'dropdownValue': dropdownValue,
                      });

                      final user = FirebaseAuth.instance.currentUser;
                      await user?.sendEmailVerification();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return login_screen();
                      }));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  'Account succefully Created \n a verification email sent to your email please verify your account'),
                            );
                          });
                      FocusScope.of(context).dispose();
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            titleTextStyle: TextStyle(
                                color: Colors.deepOrange, fontSize: 18),
                            content: Text('Email is incorrect'),
                          );
                        },
                      );
                    }
                    birthday.text = '';
                    emailController.text = '';
                    passwordController.text = '';
                    name.text = '';
                    phone.text = '';

                    FocusScope.of(context).dispose();
                  },
                  child: const Text('Sign Up',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have account ? ",
                      style: const TextStyle(color: Color(0xFF555454)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return login_screen();
                        }));
                      },
                      child: Text(
                        "Log in",
                        style: const TextStyle(
                          color: Color(0xFFB400FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
