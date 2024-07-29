import 'package:flutter/material.dart';

class EcommerceModel {
  late List<Products> products;
  late int total, skip, limit;
}

class Products {
  late Dimensions dimensions;
  late List<Reviews> reviews;
  late int id, price, discountPercentage, ratings, stocks, weight;
  late String title,
      description,
      category,
      brand,
      sku,
      warrantyInformation,
      shippingInformation,
      availabilityStatus;
  late List tags;
}



class Dimensions {
  late int width, height, depth;

  Dimensions({required this.width, required this.height, required this.depth});

  factory Dimensions.fromJson(Map m1) {
    return Dimensions(
        width: m1['width'], height: m1['height'], depth: m1['depth']);
  }
}

class Reviews {
  late int ratings;
  late String comment, date, reviewerName, reviewerEmail;

  Reviews({
    required this.ratings,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Reviews.fromJson(Map m1) {
    return Reviews(
      ratings: m1['ratings'],
      comment: m1['comment'],
      date: m1['date'],
      reviewerName: m1['reviewerName'],
      reviewerEmail: m1['reviewerEmail'],
    );
  }
}
