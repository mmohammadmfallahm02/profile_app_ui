import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final Function() toggleThemeMode;
  const HomeScreen({super.key, required this.toggleThemeMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<SkillType> _skills = [];
  static const double bodyMargin = 26.0;

  void updateSelectedListSkill(SkillType type) {
    _skills.contains(type) ? _skills.remove(type) : _skills.add(type);
    setState(() {});
  }

  AppBar _buildAppBarWidget() {
    return AppBar(
      title: const Text('Curriculum Vitae'),
      actions: [
        IconButton(onPressed: widget.toggleThemeMode, icon: const Icon(Icons.light_mode)),
        const Icon(Icons.more_vert),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }

  Widget _buildInfoWidget(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(bodyMargin, 40, bodyMargin, 30),
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
      tilePadding: const EdgeInsets.only(left: bodyMargin, right: bodyMargin),
      childrenPadding: const EdgeInsets.only(
          bottom: 30, left: bodyMargin, right: bodyMargin),
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

  Widget _buildLoginWidget(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(bodyMargin, 20, bodyMargin, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal information',
            style: themeData.textTheme.bodyText2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          _buildTextField(label: 'Email', icon: Icons.alternate_email),
          const SizedBox(
            height: 8,
          ),
          _buildTextField(label: 'Password', icon: Icons.lock),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(55))),
              onPressed: () {},
              child: const Text('Save'))
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildInfoWidget(themeData),
            _buildSkillsWidget(themeData),
            _buildLoginWidget(themeData)
          ],
        ),
      ),
    );
  }
}

enum SkillType { photoShop, xd, illustrator, afterEffect, lightRoom }
