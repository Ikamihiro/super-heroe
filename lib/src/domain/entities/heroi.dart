import 'entities.dart';

class Heroi {
  Heroi({
    this.response,
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.appearance,
    this.work,
    this.connections,
    this.image,
  });

  String response;
  String id;
  String name;
  Powerstats powerstats;
  Biography biography;
  Appearance appearance;
  Work work;
  Connections connections;
  String image;
}
