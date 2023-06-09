import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(Language language) selectedLanguageChanged;
  const HomeScreen(
      {super.key,
      required this.toggleThemeMode,
      required this.selectedLanguageChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<SkillType> _skills = [];
  Language _language = Language.en;
  static const double bodyMargin = 26.0;

  void _updateSelectedListSkill(SkillType type) {
    _skills.contains(type) ? _skills.remove(type) : _skills.add(type);
    setState(() {});
  }

  void _updatedSelectedLanguage(Language language) {
    widget.selectedLanguageChanged(language);
    setState(() {
      _language = language;
    });
  }

  AppBar _buildAppBarWidget() {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.profileTitle),
      actions: [
        IconButton(
            onPressed: widget.toggleThemeMode,
            icon: const Icon(Icons.light_mode)),
        const Icon(Icons.more_vert),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }

  Widget _buildInfoWidget(
      ThemeData themeData, AppLocalizations appLocalizations) {
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
                      appLocalizations.name,
                      style: themeData.textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(appLocalizations.job),
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
                          appLocalizations.location,
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
            appLocalizations.summary,
            style: themeData.textTheme.bodyText1,
          )
        ],
      ),
    );
  }

  Widget _buildSkillsWidget(
      ThemeData themeData, AppLocalizations appLocalizations) {
    return ExpansionTile(
      trailing: const SizedBox(),
      tilePadding: const EdgeInsets.only(left: bodyMargin, right: bodyMargin),
      childrenPadding: const EdgeInsets.only(
          bottom: 30, left: bodyMargin, right: bodyMargin),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appLocalizations.skills,
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
                _updateSelectedListSkill(SkillType.photoShop);
              },
            ),
            SkillWidget(
              title: 'Adobe XD',
              imagePath: 'assets/images/app_icon_05.png',
              shadowColor: Colors.pink,
              isActive: _skills.contains(SkillType.xd),
              skillType: SkillType.xd,
              onTap: () {
                _updateSelectedListSkill(SkillType.xd);
              },
            ),
            SkillWidget(
              title: 'Illustrator',
              imagePath: 'assets/images/app_icon_04.png',
              shadowColor: Colors.orange,
              isActive: _skills.contains(SkillType.illustrator),
              skillType: SkillType.illustrator,
              onTap: () {
                _updateSelectedListSkill(SkillType.illustrator);
              },
            ),
            SkillWidget(
              title: 'After Effect',
              imagePath: 'assets/images/app_icon_03.png',
              shadowColor: Colors.blue.shade800,
              isActive: _skills.contains(SkillType.afterEffect),
              skillType: SkillType.afterEffect,
              onTap: () {
                _updateSelectedListSkill(SkillType.afterEffect);
              },
            ),
            SkillWidget(
              title: 'Lightroom',
              imagePath: 'assets/images/app_icon_02.png',
              shadowColor: Colors.blue,
              isActive: _skills.contains(SkillType.lightRoom),
              skillType: SkillType.lightRoom,
              onTap: () {
                _updateSelectedListSkill(SkillType.lightRoom);
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _buildLoginWidget(
      ThemeData themeData, AppLocalizations appLocalizations) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(bodyMargin, 20, bodyMargin, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalizations.personalInformation,
            style: themeData.textTheme.bodyText2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          _buildTextField(
              label: appLocalizations.email, icon: Icons.alternate_email),
          const SizedBox(
            height: 8,
          ),
          _buildTextField(label: appLocalizations.password, icon: Icons.lock),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(55))),
              onPressed: () {},
              child: Text(appLocalizations.save))
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
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildInfoWidget(themeData, appLocalizations),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(bodyMargin, 12, bodyMargin, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appLocalizations.selectedLanguage),
                  CupertinoSegmentedControl<Language>(
                      selectedColor: themeData.primaryColor,
                      borderColor: Colors.transparent,
                      children: {
                        Language.en: Text(appLocalizations.enLanguage),
                        Language.fa: Text(appLocalizations.faLanguage)
                      },
                      groupValue: _language,
                      onValueChanged: (value) {
                        _updatedSelectedLanguage(value);
                      })
                ],
              ),
            ),
            _buildSkillsWidget(themeData, appLocalizations),
            _buildLoginWidget(themeData, appLocalizations)
          ],
        ),
      ),
    );
  }
}

enum SkillType { photoShop, xd, illustrator, afterEffect, lightRoom }

enum Language { en, fa }
