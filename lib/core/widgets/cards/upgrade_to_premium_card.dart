import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';
import 'package:notes_bucket/features/user/presentation/providers/user_provider.dart';

class UpgradeToPremiumCard extends HookConsumerWidget {
  const UpgradeToPremiumCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isBtnLoading = useState(false);
    return AppContainer(
      outerPadding: const EdgeInsets.all(0),
      innerPadding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                color: theme.colorScheme.primary,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upgrade to Premium',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Unlock powerful features',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withAlpha(150),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showPremiumBottomSheet(
                context,
                theme,
                isBtnLoading,
                ref,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'View Benefits',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPremiumBottomSheet(
    BuildContext context,
    ThemeData theme,
    ValueNotifier<bool> isBtnLoading,
    WidgetRef ref,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.workspace_premium_rounded,
                  color: theme.colorScheme.primary,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  'Premium Benefits',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _benefitItem(
              theme,
              Icons.cloud_sync_rounded,
              'Sync Notes to Cloud',
              'Access your notes anywhere, anytime',
            ),
            const SizedBox(height: 16),
            _benefitItem(
              theme,
              Icons.backup_rounded,
              'Never Lose Your Notes',
              'Automatic backup keeps your data safe',
            ),
            const SizedBox(height: 16),
            _benefitItem(
              theme,
              Icons.devices_rounded,
              'Multi-Device Access',
              'Seamlessly work across all your devices',
            ),
            const SizedBox(height: 16),
            _benefitItem(
              theme,
              Icons.lock_rounded,
              'Enhanced Security',
              'Advanced encryption for your notes',
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: isBtnLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () =>
                          onPressUpgrade(isBtnLoading, context, ref),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.secondary,
                        foregroundColor: theme.colorScheme.onSecondary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Upgrade Now',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> onPressUpgrade(
    ValueNotifier<bool> isBtnLoading,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      isBtnLoading.value = true;
      final userNotifier = ref.read(userProvider.notifier);
      final user = await ref.read(userProvider.future);
      if (user != null) {
        await userNotifier.activateUserSubscription();
        if (context.mounted) Navigator.pop(context);
      } else {
        if (context.mounted) {
          Navigator.pushNamed(context, AppRoutes.welcome);
        }
      }
    } catch (e) {
      if(context.mounted) {
        AppSnackBar.showError(context, e.toString());
      }
      throw Exception(e);
    } finally {
      isBtnLoading.value = false;
    }
  }

  Widget _benefitItem(
    ThemeData theme,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(150),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
