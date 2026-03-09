

import 'Reservation.dart';

class Patient {
  final int? id;
  final String name;
  final String phonenumber;
  final String? phonenumber2; // The "?" handles the optional field
  final String locationaddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Reservation>? reservations;

  Patient({
     this.id,
    required this.name,
    required this.phonenumber,
    this.phonenumber2,
    required this.locationaddress,
     this.createdAt,
     this.updatedAt,
    this.reservations,
  });

  // Factory constructor to create a Patient instance from a JSON map.
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      phonenumber: json['phonenumber'],
      phonenumber2: json['phonenumber2'],
      locationaddress: json['locationaddress'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      // Handle the nested list of reservations
      reservations: json['reservations'] != null
          ? (json['reservations'] as List)
          .map((res) => Reservation.fromJson(res))
          .toList()
          : null,
    );
  }

  // Method to convert a Patient instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phonenumber': phonenumber,
      'phonenumber2': phonenumber2,
      'locationaddress': locationaddress,
      'reservations': reservations?.map((res) => res.toJson()).toList(),
    };
  }
}