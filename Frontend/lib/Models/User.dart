class User {
  final int? id;
  final String name;
  final String phone;

  User({this.id, required this.name, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
  };
}