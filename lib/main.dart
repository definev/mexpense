import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_image_swiper/features/trips_view/trips_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TripsView(),
    );
  }
}
