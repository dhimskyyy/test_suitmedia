import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_suitmedia/core/constants/colors.dart';
import 'package:test_suitmedia/core/constants/text_styles.dart';
import 'package:test_suitmedia/providers/user_provider.dart';
import 'package:test_suitmedia/widgets/user_tile.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.fetchUsers();

      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 300 &&
            userProvider.hasMore &&
            !userProvider.isLoading) {
          userProvider.fetchUsers();
        }
      });
    });
  }

  Future<void> _refresh() async {
    await Provider.of<UserProvider>(context, listen: false)
        .fetchUsers(isRefresh: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: IconColors.iconBack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Choose a User", style: AppTextStyles.headerScreen),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: AppColors.line,
            height: 0.5,
          ),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.users.isEmpty && provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.users.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: provider.users.length + (provider.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < provider.users.length) {
                  final user = provider.users[index];
                  return UserTile(
                    user: user,
                    onTap: () {
                      Navigator.pop(context, user.fullName);
                    },
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
