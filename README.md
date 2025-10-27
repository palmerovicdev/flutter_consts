# Flutter Consts 🎨

[![pub package](https://img.shields.io/pub/v/flutter_consts.svg)](https://pub.dev/packages/flutter_consts)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Sistema completo de constantes de diseño para aplicaciones Flutter. Mantén consistencia visual en toda tu app con un conjunto estandarizado de tamaños, espaciados, bordes y animaciones.

## ✨ Características

- 🎯 **Sistema unificado** - Todas las constantes siguen la misma nomenclatura
- 📏 **Escala coherente** - De `xs` a `massive` con valores progresivos
- 🔧 **Fácil mantenimiento** - Cambios centralizados
- 💡 **Autocompletado** - Descubrimiento fácil en el IDE
- 📦 **Sin dependencias** - Solo Flutter SDK
- 🚀 **Optimizado** - Todo const para máximo rendimiento
- 📖 **Documentado** - Cada constante incluye documentación

## 📦 Instalación

Agrega esto a tu `pubspec.yaml`:

```yaml
dependencies:
  flutter_consts: ^1.0.0
```

Luego ejecuta:

```bash
flutter pub get
```

## 🚀 Inicio Rápido

```dart
import 'package:flutter_consts/flutter_const.dart';

// Usar constantes en tu app
Container(
  padding: AppSpacing.paddingLg,
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderMd,
  ),
  child: Column(
    children: [
      Text('Título'),
      AppSpacing.gapMd, // Gap entre widgets
      Text('Descripción'),
    ],
  ),
)
```

## 📐 Sistemas Disponibles

### 📊 Referencia Rápida

| Sistema | Propósito | Ejemplo |
|---------|-----------|---------|
| **AppSizes** | Tamaños base | `AppSizes.md` → `12.0` |
| **AppSpacing** | Padding y gaps | `AppSpacing.paddingLg` → `EdgeInsets.all(16.0)` |
| **AppRadius** | Bordes redondeados | `AppRadius.borderMd` → `BorderRadius.circular(12.0)` |
| **AppDurations** | Animaciones | `AppDurations.md` → `Duration(milliseconds: 300)` |
| **AppUI** | UI helpers | `AppUI.iconLg` → `24.0` |

---

### 1. **AppSizes** - Base del Sistema

Define todos los tamaños fundamentales que se reutilizan en el sistema.

**Escala básica:**
```dart
AppSizes.none  // 0.0
AppSizes.xxs   // 2.0
AppSizes.xs    // 4.0
AppSizes.sm    // 6.0
AppSizes.md    // 12.0  ← Valor estándar
AppSizes.lg    // 16.0
AppSizes.xl    // 20.0
AppSizes.xxl   // 24.0
AppSizes.huge  // 32.0
// ... hasta colossal (96.0)
```

**Tamaños especializados:**
```dart
// Iconos (Material Design)
AppSizes.iconXs    // 12.0
AppSizes.iconSm    // 16.0
AppSizes.iconMd    // 20.0
AppSizes.iconLg    // 24.0 - Estándar Material

// Avatares
AppSizes.avatarSm      // 32.0
AppSizes.avatarMd      // 40.0
AppSizes.avatarLg      // 48.0
AppSizes.avatarMassive // 128.0

// Elevaciones (Material Design)
AppSizes.elevationNone    // 0.0
AppSizes.elevationSm      // 2.0
AppSizes.elevationMd      // 4.0
AppSizes.elevationLg      // 6.0

// Opacidades (Material Design)
AppSizes.opacityDisabled  // 0.38
AppSizes.opacityMedium    // 0.54
AppSizes.opacityHigh      // 0.87

// Breakpoints responsivos
AppSizes.maxMobileWidth   // 600.0
AppSizes.maxTabletWidth   // 900.0
AppSizes.maxDesktopWidth  // 1200.0
```

### 2. **AppSpacing** - Espaciado y Gaps

Sistema completo de espaciado basado en `AppSizes`.

**Valores base:**
```dart
AppSpacing.md  // 12.0 (mismo valor que AppSizes.md)
```

**Padding uniforme (EdgeInsets.all):**
```dart
Padding(
  padding: AppSpacing.paddingMd,  // EdgeInsets.all(12.0)
  child: Text('Contenido'),
)
```

**Padding horizontal:**
```dart
Container(
  padding: AppSpacing.horizontalLg,  // EdgeInsets.symmetric(horizontal: 16.0)
  child: Row(...),
)
```

**Padding vertical:**
```dart
Container(
  padding: AppSpacing.verticalMd,  // EdgeInsets.symmetric(vertical: 12.0)
  child: Column(...),
)
```

**Gaps verticales (SizedBox):**
```dart
Column(
  children: [
    Text('Título'),
    AppSpacing.gapMd,  // SizedBox(height: 12.0)
    Text('Descripción'),
    AppSpacing.gapLg,  // SizedBox(height: 16.0)
    Text('Más contenido'),
  ],
)
```

**Gaps horizontales:**
```dart
Row(
  children: [
    Icon(Icons.star),
    AppSpacing.gapHorizontalSm,  // SizedBox(width: 6.0)
    Text('5.0'),
  ],
)
```

### 3. **AppRadius** - Bordes Redondeados

Sistema completo de border radius basado en `AppSizes`.

**Valores base:**
```dart
AppRadius.md  // 12.0
AppRadius.circular  // 999.0 (para formas circulares tipo "pill")
```

**BorderRadius para containers:**
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderMd,  // BorderRadius.circular(12.0)
    color: Colors.blue,
  ),
)
```

**Shapes para botones:**
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: AppRadius.shapeMd,  // RoundedRectangleBorder
  ),
  onPressed: () {},
  child: Text('Botón'),
)
```

**Bordes parciales:**
```dart
// Solo esquinas superiores
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderTopLg,  // Solo top redondeado
  ),
)

// Solo esquinas inferiores
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderBottomLg,
  ),
)

// Esquinas individuales personalizadas
BorderRadius.only(
  topLeft: AppRadius.radiusMd,
  topRight: AppRadius.radiusLg,
  bottomLeft: AppRadius.radiusXs,
  bottomRight: AppRadius.radiusNone,
)
```

**Forma circular (pill):**
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderCircular,
  ),
  child: Text('Badge'),
)
```

### 4. **AppDurations** - Duraciones de Animación

Duraciones estandarizadas para animaciones y transiciones.

**Escala de duraciones:**
```dart
AppDurations.xxs  // 50ms  - Ultra rápido (hover effects)
AppDurations.xs   // 100ms - Extra rápido
AppDurations.sm   // 150ms - Muy rápido
AppDurations.smd  // 200ms - Rápido (micro-interacciones)
AppDurations.md   // 300ms - Mediano (animaciones estándar) ← Recomendado
AppDurations.lg   // 400ms - Lento
AppDurations.xl   // 500ms - Extra lento

AppDurations.xxl     // 600ms  - Extra extra lento
AppDurations.xxxl    // 800ms  - Muy lento
AppDurations.huge    // 1000ms - Enorme (1 segundo)
AppDurations.massive // 1500ms - Masivo (1.5 segundos)
AppDurations.giant   // 2000ms - Gigante (2 segundos)
AppDurations.mega    // 3000ms - Mega (3 segundos)
```

**Duraciones específicas:**
```dart
AppDurations.searchDebounce    // 300ms - Debounce para búsqueda
AppDurations.filterDebounce    // 400ms - Debounce para filtros
AppDurations.quickDebounce     // 200ms - Debounce rápido
AppDurations.tooltipDelay      // 500ms - Delay para tooltips
AppDurations.snackbarDuration  // 2000ms - Duración de snackbars
AppDurations.pageTransition    // 150ms - Transición de páginas
AppDurations.hoverEffect       // 100ms - Efectos hover
AppDurations.rippleEffect      // 200ms - Efectos ripple
```

**Uso en animaciones:**
```dart
// AnimatedContainer
AnimatedContainer(
  duration: AppDurations.md,
  curve: Curves.easeInOut,
  width: isExpanded ? 200 : 100,
)

// AnimatedOpacity
AnimatedOpacity(
  duration: AppDurations.xl,
  opacity: isVisible ? 1.0 : 0.0,
  child: Widget(),
)

// Debouncing
Timer _debounce;
void onSearchChanged(String query) {
  _debounce?.cancel();
  _debounce = Timer(AppDurations.searchDebounce, () {
    // Ejecutar búsqueda
  });
}
```

### 5. **AppUI** - Constantes de UI

Acceso rápido a constantes comunes. Delega a `AppSizes` para evitar duplicación.

**Elevaciones:**
```dart
Card(elevation: AppUI.elevationMd)  // 4.0
FloatingActionButton(elevation: AppUI.elevationLg)  // 6.0
```

**Opacidades:**
```dart
Opacity(
  opacity: AppUI.opacityDisabled,  // 0.38
  child: Text('Deshabilitado'),
)

Text(
  'Texto secundario',
  style: TextStyle(
    color: Colors.black.withOpacity(AppUI.opacityMedium),  // 0.54
  ),
)
```

**Iconos:**
```dart
Icon(Icons.home, size: AppUI.iconSm)    // 16.0
Icon(Icons.star, size: AppUI.iconMd)    // 20.0
Icon(Icons.menu, size: AppUI.iconLg)    // 24.0
Icon(Icons.search, size: AppUI.iconXl)  // 32.0
```

**Avatares:**
```dart
CircleAvatar(
  radius: AppUI.avatarSm / 2,  // 32.0 / 2 = 16.0
  child: Text('A'),
)

CircleAvatar(
  radius: AppUI.avatarMd / 2,  // 40.0 / 2 = 20.0
  backgroundImage: NetworkImage('...'),
)
```

**Breakpoints responsivos:**
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < AppUI.maxMobileWidth) {
      return MobileLayout();
    } else if (constraints.maxWidth < AppUI.maxTabletWidth) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  },
)
```

**Aspect Ratios:**
```dart
AspectRatio(
  aspectRatio: AppUI.aspectRatioSquare,  // 1.0 (1:1)
  child: Image.network('...'),
)

AspectRatio(
  aspectRatio: AppUI.aspectRatioWide,  // 16/9
  child: VideoPlayer(),
)
```

---

## 🎯 Nomenclatura Estandarizada

Todas las constantes siguen el mismo patrón de nombres:

| Nombre     | Valor típico | Uso                             |
|------------|--------------|---------------------------------|
| `none`     | 0            | Sin valor                       |
| `xxs`      | 2-50         | Extra extra pequeño             |
| `xs`       | 4-100        | Extra pequeño                   |
| `sm`       | 6-150        | Pequeño                         |
| `smd`      | 8-200        | Pequeño a mediano               |
| `mds`      | 10-250       | Mediano pequeño                 |
| `md`       | 12-300       | **Mediano (valor por defecto)** |
| `mdl`      | 14-350       | Mediano a largo                 |
| `lg`       | 16-400       | Largo                           |
| `lgx`      | 18           | Largo extra                     |
| `xl`       | 20-500       | Extra largo                     |
| `xxl`      | 24-600       | Extra extra largo               |
| `xxxl`     | 28-800       | Extra extra extra largo         |
| `huge`     | 32-1000      | Enorme                          |
| `massive`  | 40-1500      | Masivo                          |
| `giant`    | 48-2000      | Gigante                         |
| `mega`     | 56-3000      | Mega                            |
| `ultra`    | 64           | Ultra                           |
| `extreme`  | 80           | Extremo                         |
| `colossal` | 96           | Colosal                         |

## 💡 Ejemplos Completos

### Card con todos los sistemas

```dart
Card(
  elevation: AppUI.elevationMd,  // 4.0
  shape: AppRadius.shapeLg,  // RoundedRectangleBorder con radius 16
  child: Padding(
    padding: AppSpacing.paddingLg,  // EdgeInsets.all(16.0)
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: AppUI.avatarSm / 2,  // 16.0
              child: Icon(Icons.person, size: AppUI.iconSm),  // 16.0
            ),
            AppSpacing.gapHorizontalMd,  // SizedBox(width: 12.0)
            Text(
              'Usuario',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        AppSpacing.gapMd,  // SizedBox(height: 12.0)
        Text(
          'Descripción del contenido',
          style: TextStyle(
            color: Colors.black.withOpacity(AppUI.opacityMedium),  // 0.54
          ),
        ),
        AppSpacing.gapLg,  // SizedBox(height: 16.0)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: AppRadius.shapeSm,  // radius 6
              ),
              child: Text('Cancelar'),
            ),
            AppSpacing.gapHorizontalSm,  // SizedBox(width: 6.0)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: AppRadius.shapeMd,  // radius 12
                elevation: AppUI.elevationSm,  // 2.0
              ),
              child: Text('Aceptar'),
            ),
          ],
        ),
      ],
    ),
  ),
)
```

### Animación con transición

```dart
class AnimatedCard extends StatefulWidget {
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: AppDurations.md,  // 300ms
        curve: Curves.easeInOut,
        width: _isExpanded ? 300 : 200,
        height: _isExpanded ? 200 : 100,
        padding: AppSpacing.paddingMd,  // EdgeInsets.all(12.0)
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: _isExpanded 
              ? AppRadius.borderXl   // 20.0
              : AppRadius.borderMd,  // 12.0
        ),
        child: Center(
          child: Icon(
            Icons.touch_app,
            size: _isExpanded 
                ? AppUI.iconXxl  // 40.0
                : AppUI.iconLg,  // 24.0
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
```

### Layout responsivo

```dart
class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mobile
        if (constraints.maxWidth < AppUI.maxMobileWidth) {
          return Column(
            children: [
              _buildHeader(),
              AppSpacing.gapMd,
              _buildContent(),
            ],
          );
        }
        
        // Tablet
        if (constraints.maxWidth < AppUI.maxTabletWidth) {
          return Row(
            children: [
              Expanded(flex: 1, child: _buildSidebar()),
              AppSpacing.gapHorizontalLg,
              Expanded(flex: 2, child: _buildContent()),
            ],
          );
        }
        
        // Desktop
        return Row(
          children: [
            SizedBox(width: 250, child: _buildSidebar()),
            AppSpacing.gapHorizontalXl,
            Expanded(child: _buildContent()),
            AppSpacing.gapHorizontalXl,
            SizedBox(width: 300, child: _buildAside()),
          ],
        );
      },
    );
  }
  
  Widget _buildHeader() => Container();
  Widget _buildSidebar() => Container();
  Widget _buildContent() => Container();
  Widget _buildAside() => Container();
}
```

## ✅ Beneficios

1. **✨ Consistencia**: Misma escala en toda la app
2. **🔧 Mantenibilidad**: Cambios centralizados
3. **📖 Legibilidad**: Nombres semánticos claros
4. **🚫 Sin duplicación**: Un solo lugar para cada valor
5. **💡 Autocompletado**: Fácil de descubrir en el IDE
6. **📏 Escalable**: Fácil agregar nuevos valores
7. **🎨 Design Tokens**: Sistema de tokens de diseño integrado
8. **⚡ Performance**: Todas las constantes son `const`

## 🔄 Migración desde Valores Hardcoded

```dart
// ❌ Antes
Container(
  padding: EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
  ),
  child: Column(
    children: [
      Text('Título'),
      SizedBox(height: 12.0),
      Text('Descripción'),
    ],
  ),
)

// ✅ Después
Container(
  padding: AppSpacing.paddingLg,
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderMd,
  ),
  child: Column(
    children: [
      Text('Título'),
      AppSpacing.gapMd,
      Text('Descripción'),
    ],
  ),
)
```

## 🎨 Design Tokens

Este sistema actúa como **Design Tokens** de la app, similar a:
- Material Design tokens
- Tailwind CSS utilities
- Bootstrap spacing system
- Chakra UI tokens

## 📱 App de Ejemplo

Incluye una aplicación de ejemplo completa que demuestra todas las constantes. Para ejecutarla:

```bash
cd example
flutter run
```

La app incluye 4 secciones:
- **Spacing**: Demuestra padding y gaps
- **Radius**: Muestra border radius y shapes
- **Sizes**: Presenta iconos, avatares, elevaciones y opacidades
- **Animations**: Ejemplos de animaciones

## 📝 Notas Importantes

- ✅ Todos los valores son **const** para optimización
- ✅ Cada constante está **documentada** con comentarios
- ✅ La escala es **progresiva** y lógica
- ✅ Compatible con **Material Design 3**
- ✅ Sin dependencias externas
- ✅ Mínimo SDK: **Dart 3.0.0**

## 🤝 Contribuir

Las contribuciones son bienvenidas! Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 🌟 Agradecimientos

Inspirado en sistemas de diseño de:
- Material Design
- Tailwind CSS
- Bootstrap
- Chakra UI

---

**Hecho con ❤️ para la comunidad Flutter**

