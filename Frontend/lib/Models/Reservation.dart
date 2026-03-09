class Reservation {
  final int? id; // Optional for creation, required for updates
  final String title;
  final DateTime date;

  Reservation({this.id, required this.title, required this.date});

  // Factory constructor to create a Reservation from a JSON map
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as int?,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }

  // Convert Reservation object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date.toIso8601String(), // ISO 8601 format is best for APIs
    };
  }
}