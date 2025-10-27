/// Sistema de duraciones para animaciones, transiciones y delays
///
/// Este módulo proporciona duraciones estandarizadas siguiendo las mejores
/// prácticas de UX y Material Design Motion para garantizar animaciones
/// fluidas, naturales y consistentes en toda la aplicación.
///
/// ## 🆕 API Recomendada (Nueva)
///
/// ```dart
/// // Duraciones base - para animaciones generales
/// AnimatedContainer(
///   duration: Consts.durations.base.md,  // 300ms - Estándar
///   curve: Curves.easeInOut,
///   child: MyWidget(),
/// )
///
/// // Duraciones por feature - casos de uso específicos
/// Timer(Consts.durations.feat.searchDebounce, () => search());
/// Tooltip(waitDuration: Consts.durations.feat.tooltipDelay);
/// ```
///
/// ## 🔄 API Legacy (Compatible)
///
/// ```dart
/// // Sigue funcionando para mantener compatibilidad
/// AnimatedContainer(duration: AppDurations.md);
/// Timer(AppDurations.searchDebounce, callback);
/// ```
///
/// ## ⏱️ Filosofía de Timing
///
/// Las duraciones están diseñadas según principios de motion design:
///
/// - **Ultra rápidas** (50-150ms): Feedback inmediato, no bloquean la UI
/// - **Rápidas** (200-400ms): Balance ideal velocidad/claridad ⭐
/// - **Moderadas** (500-800ms): Transiciones importantes, estados destacados
/// - **Extendidas** (1000-3000ms): Loading, notificaciones, efectos especiales
///
/// ## 📏 Escala de Duraciones Base
///
/// | Nombre | Duración | Uso Principal |
/// |--------|----------|---------------|
/// | `xxs`  | 50ms     | Hover sutiles, ripples instantáneos |
/// | `xs`   | 100ms    | Cambios de estado, toggles |
/// | `sm`   | 150ms    | Navegación, transiciones de página |
/// | `smd`  | 200ms    | Fade, ripples, micro-interacciones ⭐ |
/// | `mds`  | 250ms    | Expansión cards, slides suaves |
/// | `md`   | 300ms    | Animaciones estándar ⭐⭐⭐ |
/// | `mdl`  | 350ms    | Transformaciones complejas |
/// | `lg`   | 400ms    | Hero animations, layouts importantes |
/// | `xl`   | 500ms    | Onboarding, efectos especiales |
/// | `xxl`  | 600ms    | Animaciones de celebración |
/// | `xxxl` | 800ms    | Secuencias complejas |
/// | `huge` | 1000ms   | Progress indicators, loading cycles |
/// | `massive` | 1500ms | Shimmer effects, skeleton screens |
/// | `giant` | 2000ms  | Snackbars, toasts, notificaciones |
/// | `mega` | 3000ms   | Mensajes importantes con acciones |
///
/// ## 🎯 Duraciones por Feature
///
/// | Nombre | Duración | Descripción |
/// |--------|----------|-------------|
/// | `searchDebounce` | 300ms | Debounce de búsqueda |
/// | `filterDebounce` | 400ms | Debounce de filtros |
/// | `quickDebounce` | 200ms | Validación en tiempo real |
/// | `tooltipDelay` | 500ms | Delay antes de mostrar tooltip |
/// | `snackbarDuration` | 2000ms | Tiempo visible del snackbar |
/// | `pageTransition` | 150ms | Transición entre páginas |
/// | `hoverEffect` | 100ms | Hover en botones/cards |
/// | `rippleEffect` | 200ms | Material ripple |
/// | `shimmerAnimation` | 1500ms | Skeleton loading |
/// | `apiSimulatedDelay` | 1500ms | Mock API delay |
///
/// ## 💡 Guía de Selección Rápida
///
/// **Por tipo de animación:**
/// ```dart
/// // Micro-interacciones → xxs a smd (50-200ms)
/// MouseRegion(onEnter: ..., duration: Consts.durations.base.xs);
///
/// // UI transitions → smd a md (200-300ms) ⭐
/// AnimatedContainer(duration: Consts.durations.base.md);
///
/// // Transiciones importantes → lg a xl (400-500ms)
/// Hero(transitionDuration: Consts.durations.base.lg);
///
/// // Estados de carga → huge a massive (1000-1500ms)
/// shimmer.repeat(period: Consts.durations.base.massive);
/// ```
///
/// **Por complejidad:**
/// - 1 propiedad → `smd` (200ms)
/// - 2-3 propiedades → `md` (300ms) ⭐
/// - 4+ propiedades → `lg` (400ms)
///
/// **Por distancia visual:**
/// - Pequeña (< 20px) → `smd` a `md` (200-300ms)
/// - Mediana (20-100px) → `md` a `lg` (300-400ms)
/// - Grande (> 100px) → `lg` a `xl` (400-500ms)
///
/// ## 🎬 Combinación con Curves
///
/// ```dart
/// // Entrada (aparece)
/// AnimatedContainer(
///   duration: Consts.durations.base.md,
///   curve: Curves.easeOut,  // Desacelera al final
/// )
///
/// // Salida (desaparece)
/// AnimatedContainer(
///   duration: Consts.durations.base.smd,  // Más rápido
///   curve: Curves.easeIn,  // Acelera al final
/// )
///
/// // Bidireccional
/// AnimatedContainer(
///   duration: Consts.durations.base.md,
///   curve: Curves.easeInOut,  // Suave en ambos extremos
/// )
///
/// // Con bounce
/// AnimatedContainer(
///   duration: Consts.durations.base.lg,  // Más largo
///   curve: Curves.elasticOut,
/// )
/// ```
///
/// ## ♿ Accesibilidad
///
/// ```dart
/// Duration getAnimationDuration(BuildContext context) {
///   final reduceMotion = MediaQuery.of(context).disableAnimations;
///   return reduceMotion ? Duration.zero : Consts.durations.base.md;
/// }
/// ```
///
/// ## ❌ Anti-patrones
///
/// ```dart
/// // ❌ Duraciones arbitrarias
/// AnimatedContainer(duration: Duration(milliseconds: 273));
///
/// // ✅ Usa duraciones predefinidas
/// AnimatedContainer(duration: Consts.durations.base.md);
///
/// // ❌ Animaciones muy lentas en UI frecuente
/// AnimatedOpacity(duration: Duration(seconds: 2));
///
/// // ✅ Duraciones apropiadas al contexto
/// AnimatedOpacity(duration: Consts.durations.base.smd);
/// ```
///
/// ## 📚 Referencias
///
/// - [Material Design - Motion](https://m3.material.io/styles/motion)
/// - [Material Design - Duration](https://m3.material.io/styles/motion/easing-and-duration/duration)
/// - [Flutter Animation Docs](https://docs.flutter.dev/ui/animations)
library app_durations;

/// Duraciones base del sistema de diseño
///
/// Proporciona una escala completa de duraciones optimizadas para animaciones
/// y transiciones siguiendo Material Design Motion y principios UX.
///
/// **Acceso:**
/// ```dart
/// Consts.durations.base.md  // 300ms - Estándar recomendado
/// Consts.durations.base.lg  // 400ms - Transiciones lentas
/// ```
///
/// **Características:**
/// - Duraciones consistentes basadas en múltiplos de 50ms
/// - Optimizadas para percepción humana y fluidez
/// - Rango: 50ms (micro) a 3000ms (extendidas)
///
/// Ver también: [FeatDurations] para duraciones especializadas
class BaseDurations {
  const BaseDurations._();

  /// 50ms - Ultra rápido, casi imperceptible
  ///
  /// Uso: Hover sutiles, ripple instantáneos, feedback táctil
  ///
  /// ```dart
  /// AnimatedOpacity(
  ///   duration: Consts.durations.base.xxs,
  ///   opacity: isHovered ? 0.8 : 1.0,
  /// )
  /// ```
  final xxs = const Duration(milliseconds: 50);

  /// 100ms - Extra rápido, cambios de estado inmediatos
  ///
  /// Uso: Hover effects, toggles, checkboxes, cambios de color
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.xs,
  ///   color: isPressed ? Colors.blue.shade700 : Colors.blue,
  /// )
  /// ```
  ///
  /// Recomendado por Material Design para micro-interacciones
  final xs = const Duration(milliseconds: 100);

  /// 150ms - Muy rápido, micro-interacciones y navegación
  ///
  /// Uso: Transiciones de página, modals, dialogs, tab switching
  ///
  /// ```dart
  /// PageRouteBuilder(
  ///   transitionDuration: Consts.durations.base.sm,
  ///   pageBuilder: (context, animation, _) => FadeTransition(...),
  /// )
  /// ```
  ///
  /// Balance perfecto entre velocidad y claridad para navegación
  final sm = const Duration(milliseconds: 150);

  /// 200ms - Rápido, estándar para micro-interacciones ⭐
  ///
  /// Uso: Fade in/out, ripples, snackbar, tooltip, switches
  ///
  /// ```dart
  /// AnimatedOpacity(
  ///   duration: Consts.durations.base.smd,
  ///   opacity: isVisible ? 1.0 : 0.0,
  /// )
  /// ```
  ///
  /// Duración estándar Material Design para la mayoría de componentes
  final smd = const Duration(milliseconds: 200);

  /// 250ms - Mediano rápido, transiciones suaves
  ///
  /// Uso: Expansión de cards, reordenamiento, slides, hero animations cortas
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.mds,
  ///   height: isExpanded ? 200 : 100,
  /// )
  /// ```
  final mds = const Duration(milliseconds: 250);

  /// 300ms - Mediano, duración estándar recomendada ⭐⭐⭐
  ///
  /// Uso: AnimatedContainer general, cambios de tamaño/posición, rotaciones,
  /// expansión de menús, drawer, mayoría de transiciones UI
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.md,
  ///   curve: Curves.easeInOut,
  ///   width: isExpanded ? 300 : 100,
  ///   color: isActive ? Colors.blue : Colors.grey,
  /// )
  /// ```
  ///
  /// **Esta es LA duración estándar. Si tienes dudas, usa esta.**
  /// Balance perfecto entre velocidad, claridad y naturalidad
  final md = const Duration(milliseconds: 300);

  /// 350ms - Mediano lento, transiciones más perceptibles
  ///
  /// Uso: Animaciones que requieren atención, transformaciones complejas,
  /// cambios de estado importantes
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.mdl,
  ///   transform: Matrix4.rotationZ(isRotated ? pi : 0),
  /// )
  /// ```
  final mdl = const Duration(milliseconds: 350);

  /// 400ms - Lento, animaciones deliberadas
  ///
  /// Uso: Expansión de listas, cambios de layout importantes, hero animations,
  /// transformaciones 3D
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.lg,
  ///   height: isExpanded ? 500 : 0,
  ///   transform: Matrix4.rotationY(isFlipped ? pi : 0),
  /// )
  /// ```
  ///
  /// Máxima duración recomendada para interacciones frecuentes
  final lg = const Duration(milliseconds: 400);

  /// 500ms - Extra lento, transiciones importantes
  ///
  /// Uso: Onboarding, first-time UX, tutoriales, efectos especiales,
  /// animaciones con elastic/bounce curves
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.xl,
  ///   curve: Curves.elasticOut,
  ///   height: showWelcome ? 300 : 0,
  /// )
  /// ```
  ///
  /// ⚠️ Evita para interacciones frecuentes (puede frustrar)
  final xl = const Duration(milliseconds: 500);

  /// 600ms - Extra extra lento, animaciones destacadas
  ///
  /// Uso: Efectos dramáticos, animaciones de celebración, transiciones
  /// de estados críticos
  ///
  /// ```dart
  /// TweenAnimationBuilder<double>(
  ///   duration: Consts.durations.base.xxl,
  ///   curve: Curves.elasticOut,
  ///   builder: (_, value, __) => Transform.scale(scale: value, ...),
  /// )
  /// ```
  final xxl = const Duration(milliseconds: 600);

  /// 800ms - Muy lento, animaciones complejas
  ///
  /// Uso: Secuencias complejas, parallax, revelación gradual
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.xxxl,
  ///   curve: Curves.elasticInOut,
  ///   transform: complexTransform,
  /// )
  /// ```
  ///
  /// ⚠️ Solo para animaciones ocasionales de gran importancia
  final xxxl = const Duration(milliseconds: 800);

  /// 1000ms (1 segundo) - Loading states y progress
  ///
  /// Uso: Progress indicators cíclicos, loading spinners, ciclos de actualización
  ///
  /// ```dart
  /// // Repetir cada segundo
  /// _controller.repeat(period: Consts.durations.base.huge);
  /// ```
  final huge = const Duration(milliseconds: 1000);

  /// 1500ms (1.5 segundos) - Shimmer y animaciones largas
  ///
  /// Uso: Shimmer loading (skeleton screens), efectos de onda, API mocking
  ///
  /// ```dart
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.massive,
  ///   decoration: BoxDecoration(gradient: shimmerGradient),
  /// )
  /// ```
  final massive = const Duration(milliseconds: 1500);

  /// 2000ms (2 segundos) - Notificaciones y toasts
  ///
  /// Uso: Duración visible de snackbars, toasts, mensajes temporales
  ///
  /// ```dart
  /// ScaffoldMessenger.of(context).showSnackBar(
  ///   SnackBar(
  ///     content: Text('Operación exitosa'),
  ///     duration: Consts.durations.base.giant,
  ///   ),
  /// )
  /// ```
  final giant = const Duration(milliseconds: 2000);

  /// 3000ms (3 segundos) - Mensajes importantes
  ///
  /// Uso: Mensajes importantes, snackbars con acciones (undo/retry),
  /// notificaciones críticas
  ///
  /// ```dart
  /// SnackBar(
  ///   content: Text('Cambios guardados'),
  ///   action: SnackBarAction(label: 'DESHACER', onPressed: undo),
  ///   duration: Consts.durations.base.mega,
  /// )
  /// ```
  final mega = const Duration(milliseconds: 3000);
}

/// Duraciones específicas por caso de uso (features)
///
/// Duraciones pre-calibradas para casos de uso comunes en aplicaciones
/// siguiendo mejores prácticas de UX.
///
/// **Acceso:**
/// ```dart
/// Timer(Consts.durations.feat.searchDebounce, () => search());
/// Tooltip(waitDuration: Consts.durations.feat.tooltipDelay);
/// SnackBar(duration: Consts.durations.feat.snackbarDuration);
/// ```
///
/// Ver también: [BaseDurations] para duraciones de escala general
class FeatDurations {
  const FeatDurations._();

  /// 300ms - Debounce óptimo para búsqueda
  ///
  /// Balance entre precisión (evita llamadas excesivas) y respuesta rápida
  ///
  /// ```dart
  /// Timer? _debounce;
  /// void onSearchChanged(String query) {
  ///   _debounce?.cancel();
  ///   _debounce = Timer(Consts.durations.feat.searchDebounce, () {
  ///     performSearch(query);
  ///   });
  /// }
  /// ```
  final searchDebounce = const Duration(milliseconds: 300);

  /// 400ms - Debounce para filtros
  ///
  /// Menos sensible que búsqueda, permite ajustes antes de aplicar
  ///
  /// ```dart
  /// Timer(Consts.durations.feat.filterDebounce, () => applyFilters());
  /// ```
  final filterDebounce = const Duration(milliseconds: 400);

  /// 200ms - Debounce rápido para validación en tiempo real
  ///
  /// Feedback casi inmediato para validación de formularios
  ///
  /// ```dart
  /// Timer(Consts.durations.feat.quickDebounce, () => validateEmail());
  /// ```
  final quickDebounce = const Duration(milliseconds: 200);

  /// 500ms - Delay antes de mostrar tooltip
  ///
  /// Evita tooltips molestos en movimientos rápidos del cursor
  ///
  /// ```dart
  /// Tooltip(
  ///   waitDuration: Consts.durations.feat.tooltipDelay,
  ///   message: 'Información útil',
  /// )
  /// ```
  final tooltipDelay = const Duration(milliseconds: 500);

  /// 2000ms - Duración visible de snackbars/toasts
  ///
  /// Tiempo suficiente para leer un mensaje corto (≈8 palabras)
  ///
  /// ```dart
  /// ScaffoldMessenger.of(context).showSnackBar(
  ///   SnackBar(
  ///     content: Text('Operación exitosa'),
  ///     duration: Consts.durations.feat.snackbarDuration,
  ///   ),
  /// )
  /// ```
  final snackbarDuration = const Duration(milliseconds: 2000);

  /// 150ms - Transición entre páginas/rutas
  ///
  /// Rápida para no bloquear navegación, suficiente para claridad
  ///
  /// ```dart
  /// PageRouteBuilder(
  ///   transitionDuration: Consts.durations.feat.pageTransition,
  ///   pageBuilder: (context, animation, _) => NextPage(),
  /// )
  /// ```
  final pageTransition = const Duration(milliseconds: 150);

  /// 100ms - Hover effects en botones/cards
  ///
  /// Feedback instantáneo al pasar el cursor
  ///
  /// ```dart
  /// MouseRegion(
  ///   onEnter: (_) => setState(() => isHovered = true),
  ///   child: AnimatedContainer(
  ///     duration: Consts.durations.feat.hoverEffect,
  ///     color: isHovered ? hoverColor : normalColor,
  ///   ),
  /// )
  /// ```
  final hoverEffect = const Duration(milliseconds: 100);

  /// 200ms - Ripple effect (Material Design)
  ///
  /// Duración estándar del efecto ripple en Material
  ///
  /// ```dart
  /// InkWell(
  ///   splashFactory: InkRipple.splashFactory,
  ///   // Usa internamente esta duración
  /// )
  /// ```
  final rippleEffect = const Duration(milliseconds: 200);

  /// 1500ms - Animación shimmer para skeleton screens
  ///
  /// Ciclo completo del efecto shimmer durante carga
  ///
  /// ```dart
  /// _controller.repeat(period: Consts.durations.feat.shimmerAnimation);
  /// ```
  final shimmerAnimation = const Duration(milliseconds: 1500);

  /// 1500ms - Delay simulado para APIs en modo mock/desarrollo
  ///
  /// Simula latencia de red en desarrollo
  ///
  /// ```dart
  /// await Future.delayed(Consts.durations.feat.apiSimulatedDelay);
  /// return mockData;
  /// ```
  final apiSimulatedDelay = const Duration(milliseconds: 1500);
}

/// Sistema de duraciones con acceso organizado
///
/// Proporciona acceso a duraciones base y específicas por feature
/// a través de `Consts.durations`.
///
/// **Uso:**
/// ```dart
/// // Duraciones base (escala general)
/// AnimatedContainer(duration: Consts.durations.base.md);
///
/// // Duraciones por feature (casos específicos)
/// Timer(Consts.durations.feat.searchDebounce, callback);
/// ```
class AppDurationsSystem {
  /// Duraciones base (escala xxs → mega)
  BaseDurations get base => const BaseDurations._();

  /// Duraciones específicas por feature
  FeatDurations get feat => const FeatDurations._();
}

/// API Legacy - Clase de compatibilidad
///
/// Esta clase mantiene la API histórica para no romper código existente.
/// **Para nuevo código, usa la nueva API: `Consts.durations.base.*` y
/// `Consts.durations.feat.*`**
///
/// **Migración rápida:**
/// ```dart
/// // Antes (legacy)
/// AppDurations.md
/// AppDurations.searchDebounce
///
/// // Ahora (recomendado)
/// Consts.durations.base.md
/// Consts.durations.feat.searchDebounce
/// ```
class AppDurations {
  AppDurations._();

  // ==================== Duraciones Base ====================

  /// 50ms - Ultra rápido
  static const xxs = Duration(milliseconds: 50);

  /// 100ms - Extra rápido
  static const xs = Duration(milliseconds: 100);

  /// 150ms - Muy rápido
  static const sm = Duration(milliseconds: 150);

  /// 200ms - Rápido ⭐
  static const smd = Duration(milliseconds: 200);

  /// 250ms - Mediano rápido
  static const mds = Duration(milliseconds: 250);

  /// 300ms - Mediano (estándar recomendado) ⭐⭐⭐
  static const md = Duration(milliseconds: 300);

  /// 350ms - Mediano lento
  static const mdl = Duration(milliseconds: 350);

  /// 400ms - Lento
  static const lg = Duration(milliseconds: 400);

  /// 500ms - Extra lento
  static const xl = Duration(milliseconds: 500);

  /// 600ms - Extra extra lento
  static const xxl = Duration(milliseconds: 600);

  /// 800ms - Muy lento
  static const xxxl = Duration(milliseconds: 800);

  /// 1000ms (1s) - Enorme
  static const huge = Duration(milliseconds: 1000);

  /// 1500ms (1.5s) - Masivo
  static const massive = Duration(milliseconds: 1500);

  /// 2000ms (2s) - Gigante
  static const giant = Duration(milliseconds: 2000);

  /// 3000ms (3s) - Mega
  static const mega = Duration(milliseconds: 3000);

  // ==================== Duraciones por Feature ====================

  /// 300ms - Debounce para búsqueda
  static const searchDebounce = md;

  /// 400ms - Debounce para filtros
  static const filterDebounce = lg;

  /// 200ms - Debounce rápido (validación)
  static const quickDebounce = smd;

  /// 500ms - Delay de tooltips
  static const tooltipDelay = xl;

  /// 2000ms - Duración visible de snackbars
  static const snackbarDuration = giant;

  /// 150ms - Transición de página
  static const pageTransition = sm;

  /// 100ms - Hover effects
  static const hoverEffect = xs;

  /// 200ms - Ripple effects (Material)
  static const rippleEffect = smd;

  /// 1500ms - Shimmer animation (skeleton loading)
  static const shimmerAnimation = massive;

  /// 1500ms - API simulated delay (mock/desarrollo)
  static const apiSimulatedDelay = massive;

  // ==================== Aliases Legacy (Deprecated) ====================

  /// @deprecated Usa [xs]
  @Deprecated('Usa AppDurations.xs')
  static const ultraFast = xs;

  /// @deprecated Usa [smd]
  @Deprecated('Usa AppDurations.smd')
  static const fast = smd;

  /// @deprecated Usa [md]
  @Deprecated('Usa AppDurations.md')
  static const medium = md;

  /// @deprecated Usa [lg]
  @Deprecated('Usa AppDurations.lg')
  static const slow = lg;

  /// @deprecated Usa [xxxl]
  @Deprecated('Usa AppDurations.xxxl')
  static const verySlow = xxxl;
}
