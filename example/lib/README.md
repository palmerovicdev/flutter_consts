# Flutter Const Example - Arquitectura

## 📁 Estructura del Proyecto

```
lib/
├── core/
│   └── utils/
│       └── responsive.dart      # Utilidades para diseño responsive
├── screens/
│   ├── overview_screen.dart     # Pantalla principal de introducción
│   ├── spacing_screen.dart      # Demo del sistema de espaciado
│   ├── radius_screen.dart       # Demo de border radius
│   ├── sizes_screen.dart        # Demo de tamaños (iconos, avatares, etc.)
│   ├── fonts_screen.dart        # Demo del sistema tipográfico
│   └── animations_screen.dart   # Demo de duraciones de animación
├── theme/
│   ├── theme.dart              # Colores HSL del sistema
│   └── app_theme.dart          # Tema Material 3 completo
├── widgets/
│   └── common/
│       ├── demo_card.dart      # Card reutilizable para demos
│       ├── info_chip.dart      # Chips informativos
│       ├── section_title.dart  # Títulos de sección consistentes
│       └── responsive_layout.dart # Layouts adaptativos
└── main.dart                   # Entry point y navegación principal
```

## 🎯 Principios de Diseño

### 1. Modularidad
- Cada pantalla de demo está en su propio archivo
- Los widgets comunes son reutilizables
- Separación clara entre lógica, presentación y utilidades

### 2. Responsive Design
- Soporte para mobile (< 600px), tablet (< 1240px) y desktop
- Layouts adaptativos usando `Responsive` utilities
- Navegación adaptativa (bottom bar vs navigation rail)

### 3. Consistencia Visual
- Uso del sistema de constantes (`AppSpacing`, `AppRadius`, `AppUI`, etc.)
- Tema Material 3 con colores HSL personalizados
- Componentes reutilizables (`DemoCard`, `SectionTitle`, etc.)

### 4. Escalabilidad
- Fácil agregar nuevas pantallas de demo
- Arquitectura preparada para crecer
- Código bien documentado y mantenible

## 🎨 Sistema de Diseño

### Colores
Los colores están definidos en `theme/theme.dart` usando HSL:
- Background oscuro para modo dark
- Esquema de colores primario, secundario, danger, warning, success, info
- Estados de texto (normal, muted)
- Bordes y destacados

### Espaciado
Sistema consistente desde `AppSpacing`:
- Padding uniforme: `paddingXs` a `paddingXxl`
- Padding horizontal: `horizontalSm` a `horizontalXl`
- Gaps verticales y horizontales
- Responsive: más espacio en desktop

### Tipografía
Sistema jerárquico desde `AppFontSizes`:
- 10 niveles: desde `bodySmall` hasta `display`
- Escalas configurables (small, normal, large, extraLarge)
- Responsive y accesible

### Animaciones
Duraciones estandarizadas desde `AppDurations`:
- Rápidas (50-200ms) para feedback inmediato
- Medianas (300-600ms) para transiciones
- Lentas (1000ms+) para efectos especiales
- Especializadas (debounce, tooltip, snackbar, etc.)

## 🧩 Widgets Comunes

### DemoCard
Card consistente para mostrar demos con:
- Título y subtítulo opcional
- Contenido personalizable
- Variantes: estándar, código, ejemplo visual

### SectionTitle
Títulos de sección uniformes con:
- Icono opcional
- Subtítulo opcional
- Divider opcional
- Estilos consistentes

### InfoChip
Chips informativos para metadata:
- Icono y label
- Colores personalizables
- Tamaño compacto

### ResponsiveLayout
Layouts adaptativos:
- `ResponsiveLayout`: diferentes widgets por dispositivo
- `AdaptiveNavigationLayout`: navegación adaptativa
- `MaxWidthContainer`: contenido centrado con ancho máximo
- `ResponsiveGrid`: grid con columnas adaptativas

## 🚀 Cómo Agregar una Nueva Pantalla

1. **Crear el archivo de la pantalla** en `screens/`:
```dart
// screens/nueva_screen.dart
class NuevaScreen extends StatelessWidget {
  const NuevaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Responsive.getPadding(context),
      children: [
        SectionTitle(
          title: 'Título',
          subtitle: 'Descripción',
          icon: Icons.tu_icono,
          showDivider: true,
        ),
        // ... tu contenido
      ],
    );
  }
}
```

2. **Agregar al menú de navegación** en `main.dart`:
```dart
// Agregar a _navItems
_NavItem(
  icon: Icons.tu_icono_outlined,
  selectedIcon: Icons.tu_icono,
  label: 'Nuevo',
),

// Agregar case en _buildPage
case N:
  return const NuevaScreen();
```

3. **Importar** la nueva screen:
```dart
import 'screens/nueva_screen.dart';
```

## 📱 Responsive Breakpoints

Definidos en `AppUI`:
- **Mobile**: < 600px (1 columna)
- **Tablet**: 600px - 1239px (2 columnas)
- **Desktop**: ≥ 1240px (3+ columnas)

## ✨ Mejores Prácticas

1. **Usa las constantes**: Siempre usa `AppSpacing`, `AppRadius`, `AppUI`, etc.
2. **Sé responsive**: Considera mobile, tablet y desktop en todos los layouts
3. **Reutiliza widgets**: Usa los widgets comunes cuando sea posible
4. **Mantén la consistencia**: Sigue los patrones existentes
5. **Documenta**: Agrega comentarios para código complejo
6. **Accesibilidad**: Mantén contraste adecuado y tamaños táctiles mínimos

## 🔧 Utilidades Disponibles

### Responsive
```dart
Responsive.isMobile(context)
Responsive.isTablet(context)
Responsive.isDesktop(context)
Responsive.getColumns(context, mobile: 1, tablet: 2, desktop: 3)
Responsive.getPadding(context)
Responsive.getVerticalGap(context)
Responsive.builder(mobile: ..., tablet: ..., desktop: ...)
```

### Spacing Helpers
```dart
AppSpacing.gapMd          // Vertical gap
AppSpacing.gapHorizontalMd // Horizontal gap
AppSpacing.paddingMd      // EdgeInsets.all
AppSpacing.horizontalMd   // EdgeInsets.symmetric(horizontal)
```

## 🎯 Objetivos Cumplidos

✅ Modularización completa por pantallas  
✅ UI moderna y elegante con Material 3  
✅ Responsive (mobile, tablet, desktop)  
✅ Arquitectura escalable y mantenible  
✅ Widgets reutilizables  
✅ Documentación consistente  
✅ Sistema de diseño unificado  
✅ Casos de prueba interactivos  
✅ Accesibilidad mejorada  

