import 'app_sizes.dart';

/// Constantes de UI adicionales para acceso rápido y conveniente
///
/// Esta clase proporciona acceso directo a valores comúnmente usados de [AppSizes],
/// facilitando el uso de constantes de UI sin necesidad de importar múltiples archivos.
///
/// **Uso básico:**
/// ```dart
/// // Elevaciones
/// Card(
///   elevation: AppUI.elevationMd,
///   child: ...,
/// );
///
/// // Opacidades
/// Opacity(
///   opacity: AppUI.opacityDisabled,
///   child: Text('Texto deshabilitado'),
/// );
///
/// // Iconos
/// Icon(Icons.home, size: AppUI.iconLg);
///
/// // Avatares
/// CircleAvatar(radius: AppUI.avatarMd);
///
/// // Breakpoints responsivos
/// if (width < AppUI.maxMobileWidth) {
///   // Layout móvil
/// }
/// ```
///
/// **Nota:** Todos los valores están delegados a [AppSizes] para mantener
/// una única fuente de verdad en el sistema de diseño.
class AppUI {
  AppUI._();

  // Elevaciones - Delega a AppSizes
  /// 0.0 - Sin elevación
  static const double elevationNone = AppSizes.elevationNone;

  /// 1.0 - Elevación mínima (cards en reposo)
  static const double elevationXs = AppSizes.elevationXs;

  /// 2.0 - Elevación baja (botones, chips)
  static const double elevationSm = AppSizes.elevationSm;

  /// 4.0 - Elevación estándar (cards elevadas, app bar)
  static const double elevationMd = AppSizes.elevationMd;

  /// 6.0 - Elevación media (floating action button)
  static const double elevationLg = AppSizes.elevationLg;

  /// 8.0 - Elevación alta (drawer, bottom sheet)
  static const double elevationXl = AppSizes.elevationXl;

  /// 12.0 - Elevación muy alta (dialogs)
  static const double elevationXxl = AppSizes.elevationXxl;

  /// 16.0 - Elevación enorme (navigation drawer)
  static const double elevationHuge = AppSizes.elevationHuge;

  /// 24.0 - Elevación masiva (modal bottom sheet)
  static const double elevationMassive = AppSizes.elevationMassive;

  // Opacidades - Delega a AppSizes
  /// 0.0 - Completamente transparente
  static const double opacityNone = AppSizes.opacityNone;

  /// 0.12 - Hover/Press sobre superficie (ripple effects)
  static const double opacityHover = AppSizes.opacityHover;

  /// 0.38 - Estado deshabilitado (texto e iconos)
  static const double opacityDisabled = AppSizes.opacityDisabled;

  /// 0.54 - Texto secundario y ayuda
  static const double opacityMedium = AppSizes.opacityMedium;

  /// 0.70 - Nivel medio-alto (elementos menos importantes)
  static const double opacityMediumHigh = AppSizes.opacityMediumHigh;

  /// 0.87 - Texto activo y primario
  static const double opacityHigh = AppSizes.opacityHigh;

  /// 1.0 - Completamente opaco
  static const double opacityFull = AppSizes.opacityFull;

  // Tamaños de iconos - Delega a AppSizes
  /// 12.0 - Ícono extra pequeño
  static const double iconXs = AppSizes.iconXs;

  /// 16.0 - Ícono pequeño
  static const double iconSm = AppSizes.iconSm;

  /// 20.0 - Ícono mediano
  static const double iconMd = AppSizes.iconMd;

  /// 24.0 - Tamaño estándar de Material Design
  static const double iconLg = AppSizes.iconLg;

  /// 32.0 - Ícono extra grande
  static const double iconXl = AppSizes.iconXl;

  /// 40.0 - Ícono muy grande
  static const double iconXxl = AppSizes.iconXxl;

  /// 48.0 - Ícono enorme
  static const double iconHuge = AppSizes.iconHuge;

  // Tamaños de avatares - Delega a AppSizes
  /// 24.0 - Avatar extra pequeño
  static const double avatarXs = AppSizes.avatarXs;

  /// 32.0 - Avatar pequeño
  static const double avatarSm = AppSizes.avatarSm;

  /// 40.0 - Avatar mediano (uso común en listas)
  static const double avatarMd = AppSizes.avatarMd;

  /// 48.0 - Avatar grande
  static const double avatarLg = AppSizes.avatarLg;

  /// 64.0 - Avatar extra grande
  static const double avatarXl = AppSizes.avatarXl;

  /// 80.0 - Avatar muy grande
  static const double avatarXxl = AppSizes.avatarXxl;

  /// 96.0 - Avatar enorme
  static const double avatarHuge = AppSizes.avatarHuge;

  /// 128.0 - Avatar masivo (para perfiles)
  static const double avatarMassive = AppSizes.avatarMassive;

  // Anchos máximos (breakpoints) - Delega a AppSizes
  /// 600.0 - Ancho máximo para dispositivos móviles
  static const double maxMobileWidth = AppSizes.maxMobileWidth;

  /// 900.0 - Ancho máximo para tablets
  static const double maxTabletWidth = AppSizes.maxTabletWidth;

  /// 1200.0 - Ancho máximo para desktop
  static const double maxDesktopWidth = AppSizes.maxDesktopWidth;

  /// 1536.0 - Ancho máximo para contenido centrado
  static const double maxContentWidth = AppSizes.maxContentWidth;

  // Aspect Ratios - Delega a AppSizes
  /// 1.0 - Cuadrado perfecto (1:1)
  static const double aspectRatioSquare = AppSizes.aspectRatioSquare;

  /// 1.33 - Formato estándar (4:3) - Común en fotografía tradicional
  static const double aspectRatioStandard = AppSizes.aspectRatioStandard;

  /// 1.5 - Formato foto (3:2) - Cámaras DSLR
  static const double aspectRatioPhoto = AppSizes.aspectRatioPhoto;

  /// 1.78 - Widescreen (16:9) - Videos y pantallas modernas
  static const double aspectRatioWide = AppSizes.aspectRatioWide;

  /// 2.35 - Cinemático (21:9) - Películas y ultra-wide
  static const double aspectRatioCinematic = AppSizes.aspectRatioCinematic;
}
