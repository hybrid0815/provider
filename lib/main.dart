import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/counter_page.dart';
import 'package:provider/pages/ticker_page.dart';
import 'package:provider/pages/user_list_page.dart';
import 'package:provider/widgets/cutsom_button.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Stream Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Stream Provider'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(40),
          shrinkWrap: true,
          children: const [
            Center(
                child: Text(
              'FUTURE PROVIDER',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            CustomButton(
              title: 'Users',
              child: UserListPage(),
            ),
            SizedBox(height: 20),
            Center(
                child: Text(
              'STREAM PROVIDER',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            CustomButton(
              title: 'Ticker',
              child: TickerPage(),
            ),
            SizedBox(height: 20),
            Center(
                child: Text(
              'NOTIFIER PROVIDER',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            CustomButton(
              title: 'Counter',
              child: CounterPage(),
            ),
          ],
        ),
      ),
    );
  }
}
