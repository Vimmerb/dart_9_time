import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intl Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateFormat _dateFormat;
  late DateFormat _timeFormat;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _setLocale('ru');
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intl Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_dateFormat.format(dateTime)),
            Text(_timeFormat.format(dateTime)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _setLocale(String locale) {
    _dateFormat = DateFormat.yMMMMd(locale);
    _timeFormat = DateFormat.Hms(locale);
  }

  void _refresh() {
    setState(() {});
  }
}
