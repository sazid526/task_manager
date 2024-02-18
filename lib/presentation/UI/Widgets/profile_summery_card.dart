import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Screens/edit_profile_screen.dart';

class ProfileSummeryCard extends StatelessWidget {
  const ProfileSummeryCard({
    super.key,
     this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfileScreen(),
            ),
          );
        }
      },
      tileColor: Colors.green,
      leading:const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.pexels.com/photos/15868390/pexels-photo-15868390/free-photo-of-bag-of-tulips.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
      ),
      title: const Text(
        "Sazid arefin",
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      ),
      subtitle: const Text(
        "sazidarefin@gmail.com",
        style: TextStyle(color: Colors.white),
      ),
      trailing: enableOnTap ? const Icon(
        Icons.arrow_forward_outlined,
        color: Colors.white,
      ) : null,
    );
  }
}
