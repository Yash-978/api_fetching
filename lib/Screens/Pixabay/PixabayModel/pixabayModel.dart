import 'package:flutter/material.dart';

class PixabayModel {

  late List<Hits> hits = [];

  PixabayModel({ required this.hits});

  factory PixabayModel.fromJson(Map m1) {
    return PixabayModel(

        hits: (m1['hits'] as List)
            .map(
              (e) => Hits.fromJson(e),
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

  factory Hits.fromJson(Map m1) {
    return Hits(
        pageURL: m1['pageURL'],
        largeImageURL: m1['largeImageURL'],
        user: m1['user'],
        userImageURL: m1['userImageURL']);
  }
}
