import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Widgets/profile_summery_card.dart';
import 'package:task_manager/presentation/UI/Widgets/summery_card.dart';
import 'package:task_manager/presentation/UI/Widgets/task_item_card.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const ProfileSummeryCard(),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Row(
                children: [
                  SummeryCard(
                    count: "9",
                    label: "New",
                  ),
                  SummeryCard(
                    count: "12",
                    label: "In Progress",
                  ),
                  SummeryCard(
                    count: "15",
                    label: "Completed",
                  ),
                  SummeryCard(
                    count: "6",
                    label: "Cancelled",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const TaskItemCard(
                  message: "New",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
