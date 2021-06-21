import 'package:payflow/counter_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
      theme: ThemeData.dark(),
    ),
  );
}
