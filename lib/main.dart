import 'dart:async';

import 'package:di_test/di/dependencies.dart';
import 'package:di_test/di/inherited_dependencies.dart';
import 'package:di_test/di/initialization.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () async {
      $initializeApp(
        onSuccess: (dependencies) {
          runApp(
            MyApp(
              dependencies: dependencies,
            ),
          );
        },
      ).ignore();
    },
    (error, stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.dependencies,
    super.key,
  });

  final Dependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return InheritedDependencies(
      dependencies: dependencies,
      child: const MaterialApp(
        title: 'DI Demo',
        home: Scaffold(),
      ),
    );
  }
}
