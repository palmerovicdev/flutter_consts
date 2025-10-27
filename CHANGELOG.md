# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.1] - 2025-10-28
### Fixed
- Corrección menor en la documentación del paquete

## [2.0.0] - 2025-10-27

### Added
- **Sistema tipográfico completo** - `AppFontSizes` con múltiples escalas
  - Extension method `getResponsiveFontSize()` en BuildContext para tamaños responsive
  - Constantes predefinidas: Display, Headline, Title, Body, Label, Caption
  - Presets de tamaños: tiny, small, normal, large, extraLarge
  - Soporte para interpolación de tamaños entre diferentes dispositivos
- **Aplicación de ejemplo mejorada** con 6 pantallas completas
  - Nueva pantalla **Overview** con resumen general del sistema
  - Nueva pantalla **Fonts** con demostración del sistema tipográfico
  - Pantallas mejoradas: Spacing, Radius, Sizes, Animations
  - Navegación adaptativa (NavigationRail en desktop, BottomNavigationBar en móvil)
- **Sistema de diseño responsive**
  - Utilidades responsive en `core/utils/responsive.dart`
  - Widget `ResponsiveLayout` para layouts adaptativos
  - Breakpoints: Mobile (<600px), Tablet (600-1239px), Desktop (≥1240px)
- **Material Design 3** - Tema oscuro moderno
  - ColorScheme personalizado con colores HSL optimizados
  - Soporte completo para estados de interacción (hover, focus, pressed)
  - Cards elevadas con presentación consistente
- **Documentación completa**
  - README actualizado con ejemplos detallados
  - ARCHITECTURE.md con explicación completa de la arquitectura
  - Documentación en código con ejemplos de uso
  - Mejores prácticas y patrones de diseño
- **Soporte SVG** en la app de ejemplo
  - Iconos personalizados con flutter_svg
  - Assets optimizados (github, linkedin, mail)

### Changed
- **BREAKING**: Nombre del paquete de `flutter_consts` a `consts`
- **BREAKING**: Versión mínima de SDK actualizada de ^3.0.0 a ^3.5.0 en la app de ejemplo
- Reorganización de la estructura del proyecto para mejor mantenibilidad
- Mejora en la organización de widgets y screens
- Theme centralizado en `theme/app_theme.dart`
- Mejora en la documentación de todas las constantes

### Enhanced
- `AppSpacing` - Mejoras en la documentación y ejemplos
- `AppRadius` - Más variantes direccionales (top, bottom, left, right)
- `AppSizes` - Nuevas constantes para breakpoints responsivos
- `AppDurations` - Duraciones específicas para UX (searchDebounce, pageTransition)
- `AppUI` - Helpers adicionales para acceso rápido a constantes comunes

### Fixed
- Corrección de inconsistencias en nombres de constantes
- Mejora en el contraste de colores para accesibilidad WCAG AA
- Optimización de tamaños táctiles (mínimo 48dp para elementos interactivos)
- Corrección de bugs en la navegación responsive

### Performance
- Uso extensivo de widgets `const` para mejor rendimiento
- Optimización de rebuilds innecesarios
- Carga eficiente de assets SVG

### Documentation
- README del ejemplo completamente reescrito
- Agregado ARCHITECTURE.md con detalles de implementación
- CHANGELOG_ARQUITECTURA.md para seguimiento de cambios arquitectónicos
- Ejemplos de código mejorados en todos los archivos
- Comentarios detallados en código complejo

## [1.0.0] - 2025-10-26

### Added
- Initial release of flutter_const package
- `AppSizes` - Sistema completo de tamaños y dimensiones
  - Tamaños base (xs, sm, md, lg, xl, xxl, huge, massive)
  - Elevaciones estandarizadas
  - Opacidades predefinidas
- `AppSpacing` - Sistema de espaciado consistente
  - Espaciados horizontales y verticales
  - Padding y margin estandarizados
- `AppRadius` - Sistema de bordes redondeados
  - Radio de borde para diferentes componentes
  - Valores predefinidos (none, xs, sm, md, lg, xl, xxl, full)
- `AppDurations` - Duraciones de animaciones
  - Duraciones estandarizadas para transiciones
  - Valores desde instant hasta ultra-slow
- `AppUI` - Constantes adicionales de UI
  - Delegación a AppSizes para elevaciones
  - Delegación a AppSizes para opacidades
- Export centralizado en `constants.dart` para fácil importación
- Soporte para SDK Dart ^3.0.0 (compatibilidad amplia)
- Documentación completa en código con ejemplos de uso

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

