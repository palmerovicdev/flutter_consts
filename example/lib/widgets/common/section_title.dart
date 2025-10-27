import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

/// Título de sección con línea decorativa opcional
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool showDivider;
  final Widget? trailing;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.showDivider = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: AppUI.iconXl,
                color: Theme.of(context).colorScheme.primary,
              ),
              AppSpacing.gapHorizontalMd,
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  if (subtitle != null) ...[
                    AppSpacing.gapXxs,
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        if (showDivider) ...[AppSpacing.gapMd, const Divider()],
      ],
    );
  }
}

/// Subtítulo de subsección
class SubsectionTitle extends StatelessWidget {
  final String title;
  final String? description;

  const SubsectionTitle({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        if (description != null) ...[
          AppSpacing.gapXxs,
          Text(description!, style: Theme.of(context).textTheme.bodySmall),
        ],
      ],
    );
  }
}
