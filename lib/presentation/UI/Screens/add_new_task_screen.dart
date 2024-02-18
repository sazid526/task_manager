import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Widgets/body_background.dart';
import 'package:task_manager/presentation/UI/Widgets/profile_summery_card.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ProfileSummeryCard(),
             Expanded(
               child: BodyBackground(
                 child: Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const SizedBox(
                         height: 50,
                       ),
                       Text("Add New Task",style: Theme.of(context).textTheme.titleLarge),
                       const SizedBox(
                         height: 8,
                       ),
                       TextFormField(
                         decoration: InputDecoration(
                           hintText: "Subject"
                         ),
                       ),
                       const SizedBox(
                         height: 8,
                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                             hintText: "Description"
                         ),
                         maxLines: 7,
                       ),
                       const SizedBox(height: 8,),
                       SizedBox(
                         width: double.infinity,
                         child: ElevatedButton(onPressed: (){

                         }, child: const Text("Add",style: TextStyle(
                           color: Colors.white
                         ),)),
                       )
                     ],
                   ),
                 ),
               ),
             )
         
           ],
         ),
       ),
    );
  }
}
