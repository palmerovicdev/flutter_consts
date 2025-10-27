# Consts - Example App 🎨

Una aplicación de ejemplo completa y moderna que demuestra el uso del paquete **consts** (flutter_const) para mantener consistencia visual en aplicaciones Flutter.

## 🎯 Sobre esta App

Esta aplicación de ejemplo muestra todas las constantes y sistemas de diseño disponibles en el paquete:

- **AppSpacing**: Sistema completo de espaciado, padding y gaps
- **AppRadius**: Border radius, shapes y variantes direccionales
- **AppSizes**: Tamaños base, iconos, avatares, elevaciones y opacidades
- **AppFonts**: Sistema tipográfico completo con diferentes escalas
- **AppDurations**: Duraciones de animaciones y transiciones
- **AppUI**: Acceso rápido a constantes comunes y helpers

## 📱 Características de la App

La app contiene **6 secciones principales** con ejemplos interactivos:

### 1. **Overview** 📊
Visión general del sistema de diseño con acceso rápido a todas las constantes

### 2. **Spacing** 📐
- Padding uniforme, horizontal y vertical
- Gaps verticales y horizontales
- Ejemplos de uso en layouts reales
- Sistema completo de espaciado de `none` a `massive`

### 3. **Radius** ⭕
- Border radius completos y direccionales
- Shapes para botones y componentes
- Variantes de top, bottom, left y right
- Desde `none` hasta `circular`

### 4. **Sizes** 📏
- Tamaños de iconos (Material Design)
- Avatares de diferentes tamaños
- Elevaciones para Material Design
- Opacidades estándar
- Breakpoints responsivos

### 5. **Fonts** 🔤
- Sistema tipográfico completo
- Diferentes escalas: Display, Headline, Title, Body, Label
- Pesos de fuente y estilos
- Ejemplos de jerarquía visual

### 6. **Animations** 🎬
- Duraciones predefinidas de animaciones
- Ejemplos de AnimatedContainer
- Transiciones de página
- Duraciones específicas para UX (debounce, snackbar, etc.)

## 🖼️ Capturas de Pantalla

La aplicación demuestra visualmente cada uno de los sistemas de diseño:

- **Vista Desktop**: Navegación con NavigationRail lateral para pantallas grandes
- **Vista Móvil**: Bottom NavigationBar para facilitar el acceso en dispositivos móviles
- **Tema Oscuro**: Diseño moderno con Material Design 3
- **Responsive**: Se adapta automáticamente a diferentes tamaños de pantalla

> **Nota**: La app incluye ejemplos interactivos que permiten ver en tiempo real cómo cada constante afecta el diseño de los componentes.

## 🚀 Ejecutar la App

### Prerrequisitos

- Flutter SDK **3.5.0** o superior
- Dart SDK **3.5.0** o superior

### Instalación y Ejecución

1. **Clona el repositorio** o descarga el paquete
   ```bash
   git clone <repository-url>
   cd flutter_const/example
   ```

2. **Instala las dependencias**:
   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**:
   
   Para desarrollo:
   ```bash
   flutter run
   ```
   
   Para web:
   ```bash
   flutter run -d chrome
   ```
   
   Para seleccionar dispositivo específico:
   ```bash
   flutter devices  # Lista dispositivos disponibles
   flutter run -d <device-id>
   ```

### Plataformas Soportadas

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Linux
- ✅ Windows

## 💡 Cómo Usar las Constantes

### Importar el Paquete

```dart
import 'package:consts/flutter_const.dart';
```

### Ejemplos de Uso

#### Spacing

```dart
// Padding uniforme
Padding(
  padding: AppSpacing.paddingLg, // EdgeInsets.all(16.0)
  child: Text('Contenido'),
)

// Padding horizontal
Container(
  padding: AppSpacing.horizontalMd, // EdgeInsets.symmetric(horizontal: 12.0)
  child: Row(...),
)

// Gaps verticales
Column(
  children: [
    Text('Título'),
    AppSpacing.gapMd, // SizedBox(height: 12.0)
    Text('Descripción'),
  ],
)
```

#### Border Radius

```dart
// Container con border radius
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderLg, // BorderRadius.circular(16.0)
    color: Colors.blue,
  ),
)

// Botón con shape
ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: AppRadius.shapeMd, // RoundedRectangleBorder
  ),
  onPressed: () {},
  child: Text('Botón'),
)
```

#### Tamaños

```dart
// Iconos
Icon(Icons.home, size: AppUI.iconLg) // 24.0

// Avatares
CircleAvatar(radius: AppUI.avatarMd) // 40.0

// Elevaciones
Card(elevation: AppUI.elevationMd) // 4.0

// Opacidades
Opacity(
  opacity: AppUI.opacityDisabled, // 0.38
  child: Text('Deshabilitado'),
)
```

#### Animaciones

```dart
// AnimatedContainer
AnimatedContainer(
  duration: AppDurations.md, // 300ms
  curve: Curves.easeInOut,
  width: isExpanded ? 200 : 100,
)

// Debouncing
Timer(AppDurations.searchDebounce, () {
  // Ejecutar búsqueda después de 300ms
})
```

## 📚 Constantes Disponibles

### AppSpacing
- Valores: `none`, `xxs`, `xs`, `sm`, `md`, `lg`, `xl`, `xxl`, `huge`, `massive`, etc.
- Padding: `paddingMd`, `horizontalLg`, `verticalXl`
- Gaps: `gapMd`, `gapHorizontalLg`

### AppRadius
- Valores: `none`, `xs`, `sm`, `md`, `lg`, `xl`, `xxl`, `huge`, `circular`
- BorderRadius: `borderMd`, `borderTopLg`, `borderBottomMd`
- Shapes: `shapeMd`, `shapeCircular`

### AppSizes & AppUI
- Iconos: `iconXs` (12) a `iconHuge` (48)
- Avatares: `avatarXs` (24) a `avatarMassive` (128)
- Elevaciones: `elevationNone` (0) a `elevationMassive` (24)
- Opacidades: `opacityHover` (0.12) a `opacityFull` (1.0)
- Breakpoints: `maxMobileWidth`, `maxTabletWidth`, `maxDesktopWidth`

### AppDurations
- Duraciones: `xxs` (50ms) a `mega` (3000ms)
- Específicas: `searchDebounce`, `pageTransition`, `snackbarDuration`

## 🎨 Características de la App de Ejemplo

- ✅ **6 secciones interactivas** con ejemplos visuales (Overview, Spacing, Radius, Sizes, Fonts, Animations)
- ✅ **Navegación adaptativa** con rail lateral en desktop y bottom navigation en móvil
- ✅ **Ejemplos prácticos** de cada constante con código y visualización
- ✅ **Animaciones en vivo** para demostrar duraciones
- ✅ **Material Design 3** con tema oscuro moderno
- ✅ **Diseño responsive** que se adapta a diferentes tamaños de pantalla
- ✅ **Código bien documentado** para aprender buenas prácticas
- ✅ **Sistema tipográfico completo** con todas las escalas de fuentes
- ✅ **SVG support** con ejemplos de iconos personalizados

## 🏗️ Arquitectura del Proyecto

La app de ejemplo sigue una arquitectura limpia y modular:

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── core/
│   └── utils/
│       └── responsive.dart      # Utilidades para diseño responsive
├── screens/
│   ├── overview_screen.dart     # Pantalla de resumen general
│   ├── spacing_screen.dart      # Demostración de AppSpacing
│   ├── radius_screen.dart       # Demostración de AppRadius
│   ├── sizes_screen.dart        # Demostración de AppSizes
│   ├── fonts_screen.dart        # Demostración de AppFonts
│   └── animations_screen.dart   # Demostración de AppDurations
├── theme/
│   └── app_theme.dart          # Configuración del tema de la app
└── widgets/
    └── common/
        └── responsive_layout.dart  # Layout adaptativo para diferentes pantallas
```

### Características de Arquitectura

- **Separación de responsabilidades**: Cada pantalla en su propio archivo
- **Reutilización de código**: Widgets comunes compartidos
- **Diseño adaptativo**: Sistema responsive que funciona en todas las plataformas
- **Tema centralizado**: Configuración de colores y estilos en un solo lugar
- **Clean Code**: Código limpio y fácil de mantener

## 📖 Documentación Completa

Para más información sobre el paquete flutter_const, consulta:

- [README principal](../README.md)
- [CHANGELOG](../CHANGELOG.md)
- [Documentación de API](../lib/constants/)

## 🤝 Contribuir

¿Encontraste un bug o tienes una sugerencia para mejorar la app de ejemplo?

1. **Reporta Issues**: Crea un issue describiendo el problema o la mejora
2. **Pull Requests**: Fork el repositorio, haz tus cambios y envía un PR
3. **Feedback**: Comparte tu experiencia usando el paquete

### Áreas de Contribución

- 🐛 Corrección de bugs
- ✨ Nuevos ejemplos interactivos
- 📝 Mejoras en la documentación
- 🎨 Mejoras en el diseño de la app
- 🚀 Optimizaciones de rendimiento

## 💻 Desarrollo

### Estructura del Código

- **main.dart**: Configuración inicial y navegación principal
- **screens/**: Cada pantalla demuestra un aspecto del sistema de diseño
- **widgets/**: Componentes reutilizables como el layout responsive
- **theme/**: Configuración de temas y colores
- **core/**: Utilidades y helpers (responsive, etc.)

### Buenas Prácticas Implementadas

- ✅ Uso consistente de las constantes del paquete
- ✅ Código bien comentado y documentado
- ✅ Separación clara de responsabilidades
- ✅ Diseño adaptativo y responsive
- ✅ Performance optimizado con widgets const

## 📄 Licencia

Este proyecto está bajo la licencia especificada en el paquete principal.

---

**Desarrollado con ❤️ usando Flutter & Consts**

**Nota**: Esta es una aplicación de ejemplo para demostrar el uso del paquete flutter_const. 
No está diseñada para uso en producción, sino como referencia de implementación y aprendizaje.

