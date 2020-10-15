import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';

class PowerstatsModel extends Powerstats {
  PowerstatsModel({
    @required String intelligence,
    @required String strength,
    @required String speed,
    @required String durability,
    @required String power,
    @required String combat,
  });

  factory PowerstatsModel.fromMap(Map<String, dynamic> json) {
    return PowerstatsModel(
      intelligence: json["intelligence"],
      strength: json["strength"],
      speed: json["speed"],
      durability: json["durability"],
      power: json["power"],
      combat: json["combat"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "intelligence": intelligence,
      "strength": strength,
      "speed": speed,
      "durability": durability,
      "power": power,
      "combat": combat,
    };
  }
}
