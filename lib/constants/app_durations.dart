/// Sistema de duraciones para animaciones, transiciones y delays
///
/// [AppDurations] proporciona duraciones estandarizadas siguiendo las mejores
/// prácticas de UX y Material Design Motion. Usar estas duraciones garantiza
/// que las animaciones sean fluidas, naturales y consistentes en toda la app.
///
/// ### ⏱️ Filosofía de Timing
///
/// Las duraciones siguen principios de diseño de movimiento:
/// - **Rápidas** (50-150ms): Feedback inmediato, sin bloquear la UI
/// - **Estándar** (200-400ms): Balance perfecto entre velocidad y claridad
/// - **Lentas** (500-800ms): Transiciones complejas o estados importantes
/// - **Largas** (1000ms+): Loading states, notificaciones, efectos especiales
///
/// ### 📏 Escala de Duraciones
///
/// **Duraciones Base:**
/// - `xxs` (50ms) → Ultra rápido (hover, ripples instantáneos)
/// - `xs` (100ms) → Extra rápido (cambios de estado)
/// - `sm` (150ms) → Muy rápido (micro-interacciones)
/// - `smd` (200ms) → Rápido ⭐ (feedback inmediato)
/// - `mds` (250ms) → Mediano rápido (transiciones suaves)
/// - `md` (300ms) → Mediano ⭐ (animaciones estándar)
/// - `mdl` (350ms) → Mediano lento
/// - `lg` (400ms) → Lento (animaciones deliberadas)
/// - `xl` (500ms) → Extra lento (transiciones importantes)
/// - `xxl` (600ms) → Extra extra lento
/// - `xxxl` (800ms) → Muy lento (animaciones complejas)
///
/// **Duraciones Extendidas:**
/// - `huge` (1000ms / 1s) → Loading states, progress
/// - `massive` (1500ms / 1.5s) → Animaciones largas, shimmer
/// - `giant` (2000ms / 2s) → Notificaciones, toasts
/// - `mega` (3000ms / 3s) → Mensajes importantes
///
/// ### 🎨 Uso Básico
///
/// ```dart
/// // ✅ AnimatedContainer - Transiciones de propiedades
/// AnimatedContainer(
///   duration: AppDurations.md,  // 300ms - Estándar
///   curve: Curves.easeInOut,
///   width: isExpanded ? 200 : 100,
///   color: isActive ? Colors.blue : Colors.grey,
/// )
///
/// // ✅ AnimatedOpacity - Fade in/out
/// AnimatedOpacity(
///   duration: AppDurations.smd,  // 200ms - Rápido
///   opacity: isVisible ? 1.0 : 0.0,
///   child: Widget(),
/// )
///
/// // ✅ PageRouteBuilder - Transiciones de página
/// PageRouteBuilder(
///   transitionDuration: AppDurations.pageTransition,  // 150ms
///   pageBuilder: (context, animation, secondaryAnimation) => NewPage(),
/// )
///
/// // ✅ Hover effects - Feedback inmediato
/// MouseRegion(
///   onEnter: (_) => setState(() => isHovered = true),
///   child: AnimatedContainer(
///     duration: AppDurations.hoverEffect,  // 100ms - Instantáneo
///     color: isHovered ? Colors.blue : Colors.grey,
///   ),
/// )
///
/// // ✅ Debouncing - Evitar llamadas excesivas
/// Timer _debounce;
/// void onSearchChanged(String query) {
///   _debounce?.cancel();
///   _debounce = Timer(AppDurations.searchDebounce, () {  // 300ms
///     performSearch(query);
///   });
/// }
///
/// // ✅ Snackbars - Notificaciones temporales
/// ScaffoldMessenger.of(context).showSnackBar(
///   SnackBar(
///     content: Text('Operación exitosa'),
///     duration: AppDurations.snackbarDuration,  // 2000ms
///   ),
/// )
///
/// // ✅ Tooltips - Delay antes de mostrar
/// Tooltip(
///   waitDuration: AppDurations.tooltipDelay,  // 500ms
///   message: 'Información útil',
/// )
/// ```
///
/// ### 📱 Duraciones por Tipo de Animación
///
/// **Micro-interacciones** (instantáneas):
/// ```dart
/// // Hover effects
/// duration: AppDurations.hoverEffect  // 100ms
///
/// // Ripple effects
/// duration: AppDurations.rippleEffect  // 200ms
///
/// // Toggle switches
/// duration: AppDurations.smd  // 200ms
/// ```
///
/// **Transiciones de UI** (balance velocidad/claridad):
/// ```dart
/// // Cambios de color, tamaño, posición
/// duration: AppDurations.md  // 300ms ⭐ (recomendado)
///
/// // Fade in/out
/// duration: AppDurations.smd  // 200ms
///
/// // Expansión/colapso
/// duration: AppDurations.lg  // 400ms
/// ```
///
/// **Transiciones de página** (rápidas, no bloquear):
/// ```dart
/// // Navegación entre screens
/// duration: AppDurations.pageTransition  // 150ms
///
/// // Modals, dialogs
/// duration: AppDurations.sm  // 150ms
///
/// // Bottom sheets
/// duration: AppDurations.smd  // 200ms
/// ```
///
/// **Estados de carga** (informar espera):
/// ```dart
/// // Skeleton screens, shimmer
/// duration: AppDurations.shimmerAnimation  // 1500ms
///
/// // Progress indicators
/// duration: AppDurations.huge  // 1000ms
///
/// // API simulation (desarrollo)
/// await Future.delayed(AppDurations.apiSimulatedDelay)  // 1500ms
/// ```
///
/// ### 🎯 Duraciones Especializadas
///
/// Estas constantes están optimizadas para casos de uso específicos:
///
/// ```dart
/// // Debouncing de búsqueda
/// AppDurations.searchDebounce       // 300ms - Balance precisión/respuesta
///
/// // Debouncing de filtros
/// AppDurations.filterDebounce       // 400ms - Menos sensible
///
/// // Debouncing rápido (validación)
/// AppDurations.quickDebounce        // 200ms - Feedback rápido
///
/// // Delay de tooltips
/// AppDurations.tooltipDelay         // 500ms - No molesto
///
/// // Duración de snackbars
/// AppDurations.snackbarDuration     // 2000ms - Tiempo de lectura
///
/// // Transiciones de página
/// AppDurations.pageTransition       // 150ms - Rápido, no bloquea
///
/// // Hover effects
/// AppDurations.hoverEffect          // 100ms - Instantáneo
///
/// // Ripple effects (Material)
/// AppDurations.rippleEffect         // 200ms - Estándar Material
///
/// // Shimmer loading
/// AppDurations.shimmerAnimation     // 1500ms - Ciclo completo
///
/// // API simulation (mock)
/// AppDurations.apiSimulatedDelay    // 1500ms - Simular latencia
/// ```
///
/// ### 💡 Guía de Selección
///
/// **Por Distancia Visual:**
/// - Cambios pequeños (< 20px) → `smd` a `md` (200-300ms)
/// - Cambios medianos (20-100px) → `md` a `lg` (300-400ms)
/// - Cambios grandes (> 100px) → `lg` a `xl` (400-500ms)
///
/// **Por Complejidad:**
/// - Una propiedad → `smd` (200ms)
/// - 2-3 propiedades → `md` (300ms) ⭐
/// - 4+ propiedades → `lg` (400ms)
///
/// **Por Importancia:**
/// - Feedback sutil → `xs` a `sm` (100-150ms)
/// - Acción estándar → `smd` a `md` (200-300ms) ⭐
/// - Acción importante → `lg` a `xl` (400-500ms)
///
/// ### 🎬 Combinación con Curves
///
/// Las duraciones funcionan mejor con las curvas apropiadas:
///
/// ```dart
/// // Entrada (elemento aparece)
/// AnimatedContainer(
///   duration: AppDurations.md,
///   curve: Curves.easeOut,  // Desacelera al final
/// )
///
/// // Salida (elemento desaparece)
/// AnimatedContainer(
///   duration: AppDurations.smd,  // Más rápido
///   curve: Curves.easeIn,  // Acelera al final
/// )
///
/// // Bidireccional (va y viene)
/// AnimatedContainer(
///   duration: AppDurations.md,
///   curve: Curves.easeInOut,  // Suave en ambos extremos
/// )
///
/// // Bounce effects
/// AnimatedContainer(
///   duration: AppDurations.lg,
///   curve: Curves.elasticOut,  // Rebote natural
/// )
/// ```
///
/// ### 🚀 Recomendaciones de Performance
///
/// 1. **Prioriza animaciones cortas** (< 300ms) para UI responsive
/// 2. **Evita duraciones > 500ms** para interacciones frecuentes
/// 3. **Usa duraciones consistentes** para componentes similares
/// 4. **Reduce duraciones** en dispositivos de gama baja
/// 5. **Respeta preferencias de accesibilidad** (reduce motion)
///
/// ```dart
/// // Ejemplo: Respetar preferencias de accesibilidad
/// Duration getAnimationDuration(BuildContext context) {
///   final reduceMotion = MediaQuery.of(context).disableAnimations;
///   return reduceMotion ? Duration.zero : AppDurations.md;
/// }
/// ```
///
/// ### ❌ Evitar
///
/// ```dart
/// // ❌ NO uses duraciones arbitrarias
/// AnimatedContainer(duration: Duration(milliseconds: 273))
/// Timer(Duration(milliseconds: 427), callback)
///
/// // ✅ USA duraciones predefinidas
/// AnimatedContainer(duration: AppDurations.md)  // 300ms
/// Timer(AppDurations.searchDebounce, callback)  // 300ms
///
/// // ❌ NO uses animaciones muy lentas para UI frecuente
/// AnimatedOpacity(duration: Duration(seconds: 2))  // Demasiado lento
///
/// // ✅ USA duraciones apropiadas al contexto
/// AnimatedOpacity(duration: AppDurations.smd)  // 200ms - Rápido
/// ```
///
/// ### 🔗 Ver también
///
/// - [AppSizes] para dimensiones consistentes
/// - [Material Motion System](https://material.io/design/motion)
/// - [Flutter Curves](https://api.flutter.dev/flutter/animation/Curves-class.html)
///
/// ### 📚 Referencias
///
/// - [Material Design - Motion](https://material.io/design/motion/speed.html)
/// - [Material Design - Duration](https://material.io/design/motion/speed.html#duration)
/// - [UX in Motion - Timing](https://medium.com/ux-in-motion/creating-usability-with-motion-the-ux-in-motion-manifesto-a87a4584ddc)
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
