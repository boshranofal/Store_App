// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModels {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final RatingModels rating;

  ProductModels({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory ProductModels.fromJson(json) {
    return ProductModels(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      rating: RatingModels.fromJson(json['rating']),
    );
  }
}

class RatingModels {
  final int rating;
  final int count;

  RatingModels({
    required this.rating,
    required this.count,
  });

  factory RatingModels.fromJson(json) {
    return RatingModels(
      rating: json['rate'],
      count: json['count'],
    );
  }
}
