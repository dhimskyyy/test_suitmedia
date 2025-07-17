import 'package:flutter/material.dart';
import 'package:test_suitmedia/core/constants/colors.dart';
import 'package:test_suitmedia/core/constants/text_styles.dart';
import 'package:test_suitmedia/data/models/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 38),
          leading: SizedBox(
            width: 49,
            height: 49,
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
          ),
          title: Text(user.fullName, style: AppTextStyles.input),
          subtitle: Text(user.email, style: const TextStyle(fontSize: 10)),
          onTap: onTap,
        ),
        const Divider(
          height: 0.5,
          thickness: 0.5,
          color: AppColors.line,
          indent: 20,
          endIndent: 21,
        ),
      ],
    );
  }
}
