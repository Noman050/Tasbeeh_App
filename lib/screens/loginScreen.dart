// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../helpers/authenticationHelper.dart';
import 'homeScreen.dart';
import 'signupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 65.0,
                  backgroundImage: AssetImage('assets/images/loginn.png'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
                shadowColor: white30Color,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child:

                  Form(
                    key: _form,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(
                          height: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Enter Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: buttonColor
                                  )

                              ),
                              hintText: "abc@gmail.com"
                          ),
                          validator: (value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'Email field is required';
                            }
                            // using regular expression
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            // the email is valid
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Enter Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: password,
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Password is Required";
                              }
                              return null;
                            },
                          decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: buttonColor
                                  )
                              ),
                              hintText: "*******"
                          ),
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                        SizedBox(
                          height: 40,
                          width: 110,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(buttonColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                              ),
                            ),    
                            child: const Text('Login',style: TextStyle(fontSize: 20, color: blackColor),),
                            onPressed:(){
                              _saveForm();
                              if(_isValid==true){
                                AuthenticationHelper()
                                    .signIn(email.text,  password.text)
                                    .then((result) {
                                  if (result == null) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) =>const HomeScreen()),
                                          (Route<dynamic> route) => false,
                                    );
                                  } else {
                                    print("NO");
                                  }
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextButton(
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const SignupScreen()),
                                    (Route<dynamic> route) => false,
                              );
                          },
                          child: const Text('Not Registered Yet ? Signup Now !',style: TextStyle(fontSize: 18, color: buttonColor),),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        const Center(
                          child: Text('Developed by Noman Ali (FA19-BSE-050)',style: TextStyle(fontSize: 15, color: whiteColor, letterSpacing: 1, fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}