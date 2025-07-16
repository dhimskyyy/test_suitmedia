import 'package:flutter/material.dart';
import 'package:test_suitmedia/core/constants/text_styles.dart';
import 'package:test_suitmedia/data/models/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text(user.fullName, style: AppTextStyles.input),
      subtitle: Text(user.email),
      onTap: onTap,
    );
  }
}
