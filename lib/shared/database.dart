import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

final sqliteDatabaseProvider = FutureProvider<Database>((ref) async {
  try {
    final db = sqlite3.open(join((await getApplicationSupportDirectory()).path, 'trips.db'));
    db.execute('''
    CREATE TABLE IF NOT EXISTS trips (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      destination TEXT NOT NULL,
      dateOfTrip INTEGER NOT NULL,
      riskAssessment INTEGER NOT NULL,
      description TEXT
    );
  ''');
    return db;
  } catch (e) {
    rethrow;
  }
});
