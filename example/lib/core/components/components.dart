
import 'package:consts/flutter_const.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

Widget buildCodeBlock(String code, bool isNarrow) {
  return Builder(
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: isNarrow ? AppSpacing.paddingLg : AppSpacing.paddingXl,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: AppRadius.borderMd,
          border: Border.all(
            color: border.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SelectableText(
            code,
            style: TextStyle(
              color: text,
              fontSize: context.getResponsiveFontSize(
                smallest: AppFontSizesConstants.bodySmall,
                largest: AppFontSizesConstants.body,
              ),
              fontFamily: 'monospace',
              height: 1.6,
            ),
          ),
        ),
      );
    },
  );
}

Widget buildFeatureGrid(bool isNarrow, List features) {
  return Builder(
    builder: (context) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isNarrow ? 1 : 2,
          crossAxisSpacing: AppSizes.lg,
          mainAxisSpacing: AppSizes.lg,
          mainAxisExtent: isNarrow ? 180 : 240,
          childAspectRatio: isNarrow ? 3 : 2.5,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return Container(
            padding: AppSpacing.paddingXl,
            decoration: BoxDecoration(
              color: bgLight.withValues(alpha: 0.7),
              borderRadius: AppRadius.borderMd,
              border: Border.all(
                color: border.withValues(alpha: 0.7),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  feature['icon'] as IconData,
                  color: primary,
                  size: AppUI.iconHuge,
                ),
                AppSpacing.gapMd,
                Text(
                  feature['title'] as String,
                  style: TextStyle(
                    color: text,
                    fontSize: context.getResponsiveFontSize(
                      smallest: AppFontSizesConstants.body,
                      largest: AppFontSizesConstants.bodyLarge,
                    ),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AppSpacing.gapSm,
                Text(
                  feature['description'] as String,
                  style: TextStyle(
                    color: textMuted,
                    fontSize: context.getResponsiveFontSize(
                      smallest: AppFontSizesConstants.bodySmall,
                      largest: AppFontSizesConstants.body,
                    ),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget buildSectionTitle(String title, bool isNarrow) {
  return Builder(
    builder: (context) {
      return Text(
        title,
        style: TextStyle(
          color: text,
          fontSize: context.getResponsiveFontSize(
            smallest: AppFontSizesConstants.paragraphTitle,
            largest: AppFontSizesConstants.h3,
          ),
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      );
    },
  );
}

Widget buildPracticeCard(String title, List<String> items, Color color, bool isNarrow) {
  return Builder(
    builder: (context) {
      return Container(
        padding: isNarrow ? AppSpacing.paddingLg : AppSpacing.paddingXxl,
        decoration: BoxDecoration(
          color: bgLight.withValues(alpha: 0.5),
          borderRadius: AppRadius.borderMd,
          border: Border.all(
            color: color.withValues(alpha: 0.7),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: context.getResponsiveFontSize(
                  smallest: AppFontSizesConstants.bodyLarge,
                  largest: AppFontSizesConstants.paragraphTitle,
                ),
                fontWeight: FontWeight.w700,
              ),
            ),
            AppSpacing.gapLg,
            ...items.map(
              (item) => Padding(
                padding: EdgeInsets.only(bottom: AppSizes.md),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: AppSizes.xs,
                      height: AppSizes.xs,
                      margin: EdgeInsets.only(top: 7, right: AppSizes.md),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          color: textMuted,
                          fontSize: context.getResponsiveFontSize(
                            smallest: AppFontSizesConstants.bodySmall,
                            largest: AppFontSizesConstants.body,
                          ),
                          height: 1.5,
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
    },
  );
}

Widget buildExampleCard(
  String title,
  String description,
  bool isNarrow,
  Widget demo,
  String? code,
) {
  return Builder(
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: isNarrow ? AppSpacing.paddingXl : AppSpacing.paddingXxl,
        decoration: BoxDecoration(
          color: bgLight.withValues(alpha: 0.5),
          borderRadius: AppRadius.borderLg,
          border: Border.all(
            color: border.withValues(alpha: 0.7),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: text,
                fontSize: context.getResponsiveFontSize(
                  smallest: AppFontSizesConstants.paragraphTitle,
                  largest: AppFontSizesConstants.subheader,
                ),
                fontWeight: FontWeight.w700,
              ),
            ),
            AppSpacing.gapSm,
            Text(
              description,
              style: TextStyle(
                color: textMuted,
                fontSize: context.getResponsiveFontSize(
                  smallest: AppFontSizesConstants.bodySmall,
                  largest: AppFontSizesConstants.body,
                ),
                height: 1.5,
              ),
            ),
            isNarrow ? AppSpacing.gapXl : AppSpacing.gapXxl,
            demo,
            if (code != null) ...[
              isNarrow ? AppSpacing.gapXl : AppSpacing.gapXxl,
              buildCodeBlock(code, isNarrow),
            ],
          ],
        ),
      );
    },
  );
}

Widget buildPropertiesTable(bool isNarrow, List properties) {
  return Builder(
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: bgLight.withValues(alpha: 0.5),
          borderRadius: AppRadius.borderMd,
          border: Border.all(
            color: border.withValues(alpha: 0.7),
            width: 1,
          ),
        ),
        child: Column(
          children: properties.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final prop = entry.value;
              final isLast = index == properties.length - 1;

              return Container(
                padding: isNarrow ? AppSpacing.paddingLg : AppSpacing.paddingLg,
                decoration: BoxDecoration(
                  border: isLast
                      ? null
                      : Border(
                    bottom: BorderSide(
                      color: border.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: isNarrow
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          prop['name']!,
                          style: TextStyle(
                            color: primary,
                            fontSize: context.getResponsiveFontSize(
                              smallest: AppFontSizesConstants.bodySmall,
                              largest: AppFontSizesConstants.body,
                            ),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'monospace',
                          ),
                        ),
                        AppSpacing.gapHorizontalSm,
                        Text(
                          prop['type']!,
                          style: TextStyle(
                            color: textMuted,
                            fontSize: context.getResponsiveFontSize(
                              smallest: 12,
                              largest: AppFontSizesConstants.bodySmall,
                            ),
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.gapSm,
                    Text(
                      prop['description']!,
                      style: TextStyle(
                        color: text,
                        fontSize: context.getResponsiveFontSize(
                          smallest: AppFontSizesConstants.bodySmall,
                          largest: AppFontSizesConstants.body,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.xxs),
                    Text(
                      'Por defecto: ${prop['default']}',
                      style: TextStyle(
                        color: textMuted,
                        fontSize: context.getResponsiveFontSize(
                          smallest: 12,
                          largest: AppFontSizesConstants.bodySmall,
                        ),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        prop['name']!,
                        style: TextStyle(
                          color: primary,
                          fontSize: context.getResponsiveFontSize(
                            smallest: AppFontSizesConstants.bodySmall,
                            largest: AppFontSizesConstants.body,
                          ),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        prop['type']!,
                        style: TextStyle(
                          color: textMuted,
                          fontSize: context.getResponsiveFontSize(
                            smallest: AppFontSizesConstants.bodySmall,
                            largest: AppFontSizesConstants.body,
                          ),
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        prop['default']!,
                        style: TextStyle(
                          color: textMuted,
                          fontSize: context.getResponsiveFontSize(
                            smallest: AppFontSizesConstants.bodySmall,
                            largest: AppFontSizesConstants.body,
                          ),
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        prop['description']!,
                        style: TextStyle(
                          color: text,
                          fontSize: context.getResponsiveFontSize(
                            smallest: AppFontSizesConstants.bodySmall,
                            largest: AppFontSizesConstants.body,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      );
    },
  );
}
