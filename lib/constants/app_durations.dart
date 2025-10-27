/// Sistema de duraciones para animaciones y delays en toda la aplicación
///
/// Proporciona duraciones estandarizadas para diferentes tipos de animaciones
/// y transiciones, siguiendo las mejores prácticas de UX.
///
/// **Uso básico:**
/// ```dart
/// // Animaciones simples
/// AnimatedContainer(
///   duration: AppDurations.md, // 300ms
///   curve: Curves.easeInOut,
/// );
///
/// // Delays y debouncing
/// Timer(AppDurations.searchDebounce, () {
///   // Ejecutar búsqueda después de 300ms
/// });
///
/// // Snackbars
/// ScaffoldMessenger.of(context).showSnackBar(
///   SnackBar(
///     content: Text('Mensaje'),
///     duration: AppDurations.snackbarDuration,
///   ),
/// );
/// ```
///
/// **Guía de uso:**
/// - `xxs` a `xs` (50-100ms): Micro-interacciones instantáneas
/// - `sm` a `md` (150-300ms): Animaciones estándar (más usadas)
/// - `lg` a `xl` (400-500ms): Transiciones complejas
/// - `xxl+` (600ms+): Animaciones especiales o loading states
class AppDurations {
  AppDurations._();

  // Duraciones de animación base
  /// 50ms - Ultra rápido (hover effects, ripples instantáneos)
  static const xxs = Duration(milliseconds: 50);

  /// 100ms - Extra rápido (cambios de estado rápidos)
  static const xs = Duration(milliseconds: 100);

  /// 150ms - Muy rápido (micro-interacciones)
  static const sm = Duration(milliseconds: 150);

  /// 200ms - Rápido (ideal para micro-interacciones y feedback inmediato)
  static const smd = Duration(milliseconds: 200);

  /// 250ms - Mediano rápido (transiciones suaves)
  static const mds = Duration(milliseconds: 250);

  /// 300ms - Mediano (ideal para la mayoría de animaciones estándar)
  static const md = Duration(milliseconds: 300);

  /// 350ms - Mediano lento (transiciones más perceptibles)
  static const mdl = Duration(milliseconds: 350);

  /// 400ms - Lento (animaciones deliberadas)
  static const lg = Duration(milliseconds: 400);

  /// 500ms - Extra lento (transiciones importantes)
  static const xl = Duration(milliseconds: 500);

  /// 600ms - Extra extra lento (animaciones destacadas)
  static const xxl = Duration(milliseconds: 600);

  /// 800ms - Muy lento (animaciones complejas)
  static const xxxl = Duration(milliseconds: 800);

  /// 1000ms (1 segundo) - Enorme (loading states, progress)
  static const huge = Duration(milliseconds: 1000);

  /// 1500ms (1.5 segundos) - Masivo (animaciones largas)
  static const massive = Duration(milliseconds: 1500);

  /// 2000ms (2 segundos) - Gigante (notificaciones, toasts)
  static const giant = Duration(milliseconds: 2000);

  /// 3000ms (3 segundos) - Mega (mensajes importantes)
  static const mega = Duration(milliseconds: 3000);

  // Delays específicos por feature
  /// 1500ms - Delay simulado para llamadas API en modo mock/desarrollo
  static const apiSimulatedDelay = massive;

  /// 1500ms - Duración de la animación shimmer de carga (skeleton screens)
  static const shimmerAnimation = massive;

  /// 300ms - Debounce para búsqueda (evita llamadas API excesivas al escribir)
  static const searchDebounce = md;

  /// 400ms - Debounce para filtros (tiempo entre cambios de filtro)
  static const filterDebounce = lg;

  /// 200ms - Debounce rápido para inputs simples (validación en tiempo real)
  static const quickDebounce = smd;

  /// 500ms - Timeout para mostrar tooltips (hover delay)
  static const tooltipDelay = xl;

  /// 2000ms - Duración para mostrar snackbars/toasts (tiempo visible)
  static const snackbarDuration = giant;

  /// 150ms - Duración de transición entre páginas/rutas
  static const pageTransition = sm;

  /// 100ms - Duración de hover effects (cambio visual al pasar el cursor)
  static const hoverEffect = xs;

  /// 200ms - Duración de ripple effects (Material Design)
  static const rippleEffect = smd;

  // Nombres legacy (mantener por compatibilidad temporal)
  /// @deprecated Use [xs] instead
  static const ultraFast = xs;

  /// @deprecated Use [smd] instead
  static const fast = smd;

  /// @deprecated Use [md] instead
  static const medium = md;

  /// @deprecated Use [lg] instead
  static const slow = lg;

  /// @deprecated Use [xxxl] instead
  static const verySlow = xxxl;
}
