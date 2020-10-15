import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';

class ConnectionsModel extends Connections {
  ConnectionsModel({
    @required String groupAffiliation,
    @required String relatives,
  });

  factory ConnectionsModel.fromMap(Map<String, dynamic> json) {
    return ConnectionsModel(
      groupAffiliation: json["group-affiliation"],
      relatives: json["relatives"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "group-affiliation": groupAffiliation,
      "relatives": relatives,
    };
  }
}
