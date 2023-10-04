import 'dart:async';
import 'package:di_test/di/dependencies.dart';
import 'package:flutter/foundation.dart';

/// Инициализирует приложение и возвращает [Dependencies]
Future<Dependencies> $initializeDependencies({
  void Function(int progress, String message)? onProgress,
}) async {
  /// Создаем пустой объект зависимостей
  final dependencies = $MutableDependencies();

  final totalSteps = _initializationSteps.length;

  var currentStep = 0;

  for (final step in _initializationSteps.entries) {
    currentStep++;

    /// Текущий процент выполнения инициализации
    final percent = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
    onProgress?.call(percent, step.key);
    debugPrint(
        'Initialization | $currentStep/$totalSteps ($percent%) | "${step.key}"');
    
    /// Создаем объект и добавляем его в dependencies
    await step.value(dependencies);
  }

  /// Возвращает инициализированные зависимости
  return dependencies.freeze();
}

/// Метод, который создает объект и добавляет его в dependencies
typedef _InitializationStep = FutureOr<void> Function(
    $MutableDependencies dependencies);

/// <Название шага: метод, создающий зависимость>
final Map<String, _InitializationStep> _initializationSteps =
    <String, _InitializationStep>{
  // 'Initialize RequestHandler': (dependencies) {
  //   dependencies.requestHandler =
  //       RequestHandler(metadata: dependencies.appMetadata);
  // },
  //'Observer state managment': (_) => Controller.observer = ControllerObserver(),
  'Initializing analytics': (_) async {/* ... */},
  'Log app open': (_) {},
  'Get remote config': (_) async {/* ... */},
  'Log app initialized': (_) {},
};
