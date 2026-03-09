class Med {
  final int? id;
  final String name;
  final double price;
  final int stock;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Sale>? sales;

  Med({
    this.id,
    required this.name,
    required this.price,
    required this.stock,
    this.createdAt,
    this.updatedAt,
    this.sales,
  });

  // Factory constructor to create a Med instance from JSON
  factory Med.fromJson(Map<String, dynamic> json) {
    return Med(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      stock: json['stock'],
      createdAt:
      json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
      json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      sales: json['sales'] != null
          ? (json['sales'] as List)
          .map((sale) => Sale.fromJson(sale))
          .toList()
          : null,
    );
  }

  // Convert Med object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'stock': stock,
      'sales': sales?.map((sale) => sale.toJson()).toList(),
    };
  }
}

class Sale {
  final int? id;
  final int quantity;
  final double total;
  final int medId;
  final DateTime? createdAt;

  Sale({
    this.id,
    required this.quantity,
    required this.total,
    required this.medId,
    this.createdAt,
  });

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      id: json['id'],
      quantity: json['quantity'],
      total: (json['total'] as num).toDouble(),
      medId: json['medId'],
      createdAt:
      json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'total': total,
      'medId': medId,
    };
  }
}