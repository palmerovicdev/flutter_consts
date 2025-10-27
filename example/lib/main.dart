import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Const Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    SpacingDemo(),
    RadiusDemo(),
    SizesDemo(),
    AnimationsDemo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Const Package Demo'),
        elevation: AppUI.elevationMd,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: AnimatedSwitcher(
        duration: AppDurations.md,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.space_bar),
            label: 'Spacing',
          ),
          NavigationDestination(
            icon: Icon(Icons.rounded_corner),
            label: 'Radius',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_size_select_small),
            label: 'Sizes',
          ),
          NavigationDestination(
            icon: Icon(Icons.animation),
            label: 'Animations',
          ),
        ],
      ),
    );
  }
}

// Demostración de Spacing
class SpacingDemo extends StatelessWidget {
  const SpacingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.paddingLg,
      children: [
        Text(
          'AppSpacing',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        AppSpacing.gapMd,
        const Text('Ejemplos de padding y spacing:'),
        AppSpacing.gapLg,

        // Padding examples
        _buildSection(
          'Padding All',
          Card(
            elevation: AppUI.elevationSm,
            child: Padding(
              padding: AppSpacing.paddingXl,
              child: const Text('Padding XL (20.0)'),
            ),
          ),
        ),

        _buildSection(
          'Horizontal Padding',
          Card(
            elevation: AppUI.elevationSm,
            child: Padding(
              padding: AppSpacing.horizontalLg,
              child: Container(
                color: Colors.blue.withOpacity(0.1),
                padding: AppSpacing.verticalMd,
                child: const Text('Horizontal LG (16.0)'),
              ),
            ),
          ),
        ),

        _buildSection(
          'Gaps Verticales',
          Card(
            elevation: AppUI.elevationSm,
            child: Padding(
              padding: AppSpacing.paddingMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Elemento 1'),
                  AppSpacing.gapSm,
                  const Text('Gap SM (6.0)'),
                  AppSpacing.gapMd,
                  const Text('Gap MD (12.0)'),
                  AppSpacing.gapLg,
                  const Text('Gap LG (16.0)'),
                  AppSpacing.gapXl,
                  const Text('Gap XL (20.0)'),
                ],
              ),
            ),
          ),
        ),

        _buildSection(
          'Gaps Horizontales',
          Card(
            elevation: AppUI.elevationSm,
            child: Padding(
              padding: AppSpacing.paddingMd,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildColorBox(Colors.red, 'Box 1'),
                    AppSpacing.gapHorizontalSm,
                    _buildColorBox(Colors.green, 'SM'),
                    AppSpacing.gapHorizontalMd,
                    _buildColorBox(Colors.blue, 'MD'),
                    AppSpacing.gapHorizontalLg,
                    _buildColorBox(Colors.orange, 'LG'),
                    AppSpacing.gapHorizontalXl,
                    _buildColorBox(Colors.purple, 'XL'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AppSpacing.gapSm,
        child,
        AppSpacing.gapXl,
      ],
    );
  }

  Widget _buildColorBox(Color color, String label) {
    return Container(
      width: AppSizes.ultra,
      height: AppSizes.ultra,
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadius.borderMd,
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// Demostración de Radius
class RadiusDemo extends StatelessWidget {
  const RadiusDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.paddingLg,
      children: [
        Text(
          'AppRadius',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        AppSpacing.gapMd,
        const Text('Ejemplos de border radius:'),
        AppSpacing.gapLg,

        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            _buildRadiusBox('None', AppRadius.borderNone),
            _buildRadiusBox('XS (4)', AppRadius.borderXs),
            _buildRadiusBox('SM (6)', AppRadius.borderSm),
            _buildRadiusBox('MD (12)', AppRadius.borderMd),
            _buildRadiusBox('LG (16)', AppRadius.borderLg),
            _buildRadiusBox('XL (20)', AppRadius.borderXl),
            _buildRadiusBox('XXL (24)', AppRadius.borderXxl),
            _buildRadiusBox('Huge (32)', AppRadius.borderHuge),
            _buildRadiusBox('Circular', AppRadius.borderCircular),
          ],
        ),

        AppSpacing.gapXxl,
        const Text(
          'Ejemplos con Shapes (Botones):',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AppSpacing.gapMd,

        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shape: AppRadius.shapeSm),
              child: const Text('SM'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shape: AppRadius.shapeMd),
              child: const Text('MD'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shape: AppRadius.shapeLg),
              child: const Text('LG'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shape: AppRadius.shapeXl),
              child: const Text('XL'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shape: AppRadius.shapeCircular),
              child: const Text('Circular'),
            ),
          ],
        ),

        AppSpacing.gapXxl,
        const Text(
          'Bordes parciales:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AppSpacing.gapMd,

        Row(
          children: [
            Expanded(
              child: Container(
                height: AppSizes.huge * 2,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: AppRadius.borderTopLg,
                  border: Border.all(color: Colors.blue),
                ),
                child: const Center(child: Text('Top LG')),
              ),
            ),
            AppSpacing.gapHorizontalMd,
            Expanded(
              child: Container(
                height: AppSizes.huge * 2,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: AppRadius.borderBottomLg,
                  border: Border.all(color: Colors.green),
                ),
                child: const Center(child: Text('Bottom LG')),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRadiusBox(String label, BorderRadius radius) {
    return Container(
      width: AppSizes.huge * 2,
      height: AppSizes.huge * 2,
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: radius,
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// Demostración de Sizes
class SizesDemo extends StatelessWidget {
  const SizesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.paddingLg,
      children: [
        Text(
          'AppSizes & AppUI',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        AppSpacing.gapMd,

        const Text(
          'Tamaños de Iconos:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AppSpacing.gapMd,
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _buildIconExample('XS', AppUI.iconXs),
            _buildIconExample('SM', AppUI.iconSm),
            _buildIconExample('MD', AppUI.iconMd),
            _buildIconExample('LG', AppUI.iconLg),
            _buildIconExample('XL', AppUI.iconXl),
            _buildIconExample('XXL', AppUI.iconXxl),
            _buildIconExample('Huge', AppUI.iconHuge),
          ],
        ),

        AppSpacing.gapXxl,
        const Text(
          'Tamaños de Avatares:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AppSpacing.gapMd,
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _buildAvatarExample('XS', AppUI.avatarXs),
            _buildAvatarExample('SM', AppUI.avatarSm),
            _buildAvatarExample('MD', AppUI.avatarMd),
            _buildAvatarExample('LG', AppUI.avatarLg),
            _buildAvatarExample('XL', AppUI.avatarXl),
            _buildAvatarExample('XXL', AppUI.avatarXxl),
            _buildAvatarExample('Huge', AppUI.avatarHuge),
          ],
        ),

        AppSpacing.gapXxl,
        const Text(
          'Elevaciones:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AppSpacing.gapMd,
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            _buildElevationCard('None', AppUI.elevationNone),
            _buildElevationCard('XS (1)', AppUI.elevationXs),
            _buildElevationCard('SM (2)', AppUI.elevationSm),
            _buildElevationCard('MD (4)', AppUI.elevationMd),
            _buildElevationCard('LG (6)', AppUI.elevationLg),
            _buildElevationCard('XL (8)', AppUI.elevationXl),
            _buildElevationCard('XXL (12)', AppUI.elevationXxl),
            _buildElevationCard('Huge (16)', AppUI.elevationHuge),
          ],
        ),

        AppSpacing.gapXxl,
        const Text(
          'Opacidades:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AppSpacing.gapMd,
        Column(
          children: [
            _buildOpacityBar('Hover (0.12)', AppUI.opacityHover),
            _buildOpacityBar('Disabled (0.38)', AppUI.opacityDisabled),
            _buildOpacityBar('Medium (0.54)', AppUI.opacityMedium),
            _buildOpacityBar('Medium High (0.70)', AppUI.opacityMediumHigh),
            _buildOpacityBar('High (0.87)', AppUI.opacityHigh),
            _buildOpacityBar('Full (1.0)', AppUI.opacityFull),
          ],
        ),
      ],
    );
  }

  Widget _buildIconExample(String label, double size) {
    return Column(
      children: [
        Icon(Icons.star, size: size, color: Colors.amber),
        AppSpacing.gapXxs,
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildAvatarExample(String label, double radius) {
    return Column(
      children: [
        CircleAvatar(
          radius: radius / 2,
          backgroundColor: Colors.blue,
          child: Text(
            label[0],
            style: TextStyle(fontSize: radius / 3, color: Colors.white),
          ),
        ),
        AppSpacing.gapXxs,
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildElevationCard(String label, double elevation) {
    return Card(
      elevation: elevation,
      child: Container(
        width: AppSizes.huge * 2,
        height: AppSizes.huge * 1.5,
        padding: AppSpacing.paddingSm,
        child: Center(
          child: Text(label, style: const TextStyle(fontSize: 12)),
        ),
      ),
    );
  }

  Widget _buildOpacityBar(String label, double opacity) {
    return Padding(
      padding: AppSpacing.verticalXs,
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Container(
              height: AppSizes.xl,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(opacity),
                borderRadius: AppRadius.borderSm,
                border: Border.all(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Demostración de Animaciones
class AnimationsDemo extends StatefulWidget {
  const AnimationsDemo({super.key});

  @override
  State<AnimationsDemo> createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<AnimationsDemo> {
  bool _isExpanded = false;
  bool _isVisible = true;
  double _size = 100;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.paddingLg,
      children: [
        Text(
          'AppDurations',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        AppSpacing.gapMd,
        const Text('Ejemplos de duraciones de animación:'),
        AppSpacing.gapXl,

        // AnimatedContainer
        Card(
          child: Padding(
            padding: AppSpacing.paddingMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AnimatedContainer (300ms)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                AppSpacing.gapMd,
                Center(
                  child: AnimatedContainer(
                    duration: AppDurations.md,
                    width: _isExpanded ? 200 : 100,
                    height: _isExpanded ? 200 : 100,
                    decoration: BoxDecoration(
                      color: _isExpanded ? Colors.blue : Colors.red,
                      borderRadius: _isExpanded
                          ? AppRadius.borderXxl
                          : AppRadius.borderMd,
                    ),
                    child: const Center(
                      child: Icon(Icons.animation, color: Colors.white),
                    ),
                  ),
                ),
                AppSpacing.gapMd,
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(_isExpanded ? 'Contraer' : 'Expandir'),
                  ),
                ),
              ],
            ),
          ),
        ),

        AppSpacing.gapXl,

        // AnimatedOpacity
        Card(
          child: Padding(
            padding: AppSpacing.paddingMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AnimatedOpacity (500ms)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                AppSpacing.gapMd,
                Center(
                  child: AnimatedOpacity(
                    duration: AppDurations.xl,
                    opacity: _isVisible ? 1.0 : 0.0,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: AppRadius.borderLg,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.visibility,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                AppSpacing.gapMd,
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: Text(_isVisible ? 'Ocultar' : 'Mostrar'),
                  ),
                ),
              ],
            ),
          ),
        ),

        AppSpacing.gapXl,

        // Duraciones disponibles
        Card(
          child: Padding(
            padding: AppSpacing.paddingMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Duraciones Disponibles:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                AppSpacing.gapMd,
                _buildDurationItem('XXS', '50ms', AppDurations.xxs),
                _buildDurationItem('XS', '100ms', AppDurations.xs),
                _buildDurationItem('SM', '150ms', AppDurations.sm),
                _buildDurationItem('SMD', '200ms', AppDurations.smd),
                _buildDurationItem('MD', '300ms', AppDurations.md),
                _buildDurationItem('LG', '400ms', AppDurations.lg),
                _buildDurationItem('XL', '500ms', AppDurations.xl),
                _buildDurationItem('XXL', '600ms', AppDurations.xxl),
                AppSpacing.gapMd,
                const Divider(),
                AppSpacing.gapMd,
                const Text(
                  'Delays Específicos:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                AppSpacing.gapSm,
                _buildDelayItem('Search Debounce', '300ms'),
                _buildDelayItem('Tooltip Delay', '500ms'),
                _buildDelayItem('Snackbar Duration', '2000ms'),
                _buildDelayItem('Page Transition', '150ms'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDurationItem(String label, String value, Duration duration) {
    return Padding(
      padding: AppSpacing.verticalXxs,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDelayItem(String label, String value) {
    return Padding(
      padding: AppSpacing.verticalXxs,
      child: Row(
        children: [
          const Icon(Icons.timer, size: 16),
          AppSpacing.gapHorizontalXs,
          Expanded(child: Text(label, style: const TextStyle(fontSize: 12))),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
