import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Widgets/profile_summery_card.dart';

class CancelledTaskScreen extends StatelessWidget {
  const CancelledTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ProfileSummeryCard(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // return const TaskItemCard(
                //   message: "Cancelled",
                // );
              },
            ),
          )
        ],
      ),
    );;
  }
}
