import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remote_config_app_example/firebase_options.dart';
import 'package:flutter_remote_config_app_example/services/analytics_service.dart';
import 'package:flutter_remote_config_app_example/services/remote_config_service.dart';
import 'package:flutter_remote_config_app_example/utils/color_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        Color color = ref
            .watch(fetchStringConfigStreamProvider(key: 'primaryColor'))
            .when(
          data: (data) {
            return getColor(data);
          },
          error: (error, stack) {
            return Colors.red;
          },
          loading: () {
            return Colors.grey;
          },
        );

        return MaterialApp(
          title: 'Remote Config',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: color),
          ),
          home: const MyHomePage(title: 'Flutter Remote Config'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _currentColorVariant = 'unknown';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    _trackButtonClick();
  }

  Future<void> _trackButtonClick() async {
    final analytics = AnalyticsService();
    await analytics.trackButtonClick(
      buttonVariant: 'floating_action_button',
      colorVariant: _currentColorVariant,
    );

    if (_counter == 5) {
      await analytics.trackConversion(
        testVariant: _currentColorVariant,
        conversionType: 'five_clicks_milestone',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Platform: ${Theme.of(context).platform.name}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Consumer(
                    builder: (context, ref, child) {
                      return ref
                          .watch(fetchStringConfigStreamProvider(
                              key: 'primaryColor'))
                          .when(
                            data: (colorValue) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _currentColorVariant = colorValue;
                              });

                              return Column(
                                children: [
                                  Text(
                                    'A/B Test Variant: $colorValue',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: getColor(colorValue),
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'User is in: ${colorValue.toUpperCase()} group',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              );
                            },
                            error: (error, stack) => Text(
                              'Error: $error',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                            loading: () => const CircularProgressIndicator(),
                          );
                    },
                  ),
                ],
              ),
            ),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_counter >= 5)
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: const Text(
                  '🎉 Milestone Reached!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return ref
              .watch(fetchStringConfigStreamProvider(key: 'buttonText'))
              .when(
                data: (buttonText) => FloatingActionButton.extended(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment Counter',
                  label: Text(buttonText),
                  icon: const Icon(Icons.add),
                ),
                error: (error, stack) => FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                loading: () => FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Loading...',
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              );
        },
      ),
    );
  }
}
