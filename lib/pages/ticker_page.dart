import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/providers/ticker_provider.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticker = ref.watch(tickerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticker'),
      ),
      body: ticker.when(
        data: (value) => Center(
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        error: (e, st) => Center(
          child: Text(
            e.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
