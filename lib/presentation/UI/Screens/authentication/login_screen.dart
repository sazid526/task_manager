import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Screens/authentication/signup_screen.dart';
import 'package:task_manager/presentation/UI/Screens/authentication/verify_email_screen.dart';
import 'package:task_manager/presentation/UI/Screens/main_bottom_nav_screen.dart';
import 'package:task_manager/presentation/UI/Widgets/body_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
          child: Padding(
        padding: EdgeInsets.all(32.0),
        child: SingleChildScrollView(
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
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainBottomNavScreen(),),);
                  },
                  child: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyEmailScreen()));
                  },
                  child: const Text(
                    "Forget Password ?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Don't have any account?",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey
                    ),
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
                    child:  Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.green
                      )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
