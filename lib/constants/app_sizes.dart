/// Sistema de escalado base para toda la aplicación
///
/// [AppSizes] proporciona una escala de diseño unificada y consistente que
/// sirve como base para todos los demás sistemas (spacing, radius, iconos, etc.).
/// Usar estos valores garantiza coherencia visual en toda la aplicación.
///
/// ### 📏 Escalas Disponibles
///
/// **Escala Base** (uso general):
/// - `none` (0.0) → Sin tamaño
/// - `xxs` (2.0) → Extra extra pequeño
/// - `xs` (4.0) → Extra pequeño
/// - `sm` (6.0) → Pequeño
/// - `smd` (8.0) → Pequeño-mediano
/// - `mds` (10.0) → Mediano-pequeño
/// - `md` (12.0) → Mediano ⭐ (más común)
/// - `mdl` (14.0) → Mediano-grande
/// - `lg` (16.0) → Grande
/// - `lgx` (18.0) → Grande-extra
/// - `xl` (20.0) → Extra grande
/// - `xxl` (24.0) → Extra extra grande
/// - `xxxl` (28.0) → Extra extra extra grande
///
/// **Escala Extendida** (elementos grandes):
/// - `huge` (32.0) → Enorme
/// - `massive` (40.0) → Masivo
/// - `giant` (48.0) → Gigante
/// - `mega` (56.0) → Mega
/// - `ultra` (64.0) → Ultra
/// - `extreme` (80.0) → Extremo
/// - `colossal` (96.0) → Colosal
///
/// ### 🎨 Uso Básico
///
/// ```dart
/// // Tamaños base para dimensiones
/// Container(
///   width: AppSizes.md,    // 12.0
///   height: AppSizes.lg,   // 16.0
/// )
///
/// // Iconos con tamaños estandarizados
/// Icon(Icons.home, size: AppSizes.iconLg)  // 24.0
///
/// // Avatares con radio predefinido
/// CircleAvatar(radius: AppSizes.avatarMd)  // 40.0
///
/// // Elevaciones según Material Design
/// Card(elevation: AppSizes.elevationMd)  // 4.0
///
/// // Opacidades para estados
/// Opacity(
///   opacity: AppSizes.opacityDisabled,  // 0.38
///   child: Text('Deshabilitado'),
/// )
///
/// // Breakpoints responsivos
/// if (MediaQuery.of(context).size.width < AppSizes.maxMobileWidth) {
///   // Layout móvil
/// }
/// ```
///
/// ### 📱 Tamaños de Iconos
///
/// Basados en Material Design:
/// - `iconXs` (12.0) → Iconos muy pequeños (badges)
/// - `iconSm` (16.0) → Iconos pequeños (inputs)
/// - `iconMd` (20.0) → Iconos medianos (botones)
/// - `iconLg` (24.0) → Estándar Material Design ⭐
/// - `iconXl` (32.0) → Iconos grandes (headers)
/// - `iconXxl` (40.0) → Iconos muy grandes (hero)
/// - `iconHuge` (48.0) → Iconos enormes (splash)
///
/// ### 👤 Tamaños de Avatares
///
/// Radio del CircleAvatar:
/// - `avatarXs` (24.0) → Mini avatar (listas compactas)
/// - `avatarSm` (32.0) → Avatar pequeño (chips)
/// - `avatarMd` (40.0) → Avatar mediano (listas) ⭐
/// - `avatarLg` (48.0) → Avatar grande (detalles)
/// - `avatarXl` (64.0) → Avatar extra grande (perfiles)
/// - `avatarXxl` (80.0) → Avatar muy grande
/// - `avatarHuge` (96.0) → Avatar enorme
/// - `avatarMassive` (128.0) → Avatar masivo (página perfil)
///
/// ### 🎭 Elevaciones (Material Design)
///
/// Profundidad de sombras:
/// - `elevationNone` (0.0) → Sin sombra
/// - `elevationXs` (1.0) → Mínima (cards reposo)
/// - `elevationSm` (2.0) → Baja (botones, chips)
/// - `elevationMd` (4.0) → Estándar (cards, app bar) ⭐
/// - `elevationLg` (6.0) → Media (FAB)
/// - `elevationXl` (8.0) → Alta (drawer, bottom sheet)
/// - `elevationXxl` (12.0) → Muy alta (dialogs)
/// - `elevationHuge` (16.0) → Enorme (nav drawer)
/// - `elevationMassive` (24.0) → Masiva (modal sheets)
///
/// ### 🌫️ Opacidades (Material Design)
///
/// Niveles de transparencia:
/// - `opacityNone` (0.0) → Transparente completo
/// - `opacityHover` (0.12) → Hover/ripple effects
/// - `opacityDisabled` (0.38) → Elementos deshabilitados
/// - `opacityMedium` (0.54) → Texto secundario
/// - `opacityMediumHigh` (0.70) → Elementos menos importantes
/// - `opacityHigh` (0.87) → Texto principal
/// - `opacityFull` (1.0) → Opaco completo
///
/// ### 📐 Breakpoints Responsivos
///
/// Anchos máximos para diferentes dispositivos:
/// - `maxMobileWidth` (600.0) → Teléfonos
/// - `maxTabletWidth` (900.0) → Tablets
/// - `maxDesktopWidth` (1200.0) → Escritorio
/// - `maxContentWidth` (1536.0) → Contenido centrado máximo
///
/// ### 📏 Aspect Ratios
///
/// Proporciones comunes:
/// - `aspectRatioSquare` (1.0) → Cuadrado 1:1
/// - `aspectRatioStandard` (1.33) → Estándar 4:3
/// - `aspectRatioPhoto` (1.5) → Foto 3:2
/// - `aspectRatioWide` (1.78) → Widescreen 16:9
/// - `aspectRatioCinematic` (2.35) → Cinemático 21:9
///
/// ### 💡 Recomendaciones
///
/// 1. **Consistencia**: Usa siempre estos valores en lugar de números arbitrarios
/// 2. **Semántica**: Elige el nombre que mejor describa el propósito
/// 3. **Escalabilidad**: Los tamaños siguen una progresión geométrica coherente
/// 4. **Material Design**: Los valores de elevación y opacidad siguen las guías oficiales
/// 5. **Responsive**: Usa los breakpoints para adaptar layouts
///
/// ### 🔗 Ver también
///
/// - [AppSpacing] para espaciado y padding basado en estas escalas
/// - [AppRadius] para border radius consistente
/// - [AppUI] para acceso rápido a constantes UI comunes
///
/// ### 📚 Referencias
///
/// - [Material Design - Elevation](https://material.io/design/environment/elevation.html)
/// - [Material Design - Iconography](https://material.io/design/iconography)
class AppSizes {
  AppSizes._();

  // Escala base (0-10)
  /// 0.0 - Sin tamaño
  static const double none = 0.0;

  /// 2.0 - Extra extra pequeño
  static const double xxs = 2.0;

  /// 4.0 - Extra pequeño
  static const double xs = 4.0;

  /// 6.0 - Muy pequeño
  static const double sm = 6.0;

  /// 8.0 - Pequeño a mediano
  static const double smd = 8.0;

  /// 10.0 - Mediano pequeño
  static const double mds = 10.0;

  /// 12.0 - Mediano
  static const double md = 12.0;

  /// 14.0 - Mediano a largo
  static const double mdl = 14.0;

  /// 16.0 - Largo
  static const double lg = 16.0;

  /// 18.0 - Largo a extra largo
  static const double lgx = 18.0;

  /// 20.0 - Extra largo
  static const double xl = 20.0;

  /// 24.0 - Extra extra largo
  static const double xxl = 24.0;

  /// 28.0 - Extra extra extra largo
  static const double xxxl = 28.0;

  /// 32.0 - Enorme
  static const double huge = 32.0;

  /// 40.0 - Masivo
  static const double massive = 40.0;

  /// 48.0 - Gigante
  static const double giant = 48.0;

  /// 56.0 - Mega
  static const double mega = 56.0;

  /// 64.0 - Ultra
  static const double ultra = 64.0;

  /// 80.0 - Extremo
  static const double extreme = 80.0;

  /// 96.0 - Colosal
  static const double colossal = 96.0;

  // Tamaños de iconos (basados en Material Design)
  /// 12.0 - Ícono extra pequeño
  static const double iconXs = 12.0;

  /// 16.0 - Ícono pequeño
  static const double iconSm = 16.0;

  /// 20.0 - Ícono mediano
  static const double iconMd = 20.0;

  /// 24.0 - Tamaño estándar de Material Design
  static const double iconLg = 24.0;

  /// 32.0 - Ícono extra grande
  static const double iconXl = 32.0;

  /// 40.0 - Ícono muy grande
  static const double iconXxl = 40.0;

  /// 48.0 - Ícono enorme
  static const double iconHuge = 48.0;

  // Tamaños de avatares
  /// 24.0 - Avatar extra pequeño
  static const double avatarXs = 24.0;

  /// 32.0 - Avatar pequeño
  static const double avatarSm = 32.0;

  /// 40.0 - Avatar mediano (uso común en listas)
  static const double avatarMd = 40.0;

  /// 48.0 - Avatar grande
  static const double avatarLg = 48.0;

  /// 64.0 - Avatar extra grande
  static const double avatarXl = 64.0;

  /// 80.0 - Avatar muy grande
  static const double avatarXxl = 80.0;

  /// 96.0 - Avatar enorme
  static const double avatarHuge = 96.0;

  /// 128.0 - Avatar masivo (para perfiles)
  static const double avatarMassive = 128.0;

  // Anchos máximos (breakpoints)
  /// 600.0 - Ancho máximo para dispositivos móviles
  static const double maxMobileWidth = 600.0;

  /// 900.0 - Ancho máximo para tablets
  static const double maxTabletWidth = 900.0;

  /// 1200.0 - Ancho máximo para desktop
  static const double maxDesktopWidth = 1200.0;

  /// 1536.0 - Ancho máximo para contenido centrado
  static const double maxContentWidth = 1536.0;

  // Elevaciones (Material Design)
  /// 0.0 - Sin elevación
  static const double elevationNone = 0.0;

  /// 1.0 - Elevación mínima (cards en reposo)
  static const double elevationXs = 1.0;

  /// 2.0 - Elevación baja (botones, chips)
  static const double elevationSm = 2.0;

  /// 4.0 - Elevación estándar (cards elevadas, app bar)
  static const double elevationMd = 4.0;

  /// 6.0 - Elevación media (floating action button)
  static const double elevationLg = 6.0;

  /// 8.0 - Elevación alta (drawer, bottom sheet)
  static const double elevationXl = 8.0;

  /// 12.0 - Elevación muy alta (dialogs)
  static const double elevationXxl = 12.0;

  /// 16.0 - Elevación enorme (navigation drawer)
  static const double elevationHuge = 16.0;

  /// 24.0 - Elevación masiva (modal bottom sheet)
  static const double elevationMassive = 24.0;

  // Opacidades (Material Design)
  /// 0.0 - Completamente transparente
  static const double opacityNone = 0.0;

  /// 0.12 - Hover/Press sobre superficie (ripple effects)
  static const double opacityHover = 0.12;

  /// 0.38 - Estado deshabilitado (texto e iconos)
  static const double opacityDisabled = 0.38;

  /// 0.54 - Texto secundario y ayuda
  static const double opacityMedium = 0.54;

  /// 0.70 - Nivel medio-alto (elementos menos importantes)
  static const double opacityMediumHigh = 0.70;

  /// 0.87 - Texto activo y primario
  static const double opacityHigh = 0.87;

  /// 1.0 - Completamente opaco
  static const double opacityFull = 1.0;

  // Aspect Ratios
  /// 1.0 - Cuadrado perfecto (1:1)
  static const double aspectRatioSquare = 1.0;

  /// 1.33 - Formato estándar (4:3) - Común en fotografía tradicional
  static const double aspectRatioStandard = 4 / 3;

  /// 1.5 - Formato foto (3:2) - Cámaras DSLR
  static const double aspectRatioPhoto = 3 / 2;

  /// 1.78 - Widescreen (16:9) - Videos y pantallas modernas
  static const double aspectRatioWide = 16 / 9;

  /// 2.35 - Cinemático (21:9) - Películas y ultra-wide
  static const double aspectRatioCinematic = 21 / 9;
}
