
class EcommerceModel {
  late int total, skip, limit;
  late List<Products> products;

  EcommerceModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.products,
  });

  factory EcommerceModel.fromJson(Map m1) {
    return EcommerceModel(
      total: m1['total'],
      skip: m1['skip'],
      limit: m1['limit'],
      products: (m1['products'] as List)
          .map(
            (e) => Products.fromJson(e),
          )
          .toList(),
    );
  }
}

class Products {
  late dynamic id,
      price,
      discountPercentage,
      ratings,
      stocks,
      weight,
      minimumOrderQuantity;
  late dynamic title,
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
  late List<Reviews> reviews;
  late List images;
  late Meta meta;
  late Dimensions dimensions;

  Products({
    required this.id,
    required this.price,
    required this.discountPercentage,
    required this.ratings,
    required this.stocks,
    required this.weight,
    required this.minimumOrderQuantity,
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
    required this.reviews,
    required this.images,
    required this.meta,
    required this.dimensions,
  });

  factory Products.fromJson(Map m1) {
    return Products(
        id: m1['id'].toDouble(),
        price: m1['price'].toDouble(),
        discountPercentage: m1['discountPercentage'].toDouble(),
        ratings: m1['ratings'].toDouble(),
        stocks: m1['stocks'].toDouble(),
        weight: m1['weight'].toDouble(),
        minimumOrderQuantity: m1['minimumOrderQuantity'].toDouble(),
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
        reviews: (m1['reviews'] as List)
            .map(
              (e) => Reviews.fromJson(e),
            )
            .toList(),
        images: m1['images'],
        meta: m1['meta'],
        dimensions: m1['dimensions']);
  }
}

class Dimensions {
  late int width, height, depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

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
        reviewerEmail: m1['reviewerEmail']);
  }
}

class Meta {
  late String createdAt, updatedAt, barcode, qrCode;

  Meta(
      {required this.createdAt,
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
