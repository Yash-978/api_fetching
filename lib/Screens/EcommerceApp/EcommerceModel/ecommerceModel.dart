import 'package:flutter/material.dart';

class EcommerceModel {
  late List<Products> products;
  late int total, skip, limit;

  EcommerceModel({required this.products,
    required this.total,
    required this.skip,
    required this.limit});

  factory EcommerceModel.fromJson(Map m1)
  {
    return EcommerceModel(products: (m1['products'] as List)
        .map((e) => Products.fromJson(e),)

        .toList(), total: m1['total'], skip: m1['skip'], limit: m1['limit']);
  }
}

class Products {
  late Dimensions dimensions;
  late List<Reviews> reviews;
  late Meta meta;
  late int id,
      price,
      discountPercentage,
      minimumOrderQuantity,
      ratings,
      stocks,
      weight;
  late String title,
      description,
      category,
      brand,
      sku,
      warrantyInformation,
      shippingInformation,
      availabilityStatus,
      returnPolicy,
      thumbnail;
  late List tags;
  late List images;

  Products({
    required this.dimensions,
    required this.reviews,
    required this.meta,
    required this.id,
    required this.price,
    required this.discountPercentage,
    required this.minimumOrderQuantity,
    required this.ratings,
    required this.stocks,
    required this.weight,
    required this.title,
    required this.description,
    required this.category,
    required this.brand,
    required this.sku,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.returnPolicy,
    required this.thumbnail,
    required this.tags,
    required this.images,
  });

  factory Products.fromJson(Map m1) {
    return Products(
        dimensions: Dimensions.fromJson(m1['dimensions']),
        reviews: (m1['reviews'] as List)
            .map(
              (e) => Reviews.fromJson(e),
        )
            .toList(),
        meta: m1['meta'],
        id: m1['id'],
        price: m1['price'],
        discountPercentage: m1['discountPercentage'],
        minimumOrderQuantity: m1['minimumOrderQuantity'],
        ratings: m1['ratings'],
        stocks: m1['stocks'],
        weight: m1['weight'],
        title: m1['title'],
        description: m1['description'],
        category: m1['category'],
        brand: m1['brand'],
        sku: m1['sku'],
        warrantyInformation: m1['warrantyInformation'],
        shippingInformation: m1['shippingInformation'],
        availabilityStatus: m1['availabilityStatus'],
        returnPolicy: m1['returnPolicy'],
        thumbnail: m1['thumbnail'],
        tags: m1['tags'],
        images: m1['images']);
  }
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

class Meta {
  late String createdAt, updatedAt, barcode, qrCode;

  Meta({required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode});

  factory Meta.fromJson(Map m1) {
    return Meta(
        createdAt: m1['createdAt'],
        updatedAt: m1['updatedAt'],
        barcode: m1['barcode'],
        qrCode: m1['qrCode']);
  }
}
