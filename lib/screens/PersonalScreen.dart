import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_final_project/screens/main_screen.dart';
import 'package:women_safety_final_project/widget/help_button.dart';
import 'package:women_safety_final_project/widget/get_lat_long_address.dart';
import '../widget/get_lat_long_address.dart';
import 'emailVerification_screen.dart';
import 'login_screen.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({Key? key}) : super(key: key);

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  final updatedName = TextEditingController();
  final updatedEmail = TextEditingController();
  final oldPassword = TextEditingController();
  final updatedPhone = TextEditingController();
  final updatedPassword = TextEditingController();
  final user =
      FirebaseFirestore.instance.collection('users').doc('birthday').get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('id',
                          isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final data = snapshot.data?.docs[0];
                      return Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: const Color(0xFFDD88CF),
                                  padding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: const Color(0xFFF5F6F9),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: Text(
                                      data!['name'],
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (builder) {
                                              return SimpleDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                contentPadding:
                                                    EdgeInsets.all(20),
                                                titlePadding:
                                                    EdgeInsets.all(20),
                                                children: [
                                                  TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: 'Name'),
                                                    controller: updatedName,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      String pass = '';
                                                      String phone = '';
                                                      String birthday = '';
                                                      String created_at = '';
                                                      String dropdownValue = '';

                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              ?.uid)
                                                          .get()
                                                          .then((value) {
                                                        pass =
                                                            value['password'];
                                                        phone = value['phone'];
                                                        birthday =
                                                            value['birthday'];
                                                        created_at =
                                                            value['created_at']
                                                                .toString();
                                                        dropdownValue = value[
                                                            'dropdownValue'];
                                                      });

                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              ?.uid)
                                                          .set({
                                                        'email': FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.email,
                                                        'id': FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.uid,
                                                        'name':
                                                            updatedName.text,
                                                        'password': pass,
                                                        'phone': phone,
                                                        'birthday': birthday,
                                                        'dropdownValue':
                                                            dropdownValue,
                                                        'created_at': created_at
                                                            .toString(),
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color(0xFFDD88CF),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                        'Update Name'),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: const Color(0xFFDD88CF),
                                  padding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: const Color(0xFFF5F6F9),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.password),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: Text(
                                      "Password",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (builder) {
                                              return SimpleDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                titlePadding:
                                                    EdgeInsets.all(20),
                                                children: [
                                                  TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Old Password'),
                                                    controller: oldPassword,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'New Password'),
                                                    controller: updatedPassword,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      String name = '';
                                                      String phone = '';
                                                      String birthday = '';
                                                      String created_at = '';
                                                      String dropdownValue = '';

                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              ?.uid)
                                                          .get()
                                                          .then((value) {
                                                        name = value['name'];
                                                        phone = value['phone'];
                                                        birthday =
                                                            value['birthday'];
                                                        created_at =
                                                            value['created_at']
                                                                .toString();
                                                        dropdownValue = value[
                                                            'dropdownValue'];
                                                      });
                                                      var cred = EmailAuthProvider
                                                          .credential(
                                                              email: FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .email
                                                                  .toString(),
                                                              password:
                                                                  oldPassword
                                                                      .text);

                                                      try {
                                                        FirebaseAuth.instance
                                                            .currentUser
                                                            ?.updatePassword(
                                                                updatedPassword
                                                                    .text);

                                                        await FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.reauthenticateWithCredential(
                                                                cred);
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection('users')
                                                            .doc(FirebaseAuth
                                                                .instance
                                                                .currentUser
                                                                ?.uid)
                                                            .set({
                                                          'email': FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              ?.email,
                                                          'id': FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              ?.uid,
                                                          'name': name,
                                                          'birthday': birthday,
                                                          'created_at':
                                                              created_at
                                                                  .toString(),
                                                          'dropdownValue':
                                                              dropdownValue,
                                                          'password':
                                                              updatedPassword
                                                                  .text,
                                                          'phone': phone,
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      } on FirebaseAuthException catch (e) {
                                                        if (e.code ==
                                                            'wrong-password') {
                                                          print(
                                                              'The old password provided is incorrect.');
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                              title: Text(
                                                                  'Incorrect Password'),
                                                              content: Text(
                                                                  'The old password you provided is incorrect.'),
                                                              actions: <Widget>[
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            246,
                                                                            121,
                                                                            82,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                      'OK'),
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          print(
                                                              'Something went wrong: ${e.message}');
                                                        }
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFDD88CF),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                        'Update Password'),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: const Color(0xFFDD88CF),
                                  padding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: const Color(0xFFF5F6F9),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.email),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: Text(
                                      data!['email'],
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: const Color(0xFFDD88CF),
                                  padding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: const Color(0xFFF5F6F9),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.phone),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: Text(
                                      data!['phone'],
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )),
                                    InkWell(
                                      onTap: () async {
                                        showDialog(
                                            context: context,
                                            builder: (builder) {
                                              return SimpleDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                titlePadding:
                                                    const EdgeInsets.all(20),
                                                children: [
                                                  TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: 'Phone'),
                                                    controller: updatedPhone,
                                                    keyboardType:
                                                        TextInputType.phone,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      String name = '';
                                                      String pass = '';
                                                      String birthday = '';
                                                      String created_at = '';
                                                      String dropdownValue = '';

                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              ?.uid)
                                                          .get()
                                                          .then((value) {
                                                        name = value['name'];
                                                        pass =
                                                            value['password'];
                                                        birthday =
                                                            value['birthday'];
                                                        created_at =
                                                            value['created_at']
                                                                .toString();
                                                        dropdownValue = value[
                                                            'dropdownValue'];
                                                      });

                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              ?.uid)
                                                          .set({
                                                        'email': FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.email,
                                                        'id': FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.uid,
                                                        'name': name,
                                                        'password': pass,
                                                        'phone':
                                                            updatedPhone.text,
                                                        'birthday': birthday,
                                                        'dropdownValue':
                                                            dropdownValue,
                                                        'created_at': created_at
                                                            .toString(),
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color(0xFFDD88CF),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                        'Update Phone'),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextButton.icon(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return Example();
                                }));
                              },
                              label: Text('Logout',
                                  style: TextStyle(color: Colors.white)),
                              icon: Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFB400FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                minimumSize: Size(120, 45),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Container(
                                height: 100,
                                width: 300,
                                child: get_lat_long_address(),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  });
            } else {
              return login_screen();
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error Occured'),
            );
          }
          return Text('');
        },
      ),
    );
  }
}
