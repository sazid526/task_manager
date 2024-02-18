import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/utility/urls.dart';
import 'package:task_manager/presentation/UI/Screens/authentication/signup_screen.dart';
import 'package:task_manager/presentation/UI/Screens/authentication/verify_email_screen.dart';
import 'package:task_manager/presentation/UI/Screens/main_bottom_nav_screen.dart';
import 'package:task_manager/presentation/UI/Widgets/body_background.dart';
import 'package:task_manager/presentation/UI/Widgets/center_circuler_indicatior.dart';
import 'package:task_manager/presentation/UI/Widgets/snack_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _loginInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
          child: Padding(
        padding: EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 160,
                ),
                Text("Get Start with",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            .hasMatch(value!)) {
                      return "Enter your valied email address";
                    }
                    return null;
                  },
                  controller: _emailTEcontroller,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value!)) {
                      return "Enter valied password. you must contain at least one upper case, one lower case . one digit and one Special character and length must at least 8 letter";
                    }
                    return null;
                  },
                  controller: _passwordTEcontroller,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: _loginInProgress == false,
                    replacement: const CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _logIn,
                      child: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifyEmailScreen()));
                    },
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account?",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text("Sign up",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.green)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passwordTEcontroller.dispose();
    _emailTEcontroller.dispose();
  }

  Future<void> _logIn() async {
    _loginInProgress = true;
    setState(() {});
    if(_formKey.currentState!.validate()) {
      final Response response = await post(Uri.parse(Urls.signIn), body: {
        "email": _emailTEcontroller.text.trim(),
        "password": _passwordTEcontroller.text.trim()
      });
      _loginInProgress = false;
      setState(() {});
      if (response.statusCode == 200) {
        if (mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainBottomNavScreen()));
        }
      } else {
        if (response.statusCode == 401) {
          if (mounted) {
            appSnackMessage(context, "Please Check Your Email/password");
          }
        } else {
          if (mounted) {
            appSnackMessage(context, "Login Failed. try again");
          }
        }
      }
    }
  }
}
