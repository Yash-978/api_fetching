import 'package:flutter/material.dart';

class PixabayModel {
  late int totalHits;
  late List<Hits> hits = [];

  PixabayModel({required this.totalHits, required this.hits});

  factory PixabayModel.fromApi(Map m1) {
    return PixabayModel(
        totalHits: m1['totalHits'],
        hits: (m1['hits'] as List)
            .map(
              (e) => Hits.fromApi(e),
        )
            .toList());
  }
}

class Hits {
  late String pageURL, largeImageURL, user, userImageURL;

  Hits({
    required this.pageURL,
    required this.largeImageURL,
    required this.user,
    required this.userImageURL,
  });

  factory Hits.fromApi(Map m1) {
    return Hits(
        pageURL: m1['pageURL'],
        largeImageURL: m1['largeImageURL'],
        user: m1['user'],
        userImageURL: m1['userImageURL']);
  }
}
