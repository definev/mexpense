// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Trip {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  DateTime get dateOfTrip => throw _privateConstructorUsedError;
  bool get riskAssessment => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String destination,
      DateTime dateOfTrip,
      bool riskAssessment,
      String? description});
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? destination = null,
    Object? dateOfTrip = null,
    Object? riskAssessment = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfTrip: null == dateOfTrip
          ? _value.dateOfTrip
          : dateOfTrip // ignore: cast_nullable_to_non_nullable
              as DateTime,
      riskAssessment: null == riskAssessment
          ? _value.riskAssessment
          : riskAssessment // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$_TripCopyWith(_$_Trip value, $Res Function(_$_Trip) then) =
      __$$_TripCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String destination,
      DateTime dateOfTrip,
      bool riskAssessment,
      String? description});
}

/// @nodoc
class __$$_TripCopyWithImpl<$Res> extends _$TripCopyWithImpl<$Res, _$_Trip>
    implements _$$_TripCopyWith<$Res> {
  __$$_TripCopyWithImpl(_$_Trip _value, $Res Function(_$_Trip) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? destination = null,
    Object? dateOfTrip = null,
    Object? riskAssessment = null,
    Object? description = freezed,
  }) {
    return _then(_$_Trip(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfTrip: null == dateOfTrip
          ? _value.dateOfTrip
          : dateOfTrip // ignore: cast_nullable_to_non_nullable
              as DateTime,
      riskAssessment: null == riskAssessment
          ? _value.riskAssessment
          : riskAssessment // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Trip implements _Trip {
  const _$_Trip(
      {this.id,
      required this.name,
      required this.destination,
      required this.dateOfTrip,
      required this.riskAssessment,
      this.description});

  @override
  final int? id;
  @override
  final String name;
  @override
  final String destination;
  @override
  final DateTime dateOfTrip;
  @override
  final bool riskAssessment;
  @override
  final String? description;

  @override
  String toString() {
    return 'Trip(id: $id, name: $name, destination: $destination, dateOfTrip: $dateOfTrip, riskAssessment: $riskAssessment, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trip &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.dateOfTrip, dateOfTrip) ||
                other.dateOfTrip == dateOfTrip) &&
            (identical(other.riskAssessment, riskAssessment) ||
                other.riskAssessment == riskAssessment) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, destination,
      dateOfTrip, riskAssessment, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripCopyWith<_$_Trip> get copyWith =>
      __$$_TripCopyWithImpl<_$_Trip>(this, _$identity);
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {final int? id,
      required final String name,
      required final String destination,
      required final DateTime dateOfTrip,
      required final bool riskAssessment,
      final String? description}) = _$_Trip;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get destination;
  @override
  DateTime get dateOfTrip;
  @override
  bool get riskAssessment;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_TripCopyWith<_$_Trip> get copyWith => throw _privateConstructorUsedError;
}
