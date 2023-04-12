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

  Widget _buildInfoWidget(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 40, 22, 0),
      child: Column(
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
                    Text(
                      'Brice Séraphin',
                      style: themeData.textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text('Product& Product Designer'),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: themeData.textTheme.bodyText1!.color,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Paris, France',
                          style: themeData.textTheme.caption,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.favorite_outline, color: themeData.primaryColor)
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Enthusiastic young computer Geek, Freelance Designer in love of independence, I have alot of experience in graphical projects, and always give the best of myself to bring you to success.',
            style: themeData.textTheme.bodyText1,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: Column(
        children: [_buildInfoWidget(themeData), const Divider()],
      ),
    );
  }
}
