import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:provider/providers/user_provider.dart';

class UserDetailPage extends ConsumerWidget {
  final int userId;
  const UserDetailPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: userDetail.when(
        data: (user) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Divider(),
              UserInfo(info: user.username, icon: Icons.account_circle),
              UserInfo(info: user.email, icon: Icons.email_rounded),
              UserInfo(info: user.phone, icon: Icons.phone_enabled),
              UserInfo(info: user.website, icon: Icons.web_rounded),
            ],
          );
        },
        error: (e, _) {
          return Center(child: Text(e.toString()));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String info;
  final IconData icon;
  const UserInfo({
    super.key,
    required this.info,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 20),
        Text(info, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
