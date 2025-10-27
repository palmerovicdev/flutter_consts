/// Sistema de tipografía jerárquica y escalable para Flutter
///
/// Este módulo proporciona un sistema completo de tamaños de fuente basado en
/// escalas geométricas y jerarquías tipográficas, permitiendo crear interfaces
/// consistentes, legibles y profesionales.
///
/// ## 🎯 Componentes Principales
///
/// ### 1. [AppFontSizes] - Sistema de escala configurable
/// Clase principal que genera una jerarquía tipográfica completa basada en:
/// - Un tamaño base (`bodySmall`)
/// - Un factor de escala geométrico
///
/// ### 2. [AppFontSizesConstants] - Valores constantes en tiempo de compilación
/// Valores `const` predefinidos para uso en constructores constantes.
///
/// ### 3. [AppFontSizesPresets] - Configuraciones predefinidas
/// Combinaciones listas para usar de tamaños base + factores de escala.
///
/// ### 4. [AppFontSizesScaleFactors] - Factores de escala disponibles
/// Ratios geométricos para crear diferentes grados de jerarquía visual.
///
/// ### 5. [AppFontSizesExtension] - Tamaños responsivos por contexto
/// Extension en `BuildContext` para calcular tamaños adaptativos.
///
/// ## 📐 Jerarquía Tipográfica
///
/// ```
/// Nivel         Tamaño (14px base × 1.272)   Uso
/// ─────────────────────────────────────────────────────────────
/// display       121.4px                      Hero, splash screens
/// h1            95.4px                       Títulos principales
/// h2            75.0px                       Subtítulos de página
/// h3            59.0px                       Secciones grandes
/// header        46.4px                       Encabezados de sección
/// subheader     36.5px                       Subsecciones
/// paragraphTitle 28.7px                      Títulos de párrafo
/// bodyLarge     22.6px                       Texto destacado
/// body          17.8px                       Texto estándar ⭐
/// bodySmall     14.0px                       Captions, metadata
/// ```
///
/// ## 🚀 Inicio Rápido
///
/// ### Uso Básico (Valores Constantes)
/// ```dart
/// // Para constructores const y valores por defecto
/// Text(
///   'Hello World',
///   style: TextStyle(fontSize: AppFontSizesConstants.body), // 17.8px
/// )
/// ```
///
/// ### Uso con Presets (Recomendado)
/// ```dart
/// // Configuración predefinida con escala clara
/// final typography = AppFontSizesPresets.normalLargeScale;
///
/// Text('Title', style: TextStyle(fontSize: typography.h1));
/// Text('Body', style: TextStyle(fontSize: typography.body));
/// ```
///
/// ### Uso Personalizado
/// ```dart
/// // Control total sobre base y escala
/// final customTypography = AppFontSizes(
///   bodySmall: 16,  // Base más grande para accesibilidad
///   scaleFactor: AppFontSizesScaleFactors.large,  // Jerarquía clara
/// );
///
/// Text('Custom', style: TextStyle(fontSize: customTypography.h2));
/// ```
///
/// ### Tamaños Responsivos
/// ```dart
/// // Adaptación automática al tamaño de pantalla
/// Text(
///   'Responsive text',
///   style: TextStyle(
///     fontSize: context.getResponsiveFontSize(
///       smallest: 14,
///       largest: 24,
///     ),
///   ),
/// )
/// ```
///
/// ## 🎨 Factores de Escala
///
/// | Factor | Valor | Jerarquía | Uso Ideal |
/// |--------|-------|-----------|-----------|
/// | `small` | 1.128 | Sutil | Tablas, layouts densos |
/// | `normal` | 1.174 | Balanceada | Material Design |
/// | `large` | 1.272 | Clara | Apps modernas ⭐ |
/// | `extraLarge` | 1.618 | Dramática | Marketing, landing pages |
///
/// ## 📱 Presets Recomendados por Contexto
///
/// ### Mobile Apps
/// ```dart
/// // Estándar (recomendado)
/// AppFontSizesPresets.normalLargeScale  // 14px + clara jerarquía
///
/// // Compacto
/// AppFontSizesPresets.normal  // 14px + jerarquía sutil
///
/// // Accesibilidad
/// AppFontSizesPresets.largeLargeScale  // 16px + clara jerarquía
/// ```
///
/// ### Tablet Apps
/// ```dart
/// // Estándar
/// AppFontSizesPresets.largeLargeScale  // 16px + clara jerarquía
///
/// // Lectura
/// AppFontSizesPresets.extraLargeLargeScale  // 18px + clara jerarquía
/// ```
///
/// ### Desktop Apps
/// ```dart
/// // Tablas/datos
/// AppFontSizesPresets.small  // 12px + jerarquía sutil
///
/// // General
/// AppFontSizesPresets.normalNormalScale  // 14px + jerarquía balanceada
///
/// // Marketing
/// AppFontSizesPresets.normalExtraLargeScale  // 14px + jerarquía dramática
/// ```
///
/// ## 💡 Mejores Prácticas
///
/// ### ✅ Hacer
/// - Usar presets para consistencia
/// - Elegir UN factor de escala por app
/// - Usar `AppFontSizesConstants` en constructores const
/// - Adaptar tamaño base según dispositivo
/// - Combinar con `fontWeight` para énfasis
///
/// ### ❌ Evitar
/// - Mezclar múltiples escalas en la misma app
/// - Crear valores arbitrarios fuera del sistema
/// - Usar tamaños muy pequeños (< 12px) sin razón
/// - Ignorar accesibilidad en apps públicas
///
/// ## ♿ Accesibilidad
///
/// ```dart
/// // Nivel 1: Texto ligeramente más grande
/// final a11yLevel1 = AppFontSizesPresets.largeLargeScale;
///
/// // Nivel 2: Texto significativamente más grande
/// final a11yLevel2 = AppFontSizesPresets.extraLargeLargeScale;
///
/// // Nivel 3: Máxima legibilidad
/// final a11yLevel3 = AppFontSizesPresets.hugeLargeScale;
///
/// // Adaptativo según preferencias del sistema
/// final userScaleFactor = MediaQuery.textScaleFactorOf(context);
/// final fontSize = AppFontSizesConstants.body * userScaleFactor;
/// ```
///
/// ## 🔗 Referencias
///
/// - [Material Design Type Scale](https://m3.material.io/styles/typography/type-scale-tokens)
/// - [Type Scale Generator](https://type-scale.com/)
/// - [Golden Ratio Typography](https://grtcalculator.com/)
///
/// ## Ver También
///
/// - [AppFontSizes] - Clase principal del sistema
/// - [AppFontSizesPresets] - Configuraciones predefinidas
/// - [AppFontSizesConstants] - Valores constantes
/// - [AppFontSizesScaleFactors] - Factores de escala disponibles
library app_font_sizes;

import 'package:flutter/cupertino.dart';

/// Extension en [BuildContext] para calcular tamaños de fuente responsivos.
///
/// Interpola linealmente tamaños de fuente según el ancho de pantalla,
/// permitiendo tipografía que se adapta automáticamente a diferentes dispositivos.
///
/// **Uso:**
/// ```dart
/// Text(
///   'Responsive',
///   style: TextStyle(
///     fontSize: context.getResponsiveFontSize(
///       smallest: 14,
///       largest: 24,
///     ),
///   ),
/// )
/// ```
///
/// **Cuándo usar:**
/// - Texto adaptativo en tablets/desktop
/// - Hero text que escala con dispositivo
/// - Interfaces multi-plataforma
///
/// Ver también: [AppFontSizesPresets] para tamaños fijos
extension AppFontSizesExtension on BuildContext {
  /// Calcula tamaño de fuente responsivo basado en ancho de pantalla.
  ///
  /// Interpola entre [smallest] y [largest] según ancho actual en relación
  /// a [smallestScreenSize] y [largestScreenSize].
  ///
  /// **Parámetros:**
  /// - [smallest]: Tamaño mínimo (default: 12px)
  /// - [largest]: Tamaño máximo (default: 20px)
  /// - [smallestScreenSize]: Ancho para mínimo (default: 320px)
  /// - [largestScreenSize]: Ancho para máximo (default: 1920px)
  ///
  /// **Ejemplo:**
  /// ```dart
  /// // Básico
  /// context.getResponsiveFontSize()
  ///
  /// // Headings
  /// context.getResponsiveFontSize(smallest: 24, largest: 48)
  ///
  /// // Solo tablets (600-1200px)
  /// context.getResponsiveFontSize(
  ///   smallest: 14, largest: 18,
  ///   smallestScreenSize: 600, largestScreenSize: 1200,
  /// )
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
/// Sistema flexible de tipografía con jerarquía escalable geométricamente.
///
/// Genera una escala tipográfica completa basada en un tamaño base ([bodySmall])
/// y un factor de escala geométrico. Cada nivel es el anterior multiplicado
/// por el factor de escala, creando progresión armónica.
///
/// **Jerarquía (10 niveles):**
/// bodySmall < body < bodyLarge < paragraphTitle < subheader < header < h3 < h2 < h1 < display
///
/// **Uso:**
/// ```dart
/// // Instancia personalizada
/// final typography = AppFontSizes(
///   bodySmall: 16,
///   scaleFactor: AppFontSizesScaleFactors.normal,
/// );
///
/// Text('Title', style: TextStyle(fontSize: typography.h1));
/// Text('Body', style: TextStyle(fontSize: typography.body));
/// ```
///
/// **Recomendaciones:**
/// - Usa [AppFontSizesPresets] para configuraciones predefinidas
/// - Usa [AppFontSizesConstants] para valores `const`
/// - Elige UN [scaleFactor] por app para consistencia
/// - Factores disponibles:
///   - `small` (1.128): Denso, compacto
///   - `normal` (1.174): Balanceado, Material Design
///   - `large` (1.272): Clara jerarquía, moderno ⭐
///   - `extraLarge` (1.618): Dramático, marketing
///
/// Ver también: [AppFontSizesPresets], [AppFontSizesScaleFactors]
class AppFontSizes {
  /// Crea un sistema de tipografía con base y escala especificadas.
  ///
  /// **Parámetros:**
  /// - [bodySmall]: Tamaño base en px (default: 14)
  /// - [scaleFactor]: Multiplicador entre niveles (default: 1.272)
  ///
  /// **Ejemplo:**
  /// ```dart
  /// // Por defecto (14px + escala large)
  /// AppFontSizes()
  ///
  /// // Accesibilidad (base más grande)
  /// AppFontSizes(bodySmall: 18)
  ///
  /// // Compacto (base pequeña + escala sutil)
  /// AppFontSizes(
  ///   bodySmall: 12,
  ///   scaleFactor: AppFontSizesScaleFactors.small,
  /// )
  /// ```
  const AppFontSizes({
    double bodySmall = AppFontSizesConstants.bodySmall,
    double scaleFactor = AppFontSizesScaleFactors.large,
  })  : _scaleFactor = scaleFactor,
        _bodySmall = bodySmall;

  final double _bodySmall;
  final double _scaleFactor;

  /// **bodySmall** - Texto más pequeño (base)
  ///
  /// Tamaño: Base (default: 14px)
  ///
  /// Uso: Captions, footnotes, metadata, timestamps, helper text
  double get bodySmall => _bodySmall;

  /// **body** - Texto estándar ⭐
  ///
  /// Tamaño: bodySmall × scaleFactor (~17.8px)
  ///
  /// Uso: Párrafos, listas, inputs, botones
  double get body => bodySmall * _scaleFactor;

  /// **bodyLarge** - Texto destacado
  ///
  /// Tamaño: body × scaleFactor (~22.6px)
  ///
  /// Uso: Lead paragraphs, callouts, citas, texto enfatizado
  double get bodyLarge => body * _scaleFactor;

  /// **paragraphTitle** - Títulos pequeños
  ///
  /// Tamaño: bodyLarge × scaleFactor (~28.7px)
  ///
  /// Uso: Títulos de cards, headers de listas, secciones pequeñas
  double get paragraphTitle => bodyLarge * _scaleFactor;

  /// **subheader** - Subtítulos de sección
  ///
  /// Tamaño: paragraphTitle × scaleFactor (~36.5px)
  ///
  /// Uso: Subsecciones, dialog titles, bottom sheets, tabs grandes
  double get subheader => paragraphTitle * _scaleFactor;

  /// **header** - Encabezados principales
  ///
  /// Tamaño: subheader × scaleFactor (~46.4px)
  ///
  /// Uso: Section headers, app bar titles, navegación principal
  double get header => subheader * _scaleFactor;

  /// **h3** - Heading nivel 3
  ///
  /// Tamaño: header × scaleFactor (~59.0px)
  ///
  /// Uso: Títulos de sección grande, modals, feature headings
  double get h3 => header * _scaleFactor;

  /// **h2** - Heading nivel 2
  ///
  /// Tamaño: h3 × scaleFactor (~75.0px)
  ///
  /// Uso: Subtítulos de página, welcome messages, divisores mayores
  double get h2 => h3 * _scaleFactor;

  /// **h1** - Heading nivel 1
  ///
  /// Tamaño: h2 × scaleFactor (~95.3px)
  ///
  /// Uso: Títulos de página, screen headers, CTAs principales
  double get h1 => h2 * _scaleFactor;

  /// **display** - Texto hero/display
  ///
  /// Tamaño: h1 × scaleFactor (~121.1px)
  ///
  /// Uso: Hero sections, splash screens, onboarding, marketing headers
  ///
  /// ⚠️ Puede requerir reducción en pantallas pequeñas
  double get display => h1 * _scaleFactor;
}

/// Tamaños de fuente constantes (compile-time) con configuración por defecto.
///
/// Valores `const` calculados con base 14px y escala large (1.272).
/// Úsalos cuando necesites expresiones constantes en tiempo de compilación.
///
/// **Cuándo usar:**
/// - ✅ `AppFontSizesConstants`: Constructores const, valores por defecto
/// - ✅ `AppFontSizes`: Configuración runtime, tamaños dinámicos
/// - ✅ `AppFontSizesPresets`: Configuraciones predefinidas listas para usar
///
/// **Ejemplo:**
/// ```dart
/// // ✅ Correcto: const constructor
/// const TextStyle(fontSize: AppFontSizesConstants.body)
///
/// // ✅ Correcto: default parameter
/// Widget buildText({double fontSize = AppFontSizesConstants.body}) {...}
///
/// // ❌ Error: AppFontSizes no es const
/// const TextStyle(fontSize: AppFontSizes().body)  // No compila
/// ```
///
/// Ver también: [AppFontSizes], [AppFontSizesPresets]
class AppFontSizesConstants {
  /// 14.0px - bodySmall (base)
  static const double bodySmall = 14;

  /// 17.8px - body (14 × 1.272)
  static const double body = bodySmall * AppFontSizesScaleFactors.large;

  /// 22.6px - bodyLarge (17.8 × 1.272)
  static const double bodyLarge = body * AppFontSizesScaleFactors.large;

  /// 28.7px - paragraphTitle (22.6 × 1.272)
  static const double paragraphTitle = bodyLarge * AppFontSizesScaleFactors.large;

  /// 36.5px - subheader (28.7 × 1.272)
  static const double subheader = paragraphTitle * AppFontSizesScaleFactors.large;

  /// 46.4px - header (36.5 × 1.272)
  static const double header = subheader * AppFontSizesScaleFactors.large;

  /// 59.0px - h3 (46.4 × 1.272)
  static const double h3 = header * AppFontSizesScaleFactors.large;

  /// 75.0px - h2 (59.0 × 1.272)
  static const double h2 = h3 * AppFontSizesScaleFactors.large;

  /// 95.4px - h1 (75.0 × 1.272)
  static const double h1 = h2 * AppFontSizesScaleFactors.large;

  /// 121.4px - display (95.4 × 1.272)
  static const double display = h1 * AppFontSizesScaleFactors.large;
}

/// Factores de escala predefinidos para jerarquías tipográficas.
///
/// Determinan el ratio de tamaño entre niveles consecutivos.
/// Un factor mayor = mayor distinción visual entre headings.
///
/// **Escalas Disponibles:**
///
/// | Escala | Factor | Jerarquía | Mejor Para |
/// |--------|--------|-----------|------------|
/// | `small` | 1.128 | Sutil | Tablas, UIs densas |
/// | `normal` | 1.174 | Balanceada | Material Design |
/// | `large` | 1.272 | Clara | Apps modernas ⭐ |
/// | `extraLarge` | 1.618 | Dramática | Marketing, landing pages |
///
/// **Comparación Visual (base 14px):**
/// ```
///              display  h1   h2   body
/// small:       42px    37px  33px  14px
/// normal:      59px    51px  43px  14px
/// large:       121px   95px  75px  18px
/// extraLarge:  1064px  657px 406px 23px
/// ```
///
/// **Guía de Selección:**
///
/// - `small` → Información densa, espacio limitado
/// - `normal` → UIs balanceadas, Material Design
/// - `large` → Jerarquía clara, contenido moderno (DEFAULT) ⭐
/// - `extraLarge` → Impacto visual máximo, uso ocasional
///
/// **Ejemplo:**
/// ```dart
/// // Sutil para datos
/// AppFontSizes(bodySmall: 12, scaleFactor: AppFontSizesScaleFactors.small)
///
/// // Dramático para hero
/// AppFontSizes(bodySmall: 16, scaleFactor: AppFontSizesScaleFactors.extraLarge)
/// ```
///
/// Ver también: [Type Scale Calculator](https://type-scale.com/)
class AppFontSizesScaleFactors {
  /// 1.128 (Minor Second) - Jerarquía sutil y compacta
  ///
  /// Uso: Tablas, dashboards densos, admin panels
  ///
  /// Progresión: 12 → 13.5 → 15.2 → 17.2 → 19.4 → 21.9...
  static const double small = 1.1278422438;

  /// 1.174 (Major Second) - Jerarquía balanceada y armónica
  ///
  /// Uso: Material Design, apps general-purpose, forms
  ///
  /// Progresión: 12 → 14.1 → 16.5 → 19.4 → 22.8 → 26.7...
  static const double normal = 1.1739902127;

  /// 1.272 (Minor Third) - Jerarquía clara y legible (DEFAULT) ⭐
  ///
  /// Uso: Apps modernas, contenido, diseños con buena jerarquía
  ///
  /// Progresión: 12 → 15.3 → 19.4 → 24.7 → 31.4 → 40.0...
  static const double large = 1.2720281269;

  /// 1.618 (Golden Ratio) - Jerarquía dramática y impactante
  ///
  /// Uso: Marketing, landing pages, hero sections, alto impacto visual
  ///
  /// Progresión: 12 → 19.4 → 31.4 → 50.8 → 82.2 → 133.0...
  ///
  /// ⚠️ Usar con moderación, puede ser excesivo para UIs regulares
  static const double extraLarge = 1.6180555556;
}

/// Configuraciones predefinidas de tipografía listas para usar.
///
/// Combina diferentes tamaños base (12-20px) con factores de escala (small-extraLarge)
/// para crear configuraciones completas optimizadas para casos de uso comunes.
///
/// **Estructura de nombres:**
/// `[tamaño base][factor de escala (opcional)]`
///
/// **Tamaños base disponibles:**
/// - `small` (12px): Compacto, denso
/// - `normal` (14px): Estándar mobile ⭐
/// - `large` (16px): Legibilidad mejorada
/// - `extraLarge` (18px): Accesibilidad
/// - `huge` (20px): Máxima accesibilidad
///
/// **Variantes de escala (sufijos):**
/// - Sin sufijo: `small` scale (1.128) - jerarquía sutil
/// - `NormalScale`: `normal` scale (1.174) - balanceada
/// - `LargeScale`: `large` scale (1.272) - clara ⭐
/// - `ExtraLargeScale`: `extraLarge` scale (1.618) - dramática
///
/// **Guía Rápida por Contexto:**
///
/// ```dart
/// // Mobile Apps
/// AppFontSizesPresets.normalLargeScale  // ⭐ Recomendado
/// AppFontSizesPresets.normal            // Compacto
/// AppFontSizesPresets.largeLargeScale   // Accesibilidad
///
/// // Tablet Apps
/// AppFontSizesPresets.largeLargeScale
/// AppFontSizesPresets.extraLargeLargeScale  // Lectura
///
/// // Desktop Apps
/// AppFontSizesPresets.small              // Datos densos
/// AppFontSizesPresets.normalNormalScale  // General
/// AppFontSizesPresets.normalExtraLargeScale  // Marketing
/// ```
///
/// **Ejemplo de Uso:**
/// ```dart
/// // Configuración basada en preferencia del usuario
/// final typography = switch (userPreference) {
///   'small' => AppFontSizesPresets.normal,
///   'medium' => AppFontSizesPresets.normalLargeScale,
///   'large' => AppFontSizesPresets.largeLargeScale,
///   'extraLarge' => AppFontSizesPresets.extraLargeLargeScale,
///   _ => AppFontSizesPresets.normalLargeScale,
/// };
///
/// Text('Title', style: TextStyle(fontSize: typography.h1));
/// ```
///
/// Ver también: [AppFontSizes], [AppFontSizesScaleFactors]
class AppFontSizesPresets {
  // ============ SMALL BASE (12px) ============

  /// 12px + sutil (1.128)
  ///
  /// Uso: Tablas densas, admin panels, dashboards con mucha información
  static final small = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// 12px + balanceada (1.174)
  ///
  /// Uso: Mobile compacto, settings con muchas opciones, forms limitados
  static final smallNormalScale = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// 12px + clara (1.272)
  ///
  /// Uso: UIs compactas con jerarquía clara, mobile small screens
  static final smallLargeScale = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// 12px + dramática (1.618)
  ///
  /// Uso: Diseños minimalistas, landing pages con body pequeño
  static final smallExtraLargeScale = AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  // ============ NORMAL BASE (14px) - ESTÁNDAR MOBILE ============

  /// 14px + sutil (1.128) - DEFAULT
  ///
  /// Uso: Apps mobile estándar, muchos elementos de texto, layouts densos
  static final normal = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  /// 14px + balanceada (1.174)
  ///
  /// Uso: Material Design, apps general-purpose, forms, settings
  static final normalNormalScale = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  /// 14px + clara (1.272) ⭐ RECOMENDADO
  ///
  /// Uso: Apps modernas, contenido-focused, secciones claras
  static final normalLargeScale = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  /// 14px + dramática (1.618)
  ///
  /// Uso: Marketing apps, hero sections, onboarding, landing pages
  static final normalExtraLargeScale = AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  // ============ LARGE BASE (16px) - LEGIBILIDAD MEJORADA ============

  /// 16px + sutil (1.128)
  ///
  /// Uso: Reading apps, contenido denso pero legible, tablets
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

class BaseFontSizesPresets {
  const BaseFontSizesPresets._();

  final AppFontSizes sFSS = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes sFNS = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes sFLS = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes sFXLS = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  final AppFontSizes nFSS = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes nFNS = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes nFLS = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes nFXLS = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  final AppFontSizes lFSS = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes lFNS = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes lFLS = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes lFXLS = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  final AppFontSizes xLFSS = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes xLFNS = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes xLFLS = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes xLFXLS = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  final AppFontSizes hFSS = const AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes hFNS = const AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes hFLS = const AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes hFXLS = const AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );
}

class DeviceFontSizesPresets {
  const DeviceFontSizesPresets._();

  final AppFontSizes mobile = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes mobileComfortable = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes mobileCompact = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes tablet = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes tabletReading = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes desktop = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes desktopReading = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.large,
  );

  final AppFontSizes desktopMarketing = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.extraLarge,
  );

  final AppFontSizes desktopCompact = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );
}

class ComponentsFontSizesPresets {
  const ComponentsFontSizesPresets._();

  final AppFontSizes buttonMobile = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes buttonTablet = const AppFontSizes(
    bodySmall: 17,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes buttonDesktop = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes buttonSmall = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes buttonLarge = const AppFontSizes(
    bodySmall: 18,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes captionMobile = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes captionTablet = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes captionDesktop = const AppFontSizes(
    bodySmall: 15,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes captionEmphasis = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes formLabelMobile = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes formLabelTablet = const AppFontSizes(
    bodySmall: 17,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes formLabelDesktop = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes formHint = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes overlineStandard = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes overlineLarge = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes navigationMenu = const AppFontSizes(
    bodySmall: 15,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes tabLabel = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes notification = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes badge = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes listItemTitle = const AppFontSizes(
    bodySmall: 16,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes listItemSubtitle = const AppFontSizes(
    bodySmall: 14,
    scaleFactor: AppFontSizesScaleFactors.small,
  );

  final AppFontSizes dialogTitle = const AppFontSizes(
    bodySmall: 20,
    scaleFactor: AppFontSizesScaleFactors.normal,
  );

  final AppFontSizes tooltip = const AppFontSizes(
    bodySmall: 12,
    scaleFactor: AppFontSizesScaleFactors.small,
  );
}

class FontSizesSystem {
  BaseFontSizesPresets get base => const BaseFontSizesPresets._();
  DeviceFontSizesPresets get device => const DeviceFontSizesPresets._();
  ComponentsFontSizesPresets get components => const ComponentsFontSizesPresets._();
}
