import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';

class AppearanceModel extends Appearance {
  AppearanceModel({
    @required String gender,
    @required String race,
    @required List<String> height,
    @required List<String> weight,
    @required String eyeColor,
    @required String hairColor,
  });

  factory AppearanceModel.fromMap(Map<String, dynamic> json) {
    return AppearanceModel(
      gender: json["gender"],
      race: json["race"],
      height: List<String>.from(json["height"].map((x) => x)),
      weight: List<String>.from(json["weight"].map((x) => x)),
      eyeColor: json["eye-color"],
      hairColor: json["hair-color"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "gender": gender,
      "race": race,
      "height": List<dynamic>.from(height.map((x) => x)),
      "weight": List<dynamic>.from(weight.map((x) => x)),
      "eye-color": eyeColor,
      "hair-color": hairColor,
    };
  }
}
