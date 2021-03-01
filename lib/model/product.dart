import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
  });

  String id;
  String name;
  String description;
  String imageUrl;
  int price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "price": price,
      };
}
