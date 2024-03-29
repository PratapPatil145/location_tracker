import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_map_live/login/login.dart';

import '../api/apicall.dart';
import '../main.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
   String email = '', pass = '';
  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            onChanged: (value) {
                              pass = value;
                            },
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      try {
                                        UserCredential userCredential =
                                            await FirebaseAuth.instance
                                                .createUserWithEmailAndPassword(
                                                    email: email,
                                                    password: pass);
                                         ApiCall().showToast("Registration Successfully", context);
                                         await Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => MyLogin()));
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'weak-password') {
                                          print(
                                              'The password provided is too weak.');
                                        } else if (e.code ==
                                            'email-already-in-use') {
                                          print(
                                              'The account already exists for that email.');
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MyRegister extends StatelessWidget {
//   const MyRegister({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String email = '', pass = '';
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.only(left: 30, right: 30),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 onChanged: (value) {
//                   email = value;
//                 },
//                 decoration: InputDecoration(hintText: 'Email'),
//               ),
//               TextField(
//                 onChanged: (value) {
//                   pass = value;
//                 },
//                 obscureText: true,
//                 decoration: InputDecoration(hintText: 'Password'),
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       UserCredential userCredential = await FirebaseAuth
//                           .instance
//                           .createUserWithEmailAndPassword(
//                               email: email, password: pass);
//                       Navigator.pushNamed(context, 'home');
//                     } on FirebaseAuthException catch (e) {
//                       if (e.code == 'weak-password') {
//                         print('The password provided is too weak.');
//                       } else if (e.code == 'email-already-in-use') {
//                         print('The account already exists for that email.');
//                       }
//                     } catch (e) {
//                       print(e);
//                     }
//                   },
//                   child: Text('Create')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
