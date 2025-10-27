# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

