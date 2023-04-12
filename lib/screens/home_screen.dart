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

  Widget _buildInfoWidget() {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/profile_image.png',
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Brice Séraphin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text('Product& Product Designer'),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                      ),
                      Text(
                        'Paris, France',
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.favorite_outline)
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Text(
            'Enthusiastic young computer Geek, Freelance Designer in love of independence, I have alot of experience in graphical projects, and always give the best of myself to bring you to success.')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 40, 22, 0),
        child: Column(
          children: [
            _buildInfoWidget(),
          ],
        ),
      ),
    );
  }
}
