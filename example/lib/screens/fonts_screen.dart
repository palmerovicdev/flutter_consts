import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

import '../theme/theme.dart';
import '../core/utils/responsive.dart';
import '../widgets/backgrounds/animated_background.dart';
import '../core/components/components.dart';

/// Pantalla de demostración del sistema tipográfico
class FontsScreen extends StatefulWidget {
  const FontsScreen({super.key});

  @override
  State<FontsScreen> createState() => _FontsScreenState();
}

class _FontsScreenState extends State<FontsScreen> {
  double _baseSize = 14;
  String _baseSizeName = 'Normal (14px)';
  double _scaleFactor = AppFontSizesScaleFactors.large;
  String _scaleFactorName = 'Large (1.272)';
  late AppFontSizes _selectedPreset;

  @override
  void initState() {
    super.initState();
    _updatePreset();
  }

  void _updatePreset() {
    setState(() {
      _selectedPreset = AppFontSizes(
        bodySmall: _baseSize,
        scaleFactor: _scaleFactor,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = Responsive.isMobile(context);

    return AnimatedBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isNarrow ? 24.0 : 48.0,
          vertical: isNarrow ? 24.0 : 48.0,
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSectionTitle('AppFontSizes', isNarrow),
                SizedBox(height: 16),
                Text(
                  'Sistema tipográfico jerárquico con escalas configurables y responsive',
                  style: TextStyle(
                    fontSize: isNarrow ? 14 : 16,
                    color: textMuted,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: isNarrow ? 32 : 48),

                // Base Size Selector
                buildExampleCard(
                  'Tamaño Base',
                  'Selecciona el tamaño del texto del cuerpo (bodySmall)',
                  isNarrow,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildBaseSizeButton('Small (12px)', 12),
                          _buildBaseSizeButton('Normal (14px)', 14),
                          _buildBaseSizeButton('Large (16px)', 16),
                          _buildBaseSizeButton('XLarge (18px)', 18),
                          _buildBaseSizeButton('Huge (20px)', 20),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: info.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: info.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline, size: 18, color: info),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Actual: $_baseSizeName',
                                style: TextStyle(color: text, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  '''// Crear escala con tamaño base
final sizes = AppFontSizes(
  bodySmall: 14,  // Tamaño base
  scaleFactor: AppFontSizesScaleFactors.large,
);''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Scale Factor Selector
                buildExampleCard(
                  'Factor de Escala',
                  'Define la proporción entre niveles de jerarquía',
                  isNarrow,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildScaleButton(
                            'Small (1.128)',
                            AppFontSizesScaleFactors.small,
                          ),
                          _buildScaleButton(
                            'Normal (1.174)',
                            AppFontSizesScaleFactors.normal,
                          ),
                          _buildScaleButton(
                            'Large (1.272)',
                            AppFontSizesScaleFactors.large,
                          ),
                          _buildScaleButton(
                            'XLarge (1.618)',
                            AppFontSizesScaleFactors.extraLarge,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: secondary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: secondary.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.trending_up, size: 18, color: secondary),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Actual: $_scaleFactorName',
                                style: TextStyle(color: text, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  '''// Factores de escala disponibles
AppFontSizesScaleFactors.small      // 1.128
AppFontSizesScaleFactors.normal     // 1.174
AppFontSizesScaleFactors.large      // 1.272
AppFontSizesScaleFactors.extraLarge // 1.618''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Quick Presets
                buildExampleCard(
                  'Presets Rápidos',
                  'Combinaciones predefinidas para casos de uso comunes',
                  isNarrow,
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildQuickPresetButton(
                        'Mobile',
                        14,
                        AppFontSizesScaleFactors.large,
                      ),
                      _buildQuickPresetButton(
                        'Tablet',
                        16,
                        AppFontSizesScaleFactors.large,
                      ),
                      _buildQuickPresetButton(
                        'Desktop',
                        12,
                        AppFontSizesScaleFactors.normal,
                      ),
                      _buildQuickPresetButton(
                        'Accessibility',
                        18,
                        AppFontSizesScaleFactors.large,
                      ),
                      _buildQuickPresetButton(
                        'Marketing',
                        14,
                        AppFontSizesScaleFactors.extraLarge,
                      ),
                    ],
                  ),
                  null,
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Typography Hierarchy
                buildExampleCard(
                  'Jerarquía Tipográfica',
                  'Visualización de todos los niveles con el preset actual',
                  isNarrow,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFontExample(
                        'Display',
                        _selectedPreset.display,
                        'Hero text, splash',
                      ),
                      _buildFontExample(
                        'H1',
                        _selectedPreset.h1,
                        'Page titles',
                      ),
                      _buildFontExample(
                        'H2',
                        _selectedPreset.h2,
                        'Major sections',
                      ),
                      _buildFontExample(
                        'H3',
                        _selectedPreset.h3,
                        'Subsections',
                      ),
                      _buildFontExample(
                        'Header',
                        _selectedPreset.header,
                        'Section headers',
                      ),
                      _buildFontExample(
                        'Subheader',
                        _selectedPreset.subheader,
                        'Dialog titles',
                      ),
                      _buildFontExample(
                        'Paragraph Title',
                        _selectedPreset.paragraphTitle,
                        'Card titles',
                      ),
                      _buildFontExample(
                        'Body Large',
                        _selectedPreset.bodyLarge,
                        'Emphasized',
                      ),
                      _buildFontExample(
                        'Body',
                        _selectedPreset.body,
                        'Standard text',
                      ),
                      _buildFontExample(
                        'Body Small',
                        _selectedPreset.bodySmall,
                        'Captions',
                      ),
                    ],
                  ),
                  '''// Usar tamaños en Text widgets
Text(
  'Título Principal',
  style: TextStyle(fontSize: sizes.h1),
)

Text(
  'Párrafo',
  style: TextStyle(fontSize: sizes.body),
)''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Real Example
                buildExampleCard(
                  'Ejemplo Real de Artículo',
                  'Cómo se ve la jerarquía en un contexto real',
                  isNarrow,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Future of Design Systems',
                        style: TextStyle(
                          fontSize: _selectedPreset.h2,
                          fontWeight: FontWeight.bold,
                          color: text,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Por Jane Designer • 5 min lectura',
                        style: TextStyle(
                          fontSize: _selectedPreset.bodySmall,
                          color: textMuted,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Introducción',
                        style: TextStyle(
                          fontSize: _selectedPreset.header,
                          fontWeight: FontWeight.w600,
                          color: text,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Los sistemas de diseño modernos requieren escalas tipográficas consistentes que se adapten a diferentes dispositivos y contextos. Este ejemplo demuestra cómo una jerarquía bien definida mejora la legibilidad y estructura del contenido.',
                        style: TextStyle(
                          fontSize: _selectedPreset.body,
                          color: text,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Conceptos Clave',
                        style: TextStyle(
                          fontSize: _selectedPreset.subheader,
                          fontWeight: FontWeight.w600,
                          color: text,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '• La tipografía crea jerarquía visual\n'
                        '• El escalado consistente mejora UX\n'
                        '• Las fuentes responsive se adaptan',
                        style: TextStyle(
                          fontSize: _selectedPreset.body,
                          color: text,
                        ),
                      ),
                    ],
                  ),
                  null,
                ),

                SizedBox(height: isNarrow ? 48 : 64),

                // Best Practices
                buildPracticeCard(
                  'Mejores Prácticas',
                  [
                    'Usa una escala modular para mantener la jerarquía visual',
                    'El tamaño base debe ser legible (14-16px para body)',
                    'Usa AppFontSizesConstants para valores predefinidos',
                    'Ajusta el scale factor según el dispositivo',
                    'Mantén consistencia en toda la aplicación',
                  ],
                  primary,
                  isNarrow,
                ),

                SizedBox(height: isNarrow ? 40 : 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBaseSizeButton(String name, double size) {
    final isSelected = _baseSize == size;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _baseSize = size;
          _baseSizeName = name;
          _updatePreset();
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? primary.withValues(alpha: 0.1) : null,
        foregroundColor: isSelected ? primary : text,
        side: BorderSide(
          color: isSelected ? primary : border,
          width: isSelected ? 2 : 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(name),
    );
  }

  Widget _buildScaleButton(String name, double scale) {
    final isSelected = (_scaleFactor - scale).abs() < 0.001;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _scaleFactor = scale;
          _scaleFactorName = name;
          _updatePreset();
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? secondary.withValues(alpha: 0.1) : null,
        foregroundColor: isSelected ? secondary : text,
        side: BorderSide(
          color: isSelected ? secondary : border,
          width: isSelected ? 2 : 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(name),
    );
  }

  Widget _buildQuickPresetButton(String name, double size, double scale) {
    final isCurrent = _baseSize == size && (_scaleFactor - scale).abs() < 0.001;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _baseSize = size;
          _scaleFactor = scale;
          _baseSizeName = '${size}px';
          if ((scale - AppFontSizesScaleFactors.small).abs() < 0.001) {
            _scaleFactorName = 'Small (1.128)';
          } else if ((scale - AppFontSizesScaleFactors.normal).abs() < 0.001) {
            _scaleFactorName = 'Normal (1.174)';
          } else if ((scale - AppFontSizesScaleFactors.large).abs() < 0.001) {
            _scaleFactorName = 'Large (1.272)';
          } else {
            _scaleFactorName = 'XLarge (1.618)';
          }
          _updatePreset();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isCurrent ? primary : bgLight,
        foregroundColor: isCurrent ? Colors.white : text,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCurrent) ...[Icon(Icons.check, size: 16), SizedBox(width: 6)],
          Text(name),
        ],
      ),
    );
  }

  Widget _buildFontExample(String label, double size, String description) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: size,
                    color: text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${size.toStringAsFixed(1)}px',
                style: TextStyle(
                  color: primary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              color: textMuted,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 1, color: border.withValues(alpha: 0.2)),
        ],
      ),
    );
  }
}
