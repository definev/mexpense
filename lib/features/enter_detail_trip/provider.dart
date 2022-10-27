import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_image_swiper/shared/database.dart';
import 'package:random_image_swiper/shared/trip.dart';

Future<bool> createTripProvider(WidgetRef ref, Trip trip) async {
  final db = ref.watch(sqliteDatabaseProvider).whenOrNull(data: (data) => data)!;
  db.prepare('INSERT INTO trips (name,destination,dateOfTrip,riskAssessment,description) VALUES (?,?,?,?,?)') //
    ..execute([
      trip.name,
      trip.destination,
      trip.dateOfTrip.microsecondsSinceEpoch,
      trip.riskAssessment ? 1 : 0,
      trip.description,
    ])
    ..dispose();

  return true;
}
