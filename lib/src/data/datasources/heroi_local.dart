import 'package:coolsql/core/managers/local/local_manager.dart';
import 'package:coolsql/src/data/models/models.dart';
import 'package:flutter/cupertino.dart';

abstract class HeroiLocalSource {
  Future<List<HeroiModel>> pegarHeroisPesquisados();
}

class HeroiLocalSourceImpl implements HeroiLocalSource {
  final LocalManager manager;

  HeroiLocalSourceImpl({
    @required this.manager,
  });

  @override
  Future<List<HeroiModel>> pegarHeroisPesquisados() {
    throw UnimplementedError();
  }
}
