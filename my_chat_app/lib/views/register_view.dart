import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_chat_app/constans.dart';
import 'package:my_chat_app/helper/show_snack_bar.dart';
import 'package:my_chat_app/views/chat_view.dart';
import 'package:my_chat_app/views/home_view.dart';
import 'package:my_chat_app/views/login_view.dart';
import 'package:my_chat_app/widgets/custom_button.dart';
import 'package:my_chat_app/widgets/custon_text_feild.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});
  static String id = "/signUp";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //final TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              //!logo image
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
              //!title
              const Center(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //!email
              CustomTextFormField(
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ),

              //!password
              CustomTextFormField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ),

              // //!confirm Password
              // CustomTextField(
              //   controller: confirmPasswordController,
              //   obscureText: true,
              //   hintText: 'Confirm Password',
              // ),

              const SizedBox(height: 10),
              //!sign in button
              CustomButton(
                buttonText: 'Sign Up',
                onTap: () async {
                  String email = emailController.text;
                  String password = passwordController.text;
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await signUp(email, password);
                      Navigator.pushReplacementNamed(context, ChatView.id, arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        showMessage(context,
                            'the account already exists for that email');
                      } else if (e.code == 'weak-password') {
                        showMessage(context, 'weak password');
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  }
                },
              ),

              //! sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member?",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginView.id);
                    },
                    child: const Text("Sign in",
                        style: TextStyle(color: Colors.black, fontSize: 22)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp(String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    //print(user.user!.email);
  }
}
