import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/app/meet_sync_app.dart';
import 'package:meetsync/src/bootstrap/bootstrap.dart';

Future<void> main() async {
  final scope = await bootstrap();

  runApp(
    ProviderScope(
      overrides: scope.overrides,
      child: const MeetSyncApp(),
    ),
  );
}
