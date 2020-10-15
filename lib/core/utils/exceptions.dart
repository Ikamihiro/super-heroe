import 'package:flutter/foundation.dart';

class GenericException implements Exception {
  final String erro;

  GenericException({
    @required this.erro,
  });
}

class RequestException implements Exception {
  final String erro;

  RequestException({
    @required this.erro,
  });
}
