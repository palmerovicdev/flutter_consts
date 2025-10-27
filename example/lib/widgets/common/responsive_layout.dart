import 'package:consts/flutter_const.dart';
import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motionly/widget/button/ripple_reveal_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/responsive.dart';

/// Layout responsive que adapta su estructura según el dispositivo
class ResponsiveLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget child;

  const ResponsiveLayout({super.key, this.mobile, this.tablet, this.desktop, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppUI.maxMobileWidth) {
          return mobile ?? child;
        } else if (constraints.maxWidth < AppUI.maxTabletWidth) {
          return tablet ?? mobile ?? child;
        } else {
          return desktop ?? tablet ?? mobile ?? child;
        }
      },
    );
  }
}

/// Layout con navegación adaptativa (bottom bar en mobile, rail en desktop)
class AdaptiveNavigationLayout extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavigationDestination> destinations;
  final Widget child;

  const AdaptiveNavigationLayout({super.key, required this.selectedIndex, required this.onDestinationSelected, required this.destinations, required this.child});

  /// Construye el PopupMenuButton para navegación en mobile
  static Widget buildMobileNavMenu(
    BuildContext context, {
    required int selectedIndex,
    required ValueChanged<int> onDestinationSelected,
    required List<NavigationDestination> destinations,
  }) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: border, width: 1),
        borderRadius: AppRadius.borderMd,
      ),
      borderRadius: AppRadius.borderMd,
      iconColor: textMuted,
      itemBuilder: (context) => destinations
          .asMap()
          .entries
          .map(
            (entry) => PopupMenuItem<int>(
              textStyle: TextStyle(
                color: textMuted,
                fontWeight: FontWeight.w500,
                fontSize: context.getResponsiveFontSize(smallest: AppFontSizesConstants.bodySmall, largest: AppFontSizesConstants.body),
              ),
              mouseCursor: SystemMouseCursors.click,
              value: entry.key,
              child: Row(
                children: [
                  Icon((entry.value.icon as Icon).icon, color: textMuted, size: AppUI.iconMd),
                  SizedBox(width: AppSpacing.md),
                  Text(
                    entry.value.label,
                    style: TextStyle(
                      color: textMuted,
                      fontWeight: FontWeight.w500,
                      fontSize: context.getResponsiveFontSize(smallest: AppFontSizesConstants.bodySmall, largest: AppFontSizesConstants.body),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      color: bg,
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon((destinations[selectedIndex].selectedIcon as Icon?)?.icon ?? (destinations[selectedIndex].icon as Icon).icon, color: text),
          SizedBox(width: AppSpacing.sm),
          Text(
            destinations[selectedIndex].label,
            style: TextStyle(
              color: text,
              fontSize: context.getResponsiveFontSize(smallest: AppFontSizesConstants.body, largest: AppFontSizesConstants.bodyLarge),
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.arrow_drop_down, color: text),
        ],
      ),
      onSelected: (int? value) {
        if (value != null) {
          onDestinationSelected(value);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      // Desktop: Columna de RippleRevealButtons lateral
      return Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.22 > 250 ? 250 : MediaQuery.of(context).size.width * 0.22,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(right: BorderSide(color: Theme.of(context).dividerColor, width: 1)),
            ),
            child: Column(
              children: [
                AppSpacing.gapHuge,
                ...destinations.asMap().entries.map((entry) {
                  final index = entry.key;
                  final dest = entry.value;
                  final isSelected = index == selectedIndex;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
                    child: RippleRevealButton(
                      onPressed: () => onDestinationSelected(index),
                      width: double.infinity,
                      height: 42,
                      isSelected: isSelected,
                      selectedBackgroundColor: bg,
                      unselectedBackgroundColor: text,
                      selectedRippleColor: text,
                      unselectedRippleColor: bg,
                      borderRadius: AppRadius.sm,
                      selectedChild: Row(
                        children: [
                          SizedBox(width: AppSpacing.md),
                          Icon(dest.selectedIcon != null ? (dest.selectedIcon as Icon).icon : (dest.icon as Icon).icon, color: bg),
                          SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Text(
                              dest.label,
                              style: TextStyle(
                                color: bg,
                                fontWeight: FontWeight.w500,
                                fontSize: context.getResponsiveFontSize(
                                  smallest: AppFontSizesDevicePresets.mobileCompact.bodySmall,
                                  largest: AppFontSizesDevicePresets.mobile.bodySmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      unselectedChild: Row(
                        children: [
                          SizedBox(width: AppSpacing.md),
                          Icon((dest.icon as Icon).icon, color: textMuted),
                          SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Text(
                              dest.label,
                              style: TextStyle(
                                color: textMuted,
                                fontWeight: FontWeight.w400,
                                fontSize: context.getResponsiveFontSize(
                                  smallest: AppFontSizesDevicePresets.mobileCompact.bodySmall,
                                  largest: AppFontSizesDevicePresets.mobile.bodySmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      );
    }

    // Mobile: Sin bottomNavigationBar, solo el child con footer
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: bg,
              border: Border(top: BorderSide(color: border.withValues(alpha: 0.3), width: 1)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consts',
                        style: TextStyle(
                          color: text,
                          fontWeight: FontWeight.w600,
                          fontSize: context.getResponsiveFontSize(smallest: AppFontSizesConstants.bodySmall, largest: AppFontSizesConstants.body),
                        ),
                      ),
                      SizedBox(height: AppSizes.xxs),
                      Text(
                        '© ${DateTime.now().year} Palmerodev. ${!Responsive.isDesktop(context) ? '' : 'Todos los derechos reservados.'}',
                        style: TextStyle(
                          color: textMuted,
                          fontWeight: FontWeight.w400,
                          fontSize: context.getResponsiveFontSize(smallest: 12, largest: AppFontSizesConstants.bodySmall),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      final uri = Uri.parse('https://linkedin.com/in/palmerodev');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                      foregroundColor: textMuted,
                      overlayColor: textMuted.withOpacity(0.1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/linkedin_svg.svg', color: textMuted, width: 20, height: 20),
                          const SizedBox(width: 8),
                          Text(
                            'in/palmerodev',
                            style: TextStyle(color: textMuted, fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Grid responsive que adapta el número de columnas
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double spacing;
  final double runSpacing;

  const ResponsiveGrid({super.key, required this.children, this.mobileColumns = 1, this.tabletColumns = 2, this.desktopColumns = 3, this.spacing = 16.0, this.runSpacing = 16.0});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.getColumns(context, mobile: mobileColumns, tablet: tabletColumns, desktop: desktopColumns);

    return GridView.builder(
      padding: Responsive.getPadding(context),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns, crossAxisSpacing: spacing, mainAxisSpacing: runSpacing, childAspectRatio: 1.5),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// Contenedor con ancho máximo para desktop
class MaxWidthContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsets? padding;

  const MaxWidthContainer({super.key, required this.child, this.maxWidth, this.padding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? AppUI.maxContentWidth),
        padding: padding ?? Responsive.getPadding(context),
        child: child,
      ),
    );
  }
}
