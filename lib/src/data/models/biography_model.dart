import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';

class BiographyModel extends Biography {
  BiographyModel({
    @required String fullName,
    @required String alterEgos,
    @required List<String> aliases,
    @required String placeOfBirth,
    @required String firstAppearance,
    @required String publisher,
    @required String alignment,
  });

  factory BiographyModel.fromMap(Map<String, dynamic> json) {
    return BiographyModel(
      fullName: json["full-name"],
      alterEgos: json["alter-egos"],
      aliases: List<String>.from(json["aliases"].map((x) => x)),
      placeOfBirth: json["place-of-birth"],
      firstAppearance: json["first-appearance"],
      publisher: json["publisher"],
      alignment: json["alignment"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "full-name": fullName,
      "alter-egos": alterEgos,
      "aliases": List<dynamic>.from(aliases.map((x) => x)),
      "place-of-birth": placeOfBirth,
      "first-appearance": firstAppearance,
      "publisher": publisher,
      "alignment": alignment,
    };
  }
}
