// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModels {
  final dynamic id;
  final String title;
  final String description;
  final double price;
  final String image;
  final RatingModels rating;
  final String category;

  ProductModels({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) {
    return ProductModels(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price']?.toDouble() ?? 0.0,
      image: json['image'],
      rating: RatingModels.fromJson(json['rating']),
      category: json['category'],
    );
  }
}

class RatingModels {
  final double rating;
  final int count;

  RatingModels({
    required this.rating,
    required this.count,
  });

  factory RatingModels.fromJson(json) {
    return RatingModels(
      rating: json['rate']?.toDouble() ?? 0.0,
      count: json['count'] ?? 0,
    );
  }
}
