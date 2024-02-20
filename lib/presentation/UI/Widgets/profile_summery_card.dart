import 'package:flutter/material.dart';
import 'package:task_manager/data/controller/auth_controller.dart';
import 'package:task_manager/presentation/UI/Screens/authentication/login_screen.dart';
import 'package:task_manager/presentation/UI/Screens/edit_profile_screen.dart';

class ProfileSummeryCard extends StatefulWidget {
  const ProfileSummeryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  State<ProfileSummeryCard> createState() => _ProfileSummeryCardState();
}

class _ProfileSummeryCardState extends State<ProfileSummeryCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (widget.enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        }
      },
      tileColor: Colors.green,
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.pexels.com/photos/15868390/pexels-photo-15868390/free-photo-of-bag-of-tulips.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
      ),
      title: Text(
        '${AuthController.user?.firstName} ${AuthController.user?.lastName}',
        style:
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      ),
      subtitle: Text(
        "${AuthController.user?.email}",
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await AuthController.clearAuthData();
          if (mounted) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
