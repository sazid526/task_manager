import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Widgets/profile_summery_card.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          ProfileSummeryCard(
            enableOnTap: false,
          ),
          Expanded(child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.all(16),
            child: Column(
              children: [
                
              ],
            ),
            ),
          ))
        ],
      ),),
    );
  }
}
