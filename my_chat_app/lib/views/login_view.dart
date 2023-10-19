import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_chat_app/constans.dart';
import 'package:my_chat_app/helper/show_snack_bar.dart';
import 'package:my_chat_app/views/chat_view.dart';
import 'package:my_chat_app/views/home_view.dart';
import 'package:my_chat_app/views/register_view.dart';
import 'package:my_chat_app/widgets/custom_button.dart';
import 'package:my_chat_app/widgets/custon_text_feild.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  static String id = "/signIn";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
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
                  "SIGN IN",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //!textFields
              CustomTextFormField(
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ), // email
              CustomTextFormField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ), // password
              const SizedBox(height: 10),
              //!sign in button
              CustomButton(
                  onTap: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (formKey.currentState!.validate()) {
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        print(user.user!.email);
                        Navigator.pushReplacementNamed(context, ChatView.id, arguments: user.user!.email);
                      } on FirebaseException catch (e) {
                        showMessage(context, 'INVALID LOGIN CREDENTIALS');
                        print(e.code);
                      }
                    }
                  },
                  buttonText: 'Sign In'),
              //! sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not yet a member?",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, SignUpView.id);
                    },
                    child: const Text("Sign up",
                        style:
                            TextStyle(color: Color(0xff031C68), fontSize: 22)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
