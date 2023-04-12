import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<SkillType> _skills = [];

  void updateSelectedListSkill(SkillType type) {
    _skills.contains(type) ? _skills.remove(type) : _skills.add(type);
    setState(() {});
  }

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
      padding: const EdgeInsets.fromLTRB(22, 40, 22, 30),
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

  Widget _buildSkillsWidget(ThemeData themeData) {
    return ExpansionTile(
      trailing: const SizedBox(),
      tilePadding: const EdgeInsets.only(left: 22, right: 22),
      childrenPadding: const EdgeInsets.only(bottom: 30),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Skills',
            style: TextStyle(color: themeData.textTheme.subtitle1!.color),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: themeData.textTheme.subtitle1!.color,
            size: 16,
          ),
        ],
      ),
      children: [
        Wrap(
          spacing: 14,
          runSpacing: 14,
          direction: Axis.horizontal,
          children: [
            SkillWidget(
              title: 'PhotoShop',
              imagePath: 'assets/images/app_icon_01.png',
              shadowColor: Colors.blue,
              isActive: _skills.contains(SkillType.photoShop),
              skillType: SkillType.photoShop,
              onTap: () {
                updateSelectedListSkill(SkillType.photoShop);
              },
            ),
            SkillWidget(
              title: 'Adobe XD',
              imagePath: 'assets/images/app_icon_05.png',
              shadowColor: Colors.pink,
              isActive: _skills.contains(SkillType.xd),
              skillType: SkillType.xd,
              onTap: () {
                updateSelectedListSkill(SkillType.xd);
              },
            ),
            SkillWidget(
              title: 'Illustrator',
              imagePath: 'assets/images/app_icon_04.png',
              shadowColor: Colors.orange,
              isActive: _skills.contains(SkillType.illustrator),
              skillType: SkillType.illustrator,
              onTap: () {
                updateSelectedListSkill(SkillType.illustrator);
              },
            ),
            SkillWidget(
              title: 'After Effect',
              imagePath: 'assets/images/app_icon_03.png',
              shadowColor: Colors.blue.shade800,
              isActive: _skills.contains(SkillType.afterEffect),
              skillType: SkillType.afterEffect,
              onTap: () {
                updateSelectedListSkill(SkillType.afterEffect);
              },
            ),
            SkillWidget(
              title: 'Lightroom',
              imagePath: 'assets/images/app_icon_02.png',
              shadowColor: Colors.blue,
              isActive: _skills.contains(SkillType.lightRoom),
              skillType: SkillType.lightRoom,
              onTap: () {
                updateSelectedListSkill(SkillType.lightRoom);
              },
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: Column(
        children: [
          _buildInfoWidget(themeData),
          _buildSkillsWidget(themeData),
        ],
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final SkillType skillType;
  final Function() onTap;
  static const double radius = 12;

  const SkillWidget({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.skillType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Container(
        height: 110,
        width: 110,
        decoration: isActive
            ? BoxDecoration(
                color: themeData.dividerColor,
                borderRadius: BorderRadius.circular(radius),
              )
            : null,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: isActive
                ? BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: shadowColor.withOpacity(0.5), blurRadius: 20)
                  ])
                : null,
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(title)
        ]),
      ),
    );
  }
}

enum SkillType { photoShop, xd, illustrator, afterEffect, lightRoom }
