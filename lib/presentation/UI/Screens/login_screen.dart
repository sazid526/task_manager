import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Widgets/body_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
          child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 160,
            ),
             Text(
              "Get Start with",
              style: Theme.of(context).textTheme.titleLarge
            ),
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
              child: ElevatedButton(onPressed: (){

              },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400
              ), child: const Icon(Icons.arrow_circle_right_outlined,color: Colors.white,),),
            ),
            const SizedBox(height: 40,),
            const Center(
              child: Text("Forget Password ?",style: TextStyle(
                color: Colors.grey
              ),),
            ),
            const SizedBox(
              height: 8,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){

                }, child: const Text("Don't have an account?"),),
                const SizedBox(width: 8,),
               const Text("Sign up",style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500
                ),)
              ],
            )
          ],
        ),
      )),
    );
  }
}
