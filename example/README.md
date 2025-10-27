# Flutter Const - Example App

Una aplicación de ejemplo completa que demuestra el uso del paquete **flutter_const** para mantener consistencia visual en aplicaciones Flutter.

## 🎯 Sobre esta App

Esta aplicación de ejemplo muestra todas las constantes disponibles en el paquete `flutter_const`:

- **AppSpacing**: Sistema de espaciado y padding
- **AppRadius**: Border radius y shapes
- **AppSizes**: Tamaños, iconos, avatares, elevaciones y opacidades
- **AppDurations**: Duraciones de animaciones
- **AppUI**: Acceso rápido a constantes comunes

## 📱 Capturas de Pantalla

La app contiene 4 secciones principales:

1. **Spacing** - Demuestra padding, gaps verticales y horizontales
2. **Radius** - Muestra diferentes border radius y shapes
3. **Sizes** - Presenta tamaños de iconos, avatares, elevaciones y opacidades
4. **Animations** - Ejemplos de animaciones con duraciones predefinidas

## 🚀 Ejecutar la App

### Prerrequisitos

- Flutter SDK 3.0 o superior
- Dart SDK 3.0 o superior

### Instalación

1. Clona el repositorio o descarga el paquete
2. Navega al directorio example:
   ```bash
   cd flutter_const/example
   ```

3. Obtén las dependencias:
   ```bash
   flutter pub get
   ```

4. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## 💡 Cómo Usar las Constantes

### Importar el Paquete

```dart
import 'package:flutter_consts/flutter_const.dart';
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

- ✅ **4 secciones interactivas** con ejemplos visuales
- ✅ **Navegación con tabs** para fácil exploración
- ✅ **Ejemplos prácticos** de cada constante
- ✅ **Animaciones en vivo** para demostrar duraciones
- ✅ **Material Design 3** con colores modernos
- ✅ **Código bien documentado** para aprender

## 📖 Documentación Completa

Para más información sobre el paquete flutter_const, consulta:

- [README principal](../README.md)
- [CHANGELOG](../CHANGELOG.md)
- [Documentación de API](../lib/constants/)

## 🤝 Contribuir

¿Encontraste un bug o tienes una sugerencia? ¡Crea un issue o pull request!

## 📄 Licencia

Este proyecto está bajo la licencia especificada en el paquete principal.

---

**Nota**: Esta es una aplicación de ejemplo para demostrar el uso del paquete flutter_const. 
No está diseñada para uso en producción, sino como referencia de implementación.

