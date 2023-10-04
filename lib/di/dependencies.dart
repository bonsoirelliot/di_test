import 'package:di_test/di/inherited_dependencies.dart';
import 'package:flutter/material.dart';

/// Dependencies
abstract interface class Dependencies {
  /// Ближайший по дереву объект [Dependencies]
  factory Dependencies.of(BuildContext context) {
    return InheritedDependencies.of(context);
  }

  /// Тут определяем зависимости
  // abstract final SomeDependecy someDependecy;
}

/// Мутабельные зависимости
///
/// Используются в процессе инициализации
final class $MutableDependencies implements Dependencies {
  $MutableDependencies() : context = <String, Object?>{};

  /// Пока не понял, для чего он нужен
  final Map<Object?, Object?> context;

  // @override
  // late SomeDependecy someDependecy;

  Dependencies freeze() => _$ImmutableDependencies(
      /*
    {someDependency: someDependency} 
    */
      );
}

/// Иммутабельные
///
/// Ловятся через [InheritedDependencies.of(context)]
final class _$ImmutableDependencies implements Dependencies {
  _$ImmutableDependencies(
      /*
    {
      required this.someDependecy,
    }
    */
      );

  // @override
  // final SomeDependecy someDependecy;
}
