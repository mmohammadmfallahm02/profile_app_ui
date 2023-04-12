import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  AppBar _buildAppBarWidget() {
    return AppBar(
      title: const Text('Curriculum Vitae'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.light_mode)),
        const Icon(Icons.more_vert),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: const Center(
        child: Text('Profile app'),
      ),
    );
  }
}
