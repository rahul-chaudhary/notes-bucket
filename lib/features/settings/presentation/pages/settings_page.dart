import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.scaffoldBackground),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            NotesAppBar(title: 'Settings', isBackButtonVisible: true),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: _profileCard(theme),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                elevation: 12,
                backgroundColor: Colors.transparent,
                expandedHeight: 243,
                toolbarHeight: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: AppContainer(
                    outerPadding: const EdgeInsets.all(0),
                    innerPadding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        SettingMenuOption(
                          leadingIcon: Icons.help_rounded,
                          title: 'Terms & Conditions',
                          onTap: () {},
                        ),
                        SettingMenuOption(
                          leadingIcon: Icons.privacy_tip_rounded,
                          title: 'Privacy Policy',
                          onTap: () {},
                        ),
                        SettingMenuOption(
                          leadingIcon: Icons.monetization_on_rounded,
                          title: 'Restore Purchase',
                          onTap: () {},
                        ),
                        SettingMenuOption(
                          leadingIcon: Icons.feedback_rounded,
                          title: 'Feedback/Request a feature',
                          onTap: () {},
                        ),
                        SettingMenuOption(
                          leadingIcon: Icons.logout_rounded,
                          leadingIconColor: theme.colorScheme.error,
                          title: 'Sign out',
                          titleColor: theme.colorScheme.error,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _profileCard(ThemeData theme) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      floating: true,
      elevation: 12,
      backgroundColor: theme.colorScheme.secondary,
      expandedHeight: 100,
      toolbarHeight: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class SettingMenuOption extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;
  final Color? leadingIconColor;
  final Color? titleColor;

  const SettingMenuOption({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    this.leadingIconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          leading: Icon(
            leadingIcon,
            color: leadingIconColor ?? theme.colorScheme.onSurface,
            size: 20,
          ),
          title: Text(title, style: theme.textTheme.bodyLarge?.copyWith(color: titleColor)),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: theme.colorScheme.onSurface,
            size: 16,
          ),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
