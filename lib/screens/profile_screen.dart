import 'package:flutter/material.dart';
import 'package:t_shirt_app/repository/user_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _ProfileState();
  }
}

final user = UserService.selectedUser!;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: const Text(
              '',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(''),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 25),
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
