import 'app_sizes.dart';

/// Acceso rápido y conveniente a constantes UI comúnmente usadas
///
/// [AppUI] es una clase de conveniencia que proporciona acceso directo a valores
/// frecuentemente utilizados de [AppSizes], sin necesidad de recordar qué archivo
/// importar. Todos los valores están delegados a [AppSizes] para mantener una única
/// fuente de verdad en el sistema de diseño.
///
/// ### 🎯 ¿Cuándo usar AppUI vs AppSizes?
///
/// **Usa [AppUI] cuando:**
/// - Trabajas con elevaciones, opacidades, iconos o avatares
/// - Necesitas breakpoints responsivos
/// - Quieres acceso rápido sin pensar en imports
/// - Estás escribiendo código de UI común
///
/// **Usa [AppSizes] cuando:**
/// - Necesitas valores de la escala base (md, lg, xl, etc.)
/// - Trabajas con dimensiones personalizadas
/// - Necesitas acceso a aspect ratios
///
/// ### 📦 Categorías Disponibles
///
/// 1. **Elevaciones** - Profundidad de sombras (Material Design)
/// 2. **Opacidades** - Niveles de transparencia (Material Design)
/// 3. **Tamaños de Iconos** - Dimensiones estandarizadas
/// 4. **Tamaños de Avatares** - Radios predefinidos
/// 5. **Breakpoints** - Anchos máximos responsivos
/// 6. **Aspect Ratios** - Proporciones comunes
///
/// ### 🎨 Uso Básico
///
/// ```dart
/// // ✅ Elevaciones - Profundidad de sombras
/// Card(
///   elevation: AppUI.elevationMd,  // 4.0 - Estándar
///   child: Content(),
/// )
///
/// // ✅ Opacidades - Estados y jerarquía
/// Opacity(
///   opacity: AppUI.opacityDisabled,  // 0.38 - Deshabilitado
///   child: Text('No disponible'),
/// )
///
/// // ✅ Iconos - Tamaños consistentes
/// Icon(
///   Icons.home,
///   size: AppUI.iconLg,  // 24.0 - Estándar Material
/// )
///
/// // ✅ Avatares - Radios predefinidos
/// CircleAvatar(
///   radius: AppUI.avatarMd,  // 40.0 - Lista estándar
///   child: Text('JD'),
/// )
///
/// // ✅ Breakpoints - Diseño responsive
/// final width = MediaQuery.of(context).size.width;
/// if (width < AppUI.maxMobileWidth) {
///   return MobileLayout();
/// } else if (width < AppUI.maxTabletWidth) {
///   return TabletLayout();
/// } else {
///   return DesktopLayout();
/// }
///
/// // ✅ Aspect Ratios - Proporciones
/// AspectRatio(
///   aspectRatio: AppUI.aspectRatioWide,  // 16:9
///   child: Image.network('url'),
/// )
/// ```
///
/// ### 🎭 Elevaciones (Material Design)
///
/// Profundidad de sombras según contexto:
///
/// ```dart
/// // Cards en reposo
/// Card(elevation: AppUI.elevationXs)  // 1.0
///
/// // Botones, chips
/// ElevatedButton(elevation: AppUI.elevationSm)  // 2.0
///
/// // Cards elevadas, app bar ⭐
/// Card(elevation: AppUI.elevationMd)  // 4.0
///
/// // Floating Action Button
/// FloatingActionButton(elevation: AppUI.elevationLg)  // 6.0
///
/// // Drawer, bottom sheet
/// Drawer(elevation: AppUI.elevationXl)  // 8.0
///
/// // Dialogs
/// Dialog(elevation: AppUI.elevationXxl)  // 12.0
///
/// // Navigation drawer
/// NavigationDrawer(elevation: AppUI.elevationHuge)  // 16.0
///
/// // Modal bottom sheet
/// showModalBottomSheet(elevation: AppUI.elevationMassive)  // 24.0
/// ```
///
/// ### 🌫️ Opacidades (Material Design)
///
/// Niveles de transparencia para estados y jerarquía:
///
/// ```dart
/// // Hover/press effects
/// Color.withOpacity(AppUI.opacityHover)  // 0.12
///
/// // Elementos deshabilitados
/// Opacity(
///   opacity: AppUI.opacityDisabled,  // 0.38
///   child: DisabledButton(),
/// )
///
/// // Texto secundario, ayuda
/// Text(
///   'Texto secundario',
///   style: TextStyle(
///     color: Colors.black.withOpacity(AppUI.opacityMedium),  // 0.54
///   ),
/// )
///
/// // Elementos menos importantes
/// Icon(
///   Icons.info,
///   color: Colors.black.withOpacity(AppUI.opacityMediumHigh),  // 0.70
/// )
///
/// // Texto principal ⭐
/// Text(
///   'Texto principal',
///   style: TextStyle(
///     color: Colors.black.withOpacity(AppUI.opacityHigh),  // 0.87
///   ),
/// )
///
/// // Completamente opaco
/// Container(
///   color: Colors.blue.withOpacity(AppUI.opacityFull),  // 1.0
/// )
/// ```
///
/// ### 📱 Tamaños de Iconos
///
/// Dimensiones estandarizadas según contexto:
///
/// ```dart
/// // Badges, indicadores
/// Icon(Icons.circle, size: AppUI.iconXs)  // 12.0
///
/// // Inputs, campos de texto
/// Icon(Icons.search, size: AppUI.iconSm)  // 16.0
///
/// // Botones estándar
/// Icon(Icons.add, size: AppUI.iconMd)  // 20.0
///
/// // Estándar Material Design ⭐
/// Icon(Icons.home, size: AppUI.iconLg)  // 24.0
///
/// // Headers, títulos
/// Icon(Icons.star, size: AppUI.iconXl)  // 32.0
///
/// // Hero sections
/// Icon(Icons.favorite, size: AppUI.iconXxl)  // 40.0
///
/// // Splash screens
/// Icon(Icons.logo, size: AppUI.iconHuge)  // 48.0
/// ```
///
/// ### 👤 Tamaños de Avatares
///
/// Radios predefinidos para CircleAvatar:
///
/// ```dart
/// // Listas compactas, chips
/// CircleAvatar(radius: AppUI.avatarXs)  // 24.0
///
/// // Chips, tags pequeños
/// CircleAvatar(radius: AppUI.avatarSm)  // 32.0
///
/// // Listas estándar ⭐
/// CircleAvatar(radius: AppUI.avatarMd)  // 40.0
///
/// // Detalles, cards
/// CircleAvatar(radius: AppUI.avatarLg)  // 48.0
///
/// // Perfiles, headers
/// CircleAvatar(radius: AppUI.avatarXl)  // 64.0
///
/// // Perfiles destacados
/// CircleAvatar(radius: AppUI.avatarXxl)  // 80.0
///
/// // Hero sections
/// CircleAvatar(radius: AppUI.avatarHuge)  // 96.0
///
/// // Página de perfil completa
/// CircleAvatar(radius: AppUI.avatarMassive)  // 128.0
/// ```
///
/// ### 📐 Breakpoints Responsivos
///
/// Anchos máximos para diferentes dispositivos:
///
/// ```dart
/// // Ejemplo: Layout responsive completo
/// Widget build(BuildContext context) {
///   final width = MediaQuery.of(context).size.width;
///
///   // Mobile: < 600px
///   if (width < AppUI.maxMobileWidth) {
///     return MobileLayout(
///       padding: AppSpacing.paddingLg,  // 16.0
///       columns: 1,
///     );
///   }
///
///   // Tablet: 600px - 900px
///   if (width < AppUI.maxTabletWidth) {
///     return TabletLayout(
///       padding: AppSpacing.paddingXl,  // 20.0
///       columns: 2,
///     );
///   }
///
///   // Desktop: 900px - 1200px
///   if (width < AppUI.maxDesktopWidth) {
///     return DesktopLayout(
///       padding: AppSpacing.paddingXxl,  // 24.0
///       columns: 3,
///     );
///   }
///
///   // Large Desktop: > 1200px
///   return Container(
///     constraints: BoxConstraints(
///       maxWidth: AppUI.maxContentWidth,  // 1536.0 - Contenido centrado
///     ),
///     child: WideDesktopLayout(
///       padding: AppSpacing.paddingHuge,  // 32.0
///       columns: 4,
///     ),
///   );
/// }
///
/// // Ejemplo: Utility para obtener tipo de dispositivo
/// DeviceType getDeviceType(BuildContext context) {
///   final width = MediaQuery.of(context).size.width;
///   if (width < AppUI.maxMobileWidth) return DeviceType.mobile;
///   if (width < AppUI.maxTabletWidth) return DeviceType.tablet;
///   return DeviceType.desktop;
/// }
/// ```
///
/// ### 📏 Aspect Ratios
///
/// Proporciones comunes para imágenes y media:
///
/// ```dart
/// // Cuadrado - Posts de redes sociales
/// AspectRatio(
///   aspectRatio: AppUI.aspectRatioSquare,  // 1:1
///   child: Image.network('url'),
/// )
///
/// // Estándar - Fotografía tradicional
/// AspectRatio(
///   aspectRatio: AppUI.aspectRatioStandard,  // 4:3
///   child: Image.network('url'),
/// )
///
/// // Foto - Cámaras DSLR
/// AspectRatio(
///   aspectRatio: AppUI.aspectRatioPhoto,  // 3:2
///   child: Image.network('url'),
/// )
///
/// // Widescreen - Videos, pantallas ⭐
/// AspectRatio(
///   aspectRatio: AppUI.aspectRatioWide,  // 16:9
///   child: VideoPlayer(),
/// )
///
/// // Cinemático - Películas, ultra-wide
/// AspectRatio(
///   aspectRatio: AppUI.aspectRatioCinematic,  // 21:9
///   child: MovieClip(),
/// )
/// ```
///
/// ### 💡 Consejos de Uso
///
/// 1. **Import único**: Solo necesitas `import 'package:flutter_const/constants/app_ui.dart'`
/// 2. **Elevaciones**: Sigue Material Design para consistencia
/// 3. **Opacidades**: Usa valores de texto para cumplir WCAG (accesibilidad)
/// 4. **Breakpoints**: Considera orientación del dispositivo también
/// 5. **Aspect Ratios**: Útil con `FittedBox` y `Image.fit`
///
/// ### ✅ Ventajas
///
/// - **Conveniencia**: Acceso rápido sin recordar qué importar
/// - **Descubribilidad**: IDE autocomplete muestra todas las opciones
/// - **Consistencia**: Valores estandarizados en toda la app
/// - **Accesibilidad**: Valores optimizados para WCAG
/// - **Responsive**: Breakpoints predefinidos
///
/// ### 🔗 Ver también
///
/// - [AppSizes] para todos los valores base y escalas completas
/// - [AppSpacing] para padding, margin y gaps
/// - [AppRadius] para border radius
/// - [AppFontSizes] para tipografía
///
/// ### 📚 Referencias
///
/// - [Material Design - Elevation](https://material.io/design/environment/elevation.html)
/// - [Material Design - States](https://material.io/design/interaction/states.html)
/// - [WCAG - Contrast Guidelines](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
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
