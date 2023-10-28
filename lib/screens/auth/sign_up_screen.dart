import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/my_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconpassword = CupertinoIcons.eye_fill;
  bool obsecurePassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: nameController,
              hintText: 'Name',
              obsecureText: false,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.person),
              errorMsg: _errorMsg,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill this field';
                } else if (val.length > 4) {
                  return 'Please give full name';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obsecureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
              errorMsg: _errorMsg,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill this field';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                    .hasMatch(val)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obsecureText: obsecurePassword,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.lock),
              errorMsg: _errorMsg,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill this field';
                } else if (val.length >= 6) {
                  return 'password should length 6 character';
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePassword = !obsecurePassword;
                    if (!obsecurePassword) {
                      iconpassword = CupertinoIcons.eye_fill;
                    } else {
                      iconpassword = CupertinoIcons.eye_slash_fill;
                    }
                  });
                },
                icon: Icon(iconpassword),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        )),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 6),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
