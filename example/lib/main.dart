import 'package:example/core/utils/responsive.dart';
import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'theme/app_theme.dart';
import 'widgets/common/responsive_layout.dart';
import 'screens/overview_screen.dart';
import 'screens/spacing_screen.dart';
import 'screens/radius_screen.dart';
import 'screens/sizes_screen.dart';
import 'screens/fonts_screen.dart';
import 'screens/animations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consts - Modern Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<_NavItem> _navItems = const [
    _NavItem(
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard,
      label: 'Overview',
    ),
    _NavItem(
      icon: Icons.space_bar_outlined,
      selectedIcon: Icons.space_bar,
      label: 'Spacing',
    ),
    _NavItem(
      icon: Icons.rounded_corner_outlined,
      selectedIcon: Icons.rounded_corner,
      label: 'Radius',
    ),
    _NavItem(
      icon: Icons.photo_size_select_small_outlined,
      selectedIcon: Icons.photo_size_select_small,
      label: 'Sizes',
    ),
    _NavItem(
      icon: Icons.text_fields_outlined,
      selectedIcon: Icons.text_fields,
      label: 'Fonts',
    ),
    _NavItem(
      icon: Icons.animation_outlined,
      selectedIcon: Icons.animation,
      label: 'Animations',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = !Responsive.isDesktop(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgDark,
        surfaceTintColor: bgDark,
        toolbarHeight: context.getResponsiveFontSize(
          smallest: 50,
          largest: 72,
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: AppSpacing.paddingXs,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: AppRadius.borderSm,
              ),
              child: Icon(
                Icons.widgets,
                size: context.getResponsiveFontSize(
                  smallest: AppFontSizesConstants.bodyLarge,
                  largest: AppFontSizesConstants.paragraphTitle,
                ),
                color: bg,
              ),
            ),
            AppSpacing.gapHorizontalMd,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Consts',
                  style: TextStyle(
                    color: text,
                    fontSize: context.getResponsiveFontSize(
                      smallest: AppFontSizesConstants.body,
                      largest: AppFontSizesConstants.bodyLarge,
                    ),
                  ),
                ),
                Text(
                  'Design System Demo',
                  style: TextStyle(
                    color: textMuted,
                    fontWeight: FontWeight.w400,
                    fontSize: context.getResponsiveFontSize(
                      smallest: AppFontSizesConstants.bodySmall,
                      largest: AppFontSizesConstants.body,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: isMobile ? [
          Padding(
            padding: EdgeInsets.only(right: AppSpacing.md),
            child: AdaptiveNavigationLayout.buildMobileNavMenu(
              context,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              destinations: _navItems
                  .map(
                    (item) => NavigationDestination(
                      icon: Icon(item.icon),
                      selectedIcon: Icon(item.selectedIcon),
                      label: item.label,
                    ),
                  )
                  .toList(),
            ),
          ),
        ] : [
          Padding(
            padding: AppSpacing.horizontalXl,
            child: TextButton(
              onPressed: () async {
                final uri = Uri.parse('https://linkedin.com/in/palmerodev');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(100, 50),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
                foregroundColor: textMuted,
                overlayColor: textMuted.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/linkedin_svg.svg',
                      color: textMuted,
                      width: context.getResponsiveFontSize(
                        smallest: AppFontSizesConstants.body,
                        largest: AppFontSizesConstants.bodyLarge,
                      ),
                      height: context.getResponsiveFontSize(
                        smallest: AppFontSizesConstants.body,
                        largest: AppFontSizesConstants.bodyLarge,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'in/palmerodev',
                      style: TextStyle(
                        color: textMuted,
                        fontWeight: FontWeight.w400,
                        fontSize: context.getResponsiveFontSize(
                          smallest: AppFontSizesConstants.bodySmall,
                          largest: AppFontSizesConstants.body,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        elevation: AppUI.elevationSm,
      ),
      body: AdaptiveNavigationLayout(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: _navItems
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.selectedIcon),
                label: item.label,
              ),
            )
            .toList(),
        child: AnimatedSwitcher(
          duration: AppDurations.pageTransition,
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: MaxWidthContainer(
            key: ValueKey(_selectedIndex),
            child: _buildPage(_selectedIndex),
          ),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const OverviewPage();
      case 1:
        return const SpacingScreen();
      case 2:
        return const RadiusScreen();
      case 3:
        return const SizesScreen();
      case 4:
        return const FontsScreen();
      case 5:
        return const AnimationsScreen();
      default:
        return const OverviewPage();
    }
  }
}

/// Modelo de item de navegación
class _NavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}
