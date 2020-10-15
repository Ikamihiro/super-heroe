import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class HeroiModel extends Heroi {
  HeroiModel({
    @required String response,
    @required String id,
    @required String name,
    @required Powerstats powerstats,
    @required Biography biography,
    @required AppearanceModel appearance,
    @required Work work,
    @required Connections connections,
    @required String image,
  }) : super(
          id: id,
          appearance: appearance,
          biography: biography,
          connections: connections,
          image: image,
          name: name,
          powerstats: powerstats,
          response: response,
          work: work,
        );

  factory HeroiModel.fromMap(Map<String, dynamic> json) {
    return HeroiModel(
      response: json["response"] != null ? json["response"] : 'Response',
      id: json["id"],
      name: json["name"],
      powerstats: PowerstatsModel.fromMap(json["powerstats"]),
      biography: BiographyModel.fromMap(json["biography"]),
      appearance: AppearanceModel.fromMap(json["appearance"]),
      work: WorkModel.fromMap(json["work"]),
      connections: ConnectionsModel.fromMap(json["connections"]),
      image: json["image"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "response": response,
      "id": id,
      "name": name,
      "powerstats": (powerstats as PowerstatsModel).toMap(),
      "biography": (biography as BiographyModel).toMap(),
      "appearance": (appearance as AppearanceModel).toMap(),
      "work": (work as WorkModel).toMap(),
      "connections": (connections as ConnectionsModel).toMap(),
      "image": image,
    };
  }
}
