import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    int? id,
    required String name,
    required String destination,
    required DateTime dateOfTrip,
    required bool riskAssessment,
    String? description,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      name: json['name'],
      destination: json['destination'],
      dateOfTrip: DateTime.fromMillisecondsSinceEpoch(json['dateOfTrip']),
      riskAssessment: json['riskAssessment'] == 1,
      description: json['description'],
    );
  }
}
