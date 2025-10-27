import 'package:flutter/cupertino.dart';

/// Extension method on [BuildContext] to calculate responsive font sizes.
///
/// This extension provides a convenient way to calculate font sizes that scale
/// proportionally based on screen width, ensuring better readability across
/// different device sizes.
///
/// ### Example:
/// ```dart
/// Text(
///   'Hello World',
///   style: TextStyle(
///     fontSize: context.getResponsiveFontSize(
///       smallest: 12,
///       largest: 24,
///     ),
///   ),
/// )
/// ```
///
/// ### Recommendations:
/// - Use for body text that needs to adapt across mobile, tablet, and desktop
/// - For fixed UI elements (like icons), consider using [AppFontSizesConstants]
/// - Combine with [AppFontSizesPresets] for consistent sizing across your app
extension AppFontSizesExtension on BuildContext {
  /// Calculates a responsive font size based on screen width.
  ///
  /// The font size interpolates linearly between [smallest] and [largest]
  /// based on the current screen width relative to [smallestScreenSize]
  /// and [largestScreenSize].
  ///
  /// ### Parameters:
  /// - [smallest]: The minimum font size (default: 12)
  /// - [largest]: The maximum font size (default: 20)
  /// - [smallestScreenSize]: The screen width for minimum font size (default: 320)
  /// - [largestScreenSize]: The screen width for maximum font size (default: 1920)
  ///
  /// ### Returns:
  /// A [double] representing the calculated font size in logical pixels.
  ///
  /// ### Example:
  /// ```dart
  /// // Basic usage with defaults
  /// final fontSize = context.getResponsiveFontSize();
  ///
  /// // Custom range for headings
  /// final headingSize = context.getResponsiveFontSize(
  ///   smallest: 24,
  ///   largest: 48,
  /// );
  ///
  /// // Custom screen size range for tablets only
  /// final tabletSize = context.getResponsiveFontSize(
  ///   smallest: 14,
  ///   largest: 18,
  ///   smallestScreenSize: 600,
  ///   largestScreenSize: 1200,
  /// );
  /// ```
  double getResponsiveFontSize({
    double? smallest,
    double? largest,
    double smallestScreenSize = 320,
    double largestScreenSize = 1920,
  }) {
    smallest ??= AppFontSizes(bodySmall: 12).bodySmall;
    largest ??= AppFontSizes(bodySmall: 20).bodySmall;

    final screenWidth = MediaQuery.sizeOf(this).width;
    return smallest + (largest - smallest) * (screenWidth - smallestScreenSize) / (largestScreenSize - smallestScreenSize);
  }
}

/// A flexible font sizing system with hierarchical typography scales.
///
/// This class provides a complete typographic scale based on a customizable
/// base size ([bodySmall]) and a geometric scale factor. It follows a
/// consistent progression from small body text to large display headings.
///
/// ### Typography Hierarchy (from smallest to largest):
/// 1. **bodySmall** - Smallest readable text (captions, footnotes)
/// 2. **body** - Standard body text (paragraphs, lists)
/// 3. **bodyLarge** - Emphasized body text
/// 4. **paragraphTitle** - Small headings within paragraphs
/// 5. **subheader** - Section subheadings
/// 6. **header** - Main section headings
/// 7. **h3** - Third-level headings
/// 8. **h2** - Second-level headings
/// 9. **h1** - Top-level headings
/// 10. **display** - Hero text, large titles
///
/// ### Usage:
/// ```dart
/// // Create a custom font size scale
/// final customSizes = AppFontSizes(
///   bodySmall: 16,
///   scaleFactor: AppFontSizesScaleFactors.normal,
/// );
///
/// Text(
///   'Heading',
///   style: TextStyle(fontSize: customSizes.h1),
/// );
///
/// Text(
///   'Body text',
///   style: TextStyle(fontSize: customSizes.body),
/// );
/// ```
///
/// ### Recommendations:
/// - Use [AppFontSizesPresets] for common size configurations
/// - Use [AppFontSizesConstants] for compile-time constant values
/// - Choose a [scaleFactor] based on your design system:
///   - `small` (1.13): Compact, information-dense layouts
///   - `normal` (1.17): Balanced, general-purpose
///   - `large` (1.27): Clear hierarchy, better readability
///   - `extraLarge` (1.62): Golden ratio, maximum distinction
///
/// ### See also:
/// - [AppFontSizesPresets] for ready-to-use size configurations
/// - [AppFontSizesScaleFactors] for available scale factor options
/// - [AppFontSizesConstants] for compile-time constant font sizes
class AppFontSizes {
  /// Creates a font sizing system with the specified base size and scale factor.
  ///
  /// ### Parameters:
  /// - [bodySmall]: The base font size in logical pixels (default: 14)
  /// - [scaleFactor]: The multiplier between each level (default: 1.27)
  ///
  /// ### Example:
  /// ```dart
  /// // Default configuration
  /// final defaultSizes = AppFontSizes();
  ///
  /// // Larger base size for accessibility
  /// final accessibleSizes = AppFontSizes(bodySmall: 18);
  ///
  /// // Tighter scale for compact layouts
  /// final compactSizes = AppFontSizes(
  ///   bodySmall: 12,
  ///   scaleFactor: AppFontSizesScaleFactors.small,
  /// );
  /// ```
  AppFontSizes({
    double bodySmall = AppFontSizesConstants.bodySmall,
    double scaleFactor = AppFontSizesScaleFactors.large,
  })  : _scaleFactor = scaleFactor,
        _bodySmall = bodySmall;

  final double _bodySmall;
  final double _scaleFactor;

  /// The smallest text size in the hierarchy.
  ///
  /// **Size:** Base size (default: 14px)
  ///
  /// **Use cases:**
  /// - Captions and labels
  /// - Footnotes and disclaimers
  /// - Helper text and hints
  /// - Timestamps and metadata
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Updated 5 mins ago',
  ///   style: TextStyle(
  ///     fontSize: appFontSizes.bodySmall,
  ///     color: Colors.grey,
  ///   ),
  /// )
  /// ```
  double get bodySmall => _bodySmall;

  /// Standard body text size.
  ///
  /// **Size:** bodySmall × scaleFactor (default: 14 × 1.27 = ~17.8px)
  ///
  /// **Use cases:**
  /// - Main paragraph text
  /// - List items
  /// - Form inputs
  /// - Button labels
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'This is a paragraph of body text...',
  ///   style: TextStyle(fontSize: appFontSizes.body),
  /// )
  /// ```
  double get body => bodySmall * _scaleFactor;

  /// Emphasized or larger body text.
  ///
  /// **Size:** body × scaleFactor (default: 17.8 × 1.27 = ~22.6px)
  ///
  /// **Use cases:**
  /// - Lead paragraphs
  /// - Callouts and quotes
  /// - Emphasized information
  /// - Large button text
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Important message here',
  ///   style: TextStyle(
  ///     fontSize: appFontSizes.bodyLarge,
  ///     fontWeight: FontWeight.w500,
  ///   ),
  /// )
  /// ```
  double get bodyLarge => body * _scaleFactor;

  /// Small headings within content blocks.
  ///
  /// **Size:** bodyLarge × scaleFactor (default: 22.6 × 1.27 = ~28.7px)
  ///
  /// **Use cases:**
  /// - Paragraph titles
  /// - Card titles
  /// - List section headers
  /// - Small component headings
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Section Title',
  ///   style: TextStyle(
  ///     fontSize: appFontSizes.paragraphTitle,
  ///     fontWeight: FontWeight.bold,
  ///   ),
  /// )
  /// ```
  double get paragraphTitle => bodyLarge * _scaleFactor;

  /// Subheadings for content sections.
  ///
  /// **Size:** paragraphTitle × scaleFactor (default: 28.7 × 1.27 = ~36.5px)
  ///
  /// **Use cases:**
  /// - Subsection headings
  /// - Dialog titles
  /// - Bottom sheet headers
  /// - Tab labels (when large)
  ///
  /// **Example:**
  /// ```dart
  /// AppBar(
  ///   title: Text(
  ///     'Settings',
  ///     style: TextStyle(fontSize: appFontSizes.subheader),
  ///   ),
  /// )
  /// ```
  double get subheader => paragraphTitle * _scaleFactor;

  /// Main section headings.
  ///
  /// **Size:** subheader × scaleFactor (default: 36.5 × 1.27 = ~46.4px)
  ///
  /// **Use cases:**
  /// - Page section headers
  /// - Main navigation items
  /// - Feature titles
  /// - App bar titles
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Main Section',
  ///   style: TextStyle(
  ///     fontSize: appFontSizes.header,
  ///     fontWeight: FontWeight.w600,
  ///   ),
  /// )
  /// ```
  double get header => subheader * _scaleFactor;

  /// Third-level heading (H3).
  ///
  /// **Size:** header × scaleFactor (default: 46.4 × 1.27 = ~59.0px)
  ///
  /// **Use cases:**
  /// - Large section titles
  /// - Feature headings
  /// - Modal titles
  /// - Card headers (large)
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Feature Heading',
  ///   style: TextStyle(fontSize: appFontSizes.h3),
  /// )
  /// ```
  double get h3 => header * _scaleFactor;

  /// Second-level heading (H2).
  ///
  /// **Size:** h3 × scaleFactor (default: 59.0 × 1.27 = ~75.0px)
  ///
  /// **Use cases:**
  /// - Page subtitles
  /// - Major section dividers
  /// - Welcome messages
  /// - Feature highlights
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Welcome Back!',
  ///   style: TextStyle(
  ///     fontSize: appFontSizes.h2,
  ///     fontWeight: FontWeight.bold,
  ///   ),
  /// )
  /// ```
  double get h2 => h3 * _scaleFactor;

  /// Top-level heading (H1).
  ///
  /// **Size:** h2 × scaleFactor (default: 75.0 × 1.27 = ~95.3px)
  ///
  /// **Use cases:**
  /// - Page titles
  /// - Screen headers
  /// - Main headings
  /// - Primary CTAs
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Dashboard',
  ///   style: TextStyle(
  ///     fontSize: appFontSizes.h1,
  ///     fontWeight: FontWeight.bold,
  ///   ),
  /// )
  /// ```
  double get h1 => h2 * _scaleFactor;

  /// Display text for hero sections and large titles.
  ///
  /// **Size:** h1 × scaleFactor (default: 95.3 × 1.27 = ~121.1px)
  ///
  /// **Use cases:**
  /// - Hero text
  /// - Splash screen titles
  /// - Onboarding headings
  /// - Marketing headers
  /// - Empty state messages
  ///
  /// **Example:**
  /// ```dart
  /// Text(
  ///   'Get Started',
  ///   style: TextStyle(
  ///     fontSize: appFontSizes.display,
  ///     fontWeight: FontWeight.bold,
  ///     letterSpacing: -0.5,
  ///   ),
  /// )
  /// ```
  ///
  /// **Note:** Display sizes may need to be reduced on smaller screens
  /// to prevent overflow. Consider using [AppFontSizesExtension.getResponsiveFontSize].
  double get display => h1 * _scaleFactor;
}


/// Compile-time constant font sizes using the default configuration.
///
/// This class provides `const` font size values that can be used in
/// compile-time constant expressions, unlike [AppFontSizes] which is
/// instantiated at runtime.
///
/// All values are calculated using:
/// - Base size: 14 pixels
/// - Scale factor: 1.27 (large)
///
/// ### When to use:
/// - **Use [AppFontSizesConstants]** when you need compile-time constants
///   (e.g., in const constructors, default parameter values)
/// - **Use [AppFontSizes]** when you need runtime flexibility
///   (e.g., dynamic sizing, user preferences)
///
/// ### Example:
/// ```dart
/// // ✅ Good: Compile-time constant
/// const TextStyle(
///   fontSize: AppFontSizesConstants.body,
/// );
///
/// // ✅ Good: Default parameter value
/// Widget buildText({
///   double fontSize = AppFontSizesConstants.body,
/// }) { ... }
///
/// // ❌ Won't work with AppFontSizes (not const)
/// const TextStyle(
///   fontSize: AppFontSizes().body, // Error!
/// );
/// ```
///
/// ### Recommendations:
/// - Prefer [AppFontSizesConstants] for theme definitions
/// - Use [AppFontSizes] for dynamic or user-configurable sizing
/// - Use [AppFontSizesPresets] for predefined size sets
///
/// ### See also:
/// - [AppFontSizes] for runtime-configurable font sizes
/// - [AppFontSizesPresets] for preset size configurations
class AppFontSizesConstants {
  /// Base font size: 14.0px - Captions, footnotes, metadata
  static const double bodySmall = 14;

  /// Standard body text: 17.8px (14 × 1.272) - Paragraphs, lists, buttons
  static const double body = bodySmall * AppFontSizesScaleFactors.large;

  /// Large body text: 22.6px (17.8 × 1.272) - Emphasized text, callouts
  static const double bodyLarge = body * AppFontSizesScaleFactors.large;

  /// Paragraph titles: 28.7px (22.6 × 1.272) - Card titles, list headers
  static const double paragraphTitle = bodyLarge * AppFontSizesScaleFactors.large;

  /// Subheadings: 36.5px (28.7 × 1.272) - Dialog titles, subsection headers
  static const double subheader = paragraphTitle * AppFontSizesScaleFactors.large;

  /// Main headings: 46.4px (36.5 × 1.272) - Section headers, app bar titles
  static const double header = subheader * AppFontSizesScaleFactors.large;

  /// H3 headings: 59.0px (46.4 × 1.272) - Large section titles, modal titles
  static const double h3 = header * AppFontSizesScaleFactors.large;

  /// H2 headings: 75.0px (59.0 × 1.272) - Page subtitles, major sections
  static const double h2 = h3 * AppFontSizesScaleFactors.large;

  /// H1 headings: 95.4px (75.0 × 1.272) - Page titles, main headings
  static const double h1 = h2 * AppFontSizesScaleFactors.large;

  /// Display text: 121.4px (95.4 × 1.272) - Hero text, splash screens
  static const double display = h1 * AppFontSizesScaleFactors.large;
}


/// Predefined scale factors for typographic hierarchies.
///
/// Scale factors determine the size ratio between consecutive levels in the
/// typography hierarchy. A larger scale factor creates more visual distinction
/// between heading levels.
///
/// ### Available Scales:
///
/// | Scale | Factor | Description | Best For |
/// |-------|--------|-------------|----------|
/// | **small** | 1.128 | Minor Second | Dense layouts, data tables |
/// | **normal** | 1.174 | Major Second | Balanced UIs, forms |
/// | **large** | 1.272 | Minor Third | Clear hierarchy, marketing |
/// | **extraLarge** | 1.618 | Golden Ratio | Maximum contrast, landing pages |
///
/// ### Visual Comparison:
/// ```
/// Scale Factor Impact (base = 14px):
///
/// small (1.128):
///   display: 28px
///   h1: 25px
///   h2: 22px
///   body: 14px
///
/// normal (1.174):
///   display: 33px
///   h1: 28px
///   h2: 24px
///   body: 14px
///
/// large (1.272):
///   display: 48px
///   h1: 38px
///   h2: 30px
///   body: 14px
///
/// extraLarge (1.618):
///   display: 97px
///   h1: 60px
///   h2: 37px
///   body: 14px
/// ```
///
/// ### Choosing a Scale Factor:
///
/// **Use `small` (1.128) when:**
/// - Building data-heavy interfaces
/// - Space is limited (mobile, compact views)
/// - Displaying tables or grids
/// - Need subtle hierarchy
///
/// **Use `normal` (1.174) when:**
/// - Building general-purpose UIs
/// - Need balanced, harmonious design
/// - Following Material Design guidelines
/// - Creating forms and settings screens
///
/// **Use `large` (1.272) - DEFAULT when:**
/// - Need clear visual hierarchy
/// - Building content-focused apps
/// - Following modern design trends
/// - Want good readability
///
/// **Use `extraLarge` (1.618) when:**
/// - Creating marketing/landing pages
/// - Need dramatic size differences
/// - Building hero sections
/// - Want maximum visual impact
///
/// ### Example:
/// ```dart
/// // Subtle hierarchy for data tables
/// final compactSizes = AppFontSizes(
///   bodySmall: 12,
///   scaleFactor: AppFontSizesScaleFactors.small,
/// );
///
/// // Dramatic hierarchy for landing page
/// final heroSizes = AppFontSizes(
///   bodySmall: 16,
///   scaleFactor: AppFontSizesScaleFactors.extraLarge,
/// );
/// ```
///
/// ### Recommendations:
/// - Start with `large` (default) for most applications
/// - Use `normal` for Material Design compliance
/// - Use `small` only when space is critically limited
/// - Use `extraLarge` sparingly, mainly for marketing content
/// - Maintain consistency - don't mix scale factors within the same app
///
/// ### See also:
/// - [AppFontSizes] to apply these scale factors
/// - [Type Scale Calculator](https://type-scale.com/) for visualization
class AppFontSizesScaleFactors {
  /// Minor Second scale (1.128) - Compact, subtle hierarchy.
  ///
  /// Creates minimal size differences between levels. Best for
  /// information-dense layouts where space is limited.
  ///
  /// **Progression:** 12, 13.5, 15.2, 17.2, 19.4, 21.9, 24.7, 27.9...
  static const double small = 1.1278422438;

  /// Major Second scale (1.174) - Balanced, harmonious hierarchy.
  ///
  /// Creates moderate size differences. Commonly used in Material Design
  /// and general-purpose applications.
  ///
  /// **Progression:** 12, 14.1, 16.5, 19.4, 22.8, 26.7, 31.4, 36.9...
  static const double normal = 1.1739902127;

  /// Minor Third scale (1.272) - Clear, readable hierarchy. **DEFAULT**
  ///
  /// Creates noticeable size differences while maintaining readability.
  /// Recommended for most applications and content-focused designs.
  ///
  /// **Progression:** 12, 15.3, 19.4, 24.7, 31.4, 40.0, 50.8, 64.7...
  static const double large = 1.2720281269;

  /// Golden Ratio scale (1.618) - Dramatic, impactful hierarchy.
  ///
  /// Creates maximum visual distinction between levels. Best for
  /// marketing pages, hero sections, and high-impact designs.
  ///
  /// **Progression:** 12, 19.4, 31.4, 50.8, 82.2, 133.0, 215.2, 348.3...
  static const double extraLarge = 1.6180555556;
}


/// Predefined font size configurations for common use cases.
///
/// This class provides ready-to-use [AppFontSizes] instances with different
/// base sizes and scale factors, making it easy to switch between size presets
/// for different contexts like accessibility, device types, or user preferences.
///
/// ### Available Base Sizes:
///
/// | Base | Size | Use Case |
/// |------|------|----------|
/// | **small** | 12px | Compact UIs, dense information |
/// | **normal** | 14px | Standard mobile apps (DEFAULT) |
/// | **large** | 16px | Enhanced readability, tablets |
/// | **extraLarge** | 18px | Accessibility, large screens |
/// | **huge** | 20px | Maximum accessibility, presentations |
///
/// ### Scale Factor Variants:
///
/// Each base size has 4 scale factor variants:
/// - **[base]** - Uses small scale (1.128) for subtle hierarchy
/// - **[base]NormalScale** - Uses normal scale (1.174) for balanced hierarchy
/// - **[base]LargeScale** - Uses large scale (1.272) for clear hierarchy ⭐
/// - **[base]ExtraLargeScale** - Uses golden ratio (1.618) for dramatic impact
///
/// ### Quick Reference Table:
/// ```
/// Base Size Presets (with large scale 1.272):
///
///          bodySmall  body   h1     display
/// small:   12px      15px   38px   61px
/// normal:  14px      18px   44px   71px
/// large:   16px      20px   51px   81px
/// xLarge:  18px      23px   57px   91px
/// huge:    20px      25px   64px   102px
/// ```
///
/// ### Example Usage:
/// ```dart
/// // Use default presets (with small scale for compact hierarchy)
/// final fontSizes = AppFontSizesPresets.normal;
///
/// // Use with different scale for more dramatic hierarchy
/// final fontSizes = AppFontSizesPresets.normalLargeScale;
///
/// // Switch based on user preference
/// final userPreference = 'large';
/// final fontSizes = switch (userPreference) {
///   'small' => AppFontSizesPresets.small,
///   'normal' => AppFontSizesPresets.normalLargeScale,
///   'large' => AppFontSizesPresets.largeLargeScale,
///   'extraLarge' => AppFontSizesPresets.extraLargeLargeScale,
///   _ => AppFontSizesPresets.normalLargeScale,
/// };
///
/// // Combine size and scale for fine-tuned control
/// final compactData = AppFontSizesPresets.small; // 12px + small scale
/// final readableContent = AppFontSizesPresets.largeLargeScale; // 16px + large scale
/// final heroSection = AppFontSizesPresets.normalExtraLargeScale; // 14px + golden ratio
/// ```
///
/// ### Recommendations by Use Case:
///
/// **Mobile Apps:**
/// - Default: `normalLargeScale` (14px + clear hierarchy)
/// - Compact: `normal` (14px + subtle hierarchy)
/// - Accessibility: `largeLargeScale` or `extraLargeLargeScale`
///
/// **Tablet Apps:**
/// - Default: `largeLargeScale` (16px + clear hierarchy)
/// - Reading apps: `extraLargeLargeScale`
///
/// **Desktop Apps:**
/// - Data-heavy: `small` or `smallNormalScale`
/// - Standard: `normalNormalScale`
/// - Marketing: `normalExtraLargeScale`
///
/// **Accessibility:**
/// - Level 1: `largeLargeScale`
/// - Level 2: `extraLargeLargeScale`
/// - Level 3: `hugeLargeScale`
///
/// ### See also:
/// - [AppFontSizes] for custom configurations
/// - [AppFontSizesScaleFactors] for available scale factors
/// - [AppFontSizesConstants] for compile-time constants
class AppFontSizesPresets {
  // ============================================
  // SMALL BASE (12px) - Compact UIs
  // ============================================

  /// Compact 12px base with small scale (1.128) - Most subtle hierarchy.
  ///
  /// **Best for:**
  /// - Data tables with many columns
  /// - Dense dashboards
  /// - Admin panels with lots of information
  /// - Desktop apps where space is critical
  ///
  /// **Sizes:** bodySmall: 12.0px, body: 13.5px, bodyLarge: 15.2px, paragraphTitle: 17.2px,
  /// subheader: 19.4px, header: 21.9px, h3: 24.7px, h2: 27.9px, h1: 31.5px, display: 35.5px
  static final small = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Compact 12px base with normal scale (1.174) - Balanced compact layout.
  ///
  /// **Best for:**
  /// - Compact mobile views
  /// - Settings screens with many options
  /// - Forms with limited space
  ///
  /// **Sizes:** bodySmall: 12.0px, body: 14.1px, bodyLarge: 16.5px, paragraphTitle: 19.4px,
  /// subheader: 22.8px, header: 26.7px, h3: 31.4px, h2: 36.8px, h1: 43.2px, display: 50.8px
  static final smallNormalScale = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Compact 12px base with large scale (1.272) - Clear hierarchy in small space.
  ///
  /// **Best for:**
  /// - Compact UIs with clear heading distinction
  /// - Small screen devices with good typography
  /// - Mobile apps targeting small devices
  ///
  /// **Sizes:** bodySmall: 12.0px, body: 15.3px, bodyLarge: 19.4px, paragraphTitle: 24.7px,
  /// subheader: 31.4px, header: 40.0px, h3: 50.9px, h2: 64.7px, h1: 82.3px, display: 104.7px
  static final smallLargeScale = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Compact 12px base with extra large scale (1.618) - Dramatic compact design.
  ///
  /// **Best for:**
  /// - Minimalist designs with strong hierarchy
  /// - Landing pages with compact base text
  /// - Marketing materials with small body copy
  ///
  /// **Sizes:** bodySmall: 12.0px, body: 19.4px, bodyLarge: 31.4px, paragraphTitle: 50.8px,
  /// subheader: 82.2px, header: 133.0px, h3: 215.2px, h2: 348.3px, h1: 563.6px, display: 911.9px
  static final smallExtraLargeScale = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  // ============================================
  // NORMAL BASE (14px) - Standard Mobile Apps
  // ============================================

  /// Standard 14px base with small scale (1.128) - DEFAULT, subtle hierarchy.
  ///
  /// **Best for:**
  /// - Standard mobile apps with many text elements
  /// - Apps where spacing is more important than hierarchy
  /// - Information-dense mobile screens
  ///
  /// **Sizes:** bodySmall: 14.0px, body: 15.8px, bodyLarge: 17.8px, paragraphTitle: 20.1px,
  /// subheader: 22.7px, header: 25.6px, h3: 28.9px, h2: 32.6px, h1: 36.8px, display: 41.5px
  static final normal = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Standard 14px base with normal scale (1.174) - Material Design aligned.
  ///
  /// **Best for:**
  /// - Material Design apps
  /// - General-purpose mobile applications
  /// - Balanced, harmonious designs
  /// - Forms and settings screens
  ///
  /// **Sizes:** bodySmall: 14.0px, body: 16.4px, bodyLarge: 19.3px, paragraphTitle: 22.7px,
  /// subheader: 26.6px, header: 31.2px, h3: 36.7px, h2: 43.0px, h1: 50.5px, display: 59.3px
  static final normalNormalScale = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Standard 14px base with large scale (1.272) - Clear, modern hierarchy.
  ///
  /// **Best for:**
  /// - Modern mobile apps
  /// - Content-focused applications
  /// - Apps with clear section divisions
  /// - Recommended for most new projects
  ///
  /// **Sizes:** bodySmall: 14.0px, body: 17.8px, bodyLarge: 22.6px, paragraphTitle: 28.7px,
  /// subheader: 36.5px, header: 46.4px, h3: 59.0px, h2: 75.0px, h1: 95.4px, display: 121.4px
  static final normalLargeScale = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Standard 14px base with extra large scale (1.618) - Impactful standard base.
  ///
  /// **Best for:**
  /// - Marketing apps with standard body text
  /// - Apps with hero sections
  /// - Onboarding screens
  /// - Landing pages
  ///
  /// **Sizes:** bodySmall: 14.0px, body: 22.7px, bodyLarge: 36.6px, paragraphTitle: 59.3px,
  /// subheader: 95.9px, header: 155.2px, h3: 251.1px, h2: 406.3px, h1: 657.4px, display: 1063.9px
  static final normalExtraLargeScale = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  // ============================================
  // LARGE BASE (16px) - Enhanced Readability
  // ============================================

  /// Large 16px base with small scale (1.128) - Readable with subtle hierarchy.
  ///
  /// **Best for:**
  /// - Reading apps with many text elements
  /// - Content apps where uniformity is important
  /// - Tablet apps with dense content
  ///
  /// **Sizes:** bodySmall: 16.0px, body: 18.0px, bodyLarge: 20.3px, paragraphTitle: 23.0px,
  /// subheader: 25.9px, header: 29.2px, h3: 33.0px, h2: 37.2px, h1: 42.0px, display: 47.4px
  static final large = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Large 16px base with normal scale (1.174) - Balanced readable design.
  ///
  /// **Best for:**
  /// - Web applications
  /// - Tablet interfaces
  /// - Apps for older demographics
  /// - Long-form reading apps
  ///
  /// **Sizes:** bodySmall: 16.0px, body: 18.8px, bodyLarge: 22.1px, paragraphTitle: 25.9px,
  /// subheader: 30.4px, header: 35.7px, h3: 41.9px, h2: 49.2px, h1: 57.7px, display: 67.8px
  static final largeNormalScale = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Large 16px base with large scale (1.272) - Excellent readability.
  ///
  /// **Best for:**
  /// - Tablet apps (RECOMMENDED)
  /// - Desktop web apps
  /// - Content-first applications
  /// - News and magazine apps
  /// - E-readers
  ///
  /// **Sizes:** bodySmall: 16.0px, body: 20.4px, bodyLarge: 25.9px, paragraphTitle: 32.9px,
  /// subheader: 41.9px, header: 53.3px, h3: 67.8px, h2: 86.2px, h1: 109.6px, display: 139.4px
  static final largeLargeScale = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Large 16px base with extra large scale (1.618) - Dramatic readable design.
  ///
  /// **Best for:**
  /// - Marketing websites
  /// - Portfolio sites
  /// - Product landing pages
  /// - Hero-heavy designs
  ///
  /// **Sizes:** bodySmall: 16.0px, body: 25.9px, bodyLarge: 41.9px, paragraphTitle: 67.8px,
  /// subheader: 109.7px, header: 177.5px, h3: 287.2px, h2: 464.7px, h1: 751.8px, display: 1216.4px
  static final largeExtraLargeScale = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  // ============================================
  // EXTRA LARGE BASE (18px) - Accessibility
  // ============================================

  /// Extra large 18px base with small scale (1.128) - Accessible with subtle hierarchy.
  ///
  /// **Best for:**
  /// - Accessibility mode with many text elements
  /// - Senior-friendly apps with uniform text
  /// - Apps requiring large base text only
  ///
  /// **Sizes:** bodySmall: 18.0px, body: 20.3px, bodyLarge: 22.9px, paragraphTitle: 25.8px,
  /// subheader: 29.1px, header: 32.9px, h3: 37.1px, h2: 41.9px, h1: 47.2px, display: 53.3px
  static final extraLarge = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Extra large 18px base with normal scale (1.174) - Accessible balanced design.
  ///
  /// **Best for:**
  /// - Accessibility mode for general apps
  /// - Large screen devices
  /// - Apps for users with mild vision impairment
  /// - Kiosk interfaces
  ///
  /// **Sizes:** bodySmall: 18.0px, body: 21.1px, bodyLarge: 24.8px, paragraphTitle: 29.1px,
  /// subheader: 34.2px, header: 40.1px, h3: 47.1px, h2: 55.3px, h1: 64.9px, display: 76.2px
  static final extraLargeNormalScale = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Extra large 18px base with large scale (1.272) - Clear accessible hierarchy.
  ///
  /// **Best for:**
  /// - Accessibility Level 1 (RECOMMENDED)
  /// - Apps for older adults
  /// - Large tablets and desktop
  /// - Public information displays
  /// - Educational apps
  ///
  /// **Sizes:** bodySmall: 18.0px, body: 22.9px, bodyLarge: 29.1px, paragraphTitle: 37.0px,
  /// subheader: 47.1px, header: 59.9px, h3: 76.2px, h2: 96.9px, h1: 123.3px, display: 156.8px
  static final extraLargeLargeScale = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Extra large 18px base with extra large scale (1.618) - Maximum impact accessible.
  ///
  /// **Best for:**
  /// - Marketing for accessibility-focused products
  /// - Hero sections in accessible apps
  /// - Presentation mode
  /// - Extra-large displays
  ///
  /// **Sizes:** bodySmall: 18.0px, body: 29.1px, bodyLarge: 47.1px, paragraphTitle: 76.2px,
  /// subheader: 123.3px, header: 199.5px, h3: 322.8px, h2: 522.3px, h1: 845.1px, display: 1367.3px
  static final extraLargeExtraLargeScale = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  // ============================================
  // HUGE BASE (20px) - Maximum Accessibility
  // ============================================

  /// Huge 20px base with small scale (1.128) - Maximum size, subtle hierarchy.
  ///
  /// **Best for:**
  /// - Maximum accessibility with uniform text
  /// - Apps for users with severe vision impairment
  /// - Very large displays with subtle differences
  ///
  /// **Sizes:** bodySmall: 20.0px, body: 22.6px, bodyLarge: 25.5px, paragraphTitle: 28.8px,
  /// subheader: 32.5px, header: 36.6px, h3: 41.3px, h2: 46.6px, h1: 52.6px, display: 59.3px
  static final huge = AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Huge 20px base with normal scale (1.174) - Maximum accessible balanced.
  ///
  /// **Best for:**
  /// - Accessibility Level 2
  /// - Kiosk applications
  /// - Public terminals
  /// - Presentation displays
  ///
  /// **Sizes:** bodySmall: 20.0px, body: 23.5px, bodyLarge: 27.6px, paragraphTitle: 32.4px,
  /// subheader: 38.0px, header: 44.6px, h3: 52.4px, h2: 61.5px, h1: 72.2px, display: 84.8px
  static final hugeNormalScale = AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Huge 20px base with large scale (1.272) - Maximum accessibility.
  ///
  /// **Best for:**
  /// - Accessibility Level 3 (MAXIMUM)
  /// - Users with visual impairments
  /// - Elderly care applications
  /// - Medical/healthcare apps
  /// - Public safety information
  ///
  /// **Sizes:** bodySmall: 20.0px, body: 25.4px, bodyLarge: 32.3px, paragraphTitle: 41.1px,
  /// subheader: 52.3px, header: 66.5px, h3: 84.6px, h2: 107.6px, h1: 136.9px, display: 174.1px
  static final hugeLargeScale = AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Huge 20px base with extra large scale (1.618) - Extreme accessibility/impact.
  ///
  /// **Best for:**
  /// - Emergency/alert systems
  /// - Billboard-style displays
  /// - Extra-large presentation mode
  /// - Extreme accessibility needs
  ///
  /// **Sizes:** bodySmall: 20.0px, body: 32.4px, bodyLarge: 52.3px, paragraphTitle: 84.7px,
  /// subheader: 137.0px, header: 221.7px, h3: 358.7px, h2: 580.4px, h1: 939.0px, display: 1519.2px
  static final hugeExtraLargeScale = AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );
}

/// Safe and recommended typographic sizes by device type.
///
/// This class provides device-specific presets based on industry best practices
/// and usability research. All recommendations follow guidelines from Material Design,
/// Apple HIG, and web accessibility standards (WCAG).
///
/// ## 📊 Safe Typography Guidelines
///
/// ### Minimum Readable Sizes:
/// - **Mobile body text:** 16px minimum (avoid zoom requirements)
/// - **Tablet body text:** 16-18px
/// - **Desktop body text:** 16-18px
/// - **Captions/metadata:** 12px minimum (with good contrast)
/// - **Buttons/CTA:** 14px minimum (for touch targets)
///
/// ### Key Principles:
/// 1. **Mobile-first:** Start with 16px for body text
/// 2. **Clear hierarchy:** Titles should be significantly larger (2-3x body)
/// 3. **Line height:** Use 1.4-1.6× font size for readability
/// 4. **Relative units:** Prefer responsive scaling
/// 5. **Contrast:** Ensure WCAG AA compliance (4.5:1 for normal text)
///
/// ## 📱 Recommended Size Ranges by Device
///
/// ```
/// ┌──────────────┬────────┬─────────┬──────────┬─────────────────────┐
/// │ Type         │ Mobile │ Tablet  │ Desktop  │ Use Case            │
/// ├──────────────┼────────┼─────────┼──────────┼─────────────────────┤
/// │ Body         │ 16-20  │ 16-22   │ 16-24    │ Paragraphs, lists   │
/// │ H1           │ 28-40  │ 30-42   │ 32-48    │ Main titles         │
/// │ H2/H3        │ 20-26  │ 22-28   │ 24-32    │ Subtitles           │
/// │ Buttons/CTA  │ 14-18  │ 15-20   │ 14-18    │ Touch targets       │
/// │ Caption      │ 12-14  │ 12-16   │ 14-16    │ Metadata, helpers   │
/// └──────────────┴────────┴─────────┴──────────┴─────────────────────┘
/// ```
///
/// ## 🎯 Usage Examples
///
/// ```dart
/// // Mobile app
/// final mobile = AppFontSizesDevicePresets.mobile;
/// Text('Body', style: TextStyle(fontSize: mobile.body));
/// Text('Title', style: TextStyle(fontSize: mobile.h1));
///
/// // Tablet app
/// final tablet = AppFontSizesDevicePresets.tablet;
/// Text('Body', style: TextStyle(fontSize: tablet.body));
///
/// // Desktop/web app
/// final desktop = AppFontSizesDevicePresets.desktop;
/// Text('Body', style: TextStyle(fontSize: desktop.body));
///
/// // Responsive approach
/// final screenWidth = MediaQuery.of(context).size.width;
/// final preset = screenWidth < 600
///     ? AppFontSizesDevicePresets.mobile
///     : screenWidth < 1024
///         ? AppFontSizesDevicePresets.tablet
///         : AppFontSizesDevicePresets.desktop;
/// ```
///
/// ## 📖 References
/// - [Material Design Typography](https://material.io/design/typography)
/// - [Apple HIG Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
/// - [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
///
/// ### See also:
/// - [AppFontSizesPresets] for base size + scale combinations
/// - [AppFontSizesComponentPresets] for specific UI components
class AppFontSizesDevicePresets {
  // ============================================
  // MOBILE PRESETS (320-599px)
  // ============================================

  /// Mobile complete preset - Balanced mobile typography.
  ///
  /// **Recommended for:** Most mobile applications
  /// **Body range:** 16-20px (safe: 17-18px)
  /// **H1 range:** 28-40px (target: 32px)
  ///
  /// **Why these sizes:**
  /// - 16px minimum prevents iOS auto-zoom
  /// - Clear hierarchy for small screens
  /// - WCAG AA compliant
  ///
  /// **Sizes:** bodySmall: 16px, body: 20.4px, h1: 53.3px
  static final mobile = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Mobile compact - For dense mobile layouts.
  ///
  /// **Use when:** Space is limited, data-heavy mobile screens
  /// **Sizes:** bodySmall: 14px, body: 17.8px, h1: 46.6px
  static final mobileCompact = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Mobile comfortable - Enhanced readability.
  ///
  /// **Use when:** Content-focused, accessibility priority
  /// **Sizes:** bodySmall: 18px, body: 22.9px, h1: 59.9px
  static final mobileComfortable = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  // ============================================
  // TABLET PRESETS (600-1023px)
  // ============================================

  /// Tablet complete preset - Optimized for tablets.
  ///
  /// **Recommended for:** iPad, Android tablets, 2-in-1 devices
  /// **Body range:** 16-22px (target: 18-20px)
  /// **H1 range:** 30-42px (target: 34-38px)
  ///
  /// **Why these sizes:**
  /// - Increased viewing distance
  /// - Better use of screen space
  /// - Comfortable extended reading
  ///
  /// **Sizes:** bodySmall: 16px, body: 20.4px, h1: 53.3px
  static final tablet = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Tablet reading - Enhanced for content consumption.
  ///
  /// **Recommended for:** E-readers, news apps, documentation
  /// **Sizes:** bodySmall: 18px, body: 22.9px, h1: 59.9px
  static final tabletReading = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  // ============================================
  // DESKTOP PRESETS (1024px+)
  // ============================================

  /// Desktop complete preset - Standard desktop typography.
  ///
  /// **Recommended for:** Web apps, desktop applications, dashboards
  /// **Body range:** 16-24px (standard: 16-18px)
  /// **H1 range:** 32-48px (target: 38-42px)
  ///
  /// **Why these sizes:**
  /// - Web convention (16px base)
  /// - Scalable with browser zoom
  /// - Professional appearance
  ///
  /// **Sizes:** bodySmall: 16px, body: 20.4px, h1: 53.3px
  static final desktop = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Desktop reading - Enhanced for content.
  ///
  /// **Recommended for:** Blogs, documentation, articles, wikis
  /// **Sizes:** bodySmall: 18px, body: 22.9px, h1: 59.9px
  static final desktopReading = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// Desktop marketing - High-impact web presence.
  ///
  /// **Recommended for:** Landing pages, marketing sites, portfolios
  /// **Sizes:** bodySmall: 16px, body: 25.9px, h1: 177.2px, display: 464.3px
  static final desktopMarketing = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  /// Desktop compact - For data-dense UIs.
  ///
  /// **Recommended for:** Admin panels, data tables, dashboards
  /// **Sizes:** bodySmall: 14px, body: 16.4px, h1: 31.2px
  static final desktopCompact = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );
}

/// Presets específicos para componentes UI (botones, captions, etiquetas, etc.).
///
/// Estos presets están optimizados para elementos de interfaz específicos y
/// siguen las mejores prácticas de accesibilidad y usabilidad.
///
/// ## 📏 Tamaños Recomendados por Componente
///
/// ### Botones/CTA:
/// - **Móvil:** 14-18px (mínimo 14px para táctil)
/// - **Tablet:** 15-20px
/// - **Desktop:** 14-18px
///
/// ### Captions/Metadata:
/// - **Móvil:** 12-14px (mínimo 12px)
/// - **Tablet:** 12-16px
/// - **Desktop:** 14-16px
///
/// ### Form Labels:
/// - **Móvil:** 14-16px
/// - **Tablet:** 15-18px
/// - **Desktop:** 14-18px
///
/// ## 🎯 Principios de Diseño
///
/// 1. **Mínimo táctil:** 14px para elementos interactivos en móvil
/// 2. **Contraste:** Captions requieren alto contraste (WCAG AAA)
/// 3. **Legibilidad:** Nunca menor a 12px excepto casos especiales
/// 4. **Consistencia:** Mantener tamaños similares en contextos similares
///
/// ### See also:
/// - [AppFontSizesDevicePresets] for device-specific presets
class AppFontSizesComponentPresets {
  // ============================================
  // BOTONES / CTA - Touch-friendly sizes
  // ============================================

  /// Mobile button - 14-16px, touch-optimized.
  ///
  /// **Range:** 14-18px (recommended: 16px for primary)
  /// **Min size:** 14px ensures tap target legibility
  ///
  /// **Use for:** Mobile buttons, CTAs, action buttons
  static final buttonMobile = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Tablet button - 15-17px.
  ///
  /// **Range:** 15-20px (recommended: 17px for primary)
  ///
  /// **Use for:** Tablet buttons, larger touch targets
  static final buttonTablet = AppFontSizes(
    bodySmall: 17,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Desktop button - 14-16px.
  ///
  /// **Range:** 14-18px (recommended: 16px for primary)
  ///
  /// **Use for:** Web buttons, desktop CTAs
  static final buttonDesktop = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Small button/link - 14px minimum.
  ///
  /// **Use for:** Text links, tertiary actions, cancel buttons
  static final buttonSmall = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Large CTA - 18px.
  ///
  /// **Use for:** Hero CTAs, primary conversions
  static final buttonLarge = AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  // ============================================
  // CAPTIONS / METADATA - Subtle supporting text
  // ============================================

  /// Mobile caption - 12-13px minimum.
  ///
  /// **Range:** 12-14px (recommended: 13px)
  /// **⚠️ Important:** Requires high contrast (7:1 for WCAG AAA)
  ///
  /// **Use for:** Timestamps, metadata, helper text, footnotes
  static final captionMobile = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Tablet caption - 12-14px.
  ///
  /// **Range:** 12-16px (recommended: 14px)
  ///
  /// **Use for:** Tablet captions, metadata
  static final captionTablet = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Desktop caption - 14-15px.
  ///
  /// **Range:** 14-16px (recommended: 15px)
  ///
  /// **Use for:** Web captions, metadata
  static final captionDesktop = AppFontSizes(
    bodySmall: 15,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Emphasized caption - 14px.
  ///
  /// **Use for:** Important metadata, highlighted captions
  static final captionEmphasis = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  // ============================================
  // FORM LABELS - Clear field identification
  // ============================================

  /// Mobile form label - 14-16px.
  ///
  /// **Range:** 14-16px (recommended: 16px for accessibility)
  ///
  /// **Use for:** Input labels, field headers
  static final formLabelMobile = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Tablet form label - 15-18px.
  ///
  /// **Range:** 15-18px (recommended: 17px)
  ///
  /// **Use for:** Tablet forms
  static final formLabelTablet = AppFontSizes(
    bodySmall: 17,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Desktop form label - 14-18px.
  ///
  /// **Range:** 14-18px (recommended: 16px)
  ///
  /// **Use for:** Web forms, desktop apps
  static final formLabelDesktop = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Form hint - 14px.
  ///
  /// **Use for:** Helper text, validation messages
  static final formHint = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  // ============================================
  // OVERLINES - Eyebrow text / Section labels
  // ============================================

  /// Overline standard - 12px (all caps recommended).
  ///
  /// **Typography tip:** Use uppercase + letter-spacing: 0.5-1px
  ///
  /// **Use for:** Section labels, category tags
  static final overlineStandard = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Overline large - 14px.
  ///
  /// **Use for:** Prominent section dividers
  static final overlineLarge = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  // ============================================
  // SPECIALIZED COMPONENTS
  // ============================================

  /// Navigation menu - 15-16px.
  ///
  /// **Use for:** App drawer, navigation bar, menu items
  static final navigationMenu = AppFontSizes(
    bodySmall: 15,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Tab labels - 14-16px.
  ///
  /// **Use for:** Tab bars, segmented controls
  static final tabLabel = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Notifications - 14-16px.
  ///
  /// **Use for:** Toasts, snackbars, alerts
  static final notification = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Badge/chip - 12-14px.
  ///
  /// **Use for:** Badges, chips, tags, pills
  static final badge = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// List item title - 16px.
  ///
  /// **Use for:** List tiles, card titles
  static final listItemTitle = AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// List item subtitle - 14px.
  ///
  /// **Use for:** List subtitles, secondary text
  static final listItemSubtitle = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// Dialog title - 20px.
  ///
  /// **Use for:** Alert dialogs, modal headers
  static final dialogTitle = AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// Tooltip - 12px (ensure high contrast).
  ///
  /// **Use for:** Tooltips, hover hints
  static final tooltip = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  // ============================
  // DEPRECATED - Mantener compatibilidad
  // ============================

  /// @Deprecated('Use buttonSmall instead')
  static final buttonLabelSmall = buttonSmall;

  /// @Deprecated('Use buttonDesktop instead')
  static final buttonLabelStandard = buttonDesktop;

  /// @Deprecated('Use buttonLarge instead')
  static final buttonLabelLarge = buttonLarge;

  /// @Deprecated('Use captionMobile instead')
  static final captionTiny = captionMobile;

  /// @Deprecated('Use captionMobile instead')
  static final captionStandard = captionMobile;

  /// @Deprecated('Use captionEmphasis instead')
  static final captionLarge = captionEmphasis;

  /// @Deprecated('Use formLabelMobile instead')
  static final formLabelSmall = formLabelMobile;

  /// @Deprecated('Use formLabelDesktop instead')
  static final formLabelStandard = formLabelDesktop;

  /// @Deprecated('Use formLabelTablet instead')
  static final formLabelLarge = formLabelTablet;

  /// @Deprecated('Use overlineStandard with 10px 대신')
  static final overlineSmall = AppFontSizes(
    bodySmall: 10,
    scaleFactor: AppFontSizesScaleFactors.small,
  );
}

