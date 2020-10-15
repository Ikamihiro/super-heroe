import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';

class WorkModel extends Work {
  WorkModel({
    @required String occupation,
    @required String base,
  });

  factory WorkModel.fromMap(Map<String, dynamic> json) {
    return WorkModel(
      occupation: json["occupation"],
      base: json["base"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "occupation": occupation,
      "base": base,
    };
  }
}
