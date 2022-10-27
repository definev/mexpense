import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_image_swiper/shared/database.dart';
import 'package:random_image_swiper/shared/trip.dart';

final tripsProvider = FutureProvider<List<Trip>>((ref) async {
  final db = ref.watch(sqliteDatabaseProvider).mapOrNull(data: (data) => data.value);
  if (db == null) return [];
  final result = db.select('SELECT * FROM trips ORDER BY id DESC');

  if (result.isEmpty) return [];
  return result.map((raw) => Trip.fromJson(raw)).toList();
});
