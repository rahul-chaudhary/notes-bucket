import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';
import 'package:notes_bucket/core/widgets/cards/upgrade_to_premium_card.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final secureDataProvider = ref.watch(secureStorageControllerProvider);
    final user = useState<User?>(null);
    secureDataProvider.whenData(
      (value) => user.value = value?.authResponseModel?.user,
    );
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
              sliver: _profileCard(theme, user.value?.email ?? ''),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: _premiumCard(theme),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                elevation: 12,
                backgroundColor: Colors.transparent,
                expandedHeight: 245,
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
                          leadingIcon: user.value != null
                              ? Icons.logout_rounded
                              : Icons.login_rounded,
                          leadingIconColor: user.value != null
                              ? theme.colorScheme.error
                              : theme.colorScheme.secondary,
                          title: user.value != null ? 'Sign out' : 'Sign in',
                          titleColor: user.value != null
                              ? theme.colorScheme.error
                              : theme.colorScheme.secondary,
                          onTap: () async {
                            await ref
                                .read(secureStorageControllerProvider.notifier)
                                .clear();
                            ref.invalidate(secureStorageControllerProvider);
                            Navigator.pushNamed(context, AppRoutes.welcome);
                          },
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

  SliverAppBar _profileCard(ThemeData theme, String email) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      floating: true,
      elevation: 12,
      backgroundColor: Colors.transparent,
      expandedHeight: 100,
      toolbarHeight: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: AppContainer(
          outerPadding: const EdgeInsets.all(0),
          innerPadding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              SizedBox(
                width: 100,
                height: 100,
                child: AppContainer(
                  borderRadius: 100,
                  outerPadding: const EdgeInsets.all(0),
                  innerPadding: const EdgeInsets.all(0),
                  child: Icon(Icons.person_2_rounded),
                ),
              ),
              const SizedBox(width: 16),
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello! 👋',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (email.isNotEmpty)
                      Text(
                        email,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(20),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lightbulb_outline_rounded,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: SelectableText(
                              '"Every note is a step forward" \n- Alan Turning',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _premiumCard(ThemeData theme) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      floating: true,
      elevation: 12,
      backgroundColor: Colors.transparent,
      expandedHeight: 140,
      toolbarHeight: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      flexibleSpace: FlexibleSpaceBar(background: UpgradeToPremiumCard()),
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
          title: Text(
            title,
            style: theme.textTheme.bodyLarge?.copyWith(color: titleColor),
          ),
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
