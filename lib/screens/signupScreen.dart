// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../helpers/authenticationHelper.dart';
import 'loginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }
  var n=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white54Color,
      appBar: AppBar(
        backgroundColor: white30Color,
        title: const Text('Signup Screen'),
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/images/loginn.png'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: whiteColor,
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
                          child: Text("Enter Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
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
                          child: Text("Enter Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
                        ),
                        TextFormField(
                          controller: password,
                          validator: (String? password) {
                            if (password != null && password.isEmpty) {
                              return "Password is Required";
                            }
                            else if(password!.length<7)
                            {
                              return "Minimum Password length is 7 ";
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
                          width: 110,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(buttonColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                              ),
                            ),    
                            child: const Text('Signup',style: TextStyle(fontSize: 20, color: blackColor),),
                            onPressed:(){
                               _saveForm();
                                if(_isValid==true)
                                  {
                                    AuthenticationHelper()
                                        .signUp(email.text, password.text)
                                        .then((result) {
                                      if (result == null) {
                                        print("OK");
                                        showAlertDialog(context);
                                      } else {
                                        print("NO");
                                        showAlertDialogForError(context);
                                      }
                                    });
                                  }
                            }
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                        onPressed: (){
                         Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                                  (Route<dynamic> route) => false,
                            );
                        },
                        child: const Text('Already have an Account ? Login Now !',style: TextStyle(fontSize: 18, color: buttonColor),),
                          ),
                        const SizedBox(
                          height: 120,
                        ),
                        const Center(
                            child: Text('Developed by Noman Ali (FA19-BSE-050)',style: TextStyle(fontSize: 15, color: buttonColor, letterSpacing: 1, fontWeight: FontWeight.bold),),
                          ),
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
showAlertDialog(BuildContext context) {
  Widget continueButton = TextButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
    child: const Text("OK", style: TextStyle(color: blackColor),),
    onPressed:  () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: bgColor,
    title: const Text("Signed Up", style: TextStyle(color: whiteColor),),
    content: const Text("Your Account has been created",style: TextStyle(color: whiteColor),),
    actions: [
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showAlertDialogForError(BuildContext context) {

  Widget continueButton = TextButton(
    child: const Text("OK"),
    onPressed:  () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignupScreen()));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error"),
    content: const Text("This Account cannot be created"),
    actions: [
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



 



