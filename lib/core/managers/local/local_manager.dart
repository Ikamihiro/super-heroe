import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalManagerImpl implements LocalManager {
  @override
  Future<Map<String, dynamic>> read({
    String chave,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final objectString = prefs.getString(chave) ?? '';

    if (objectString != "") {
      return json.decode(objectString) as Map<String, dynamic>;
    }

    return null;
  }

  @override
  Future<void> remove({
    String chave,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(chave);
  }

  @override
  Future<void> save({
    Map<String, dynamic> dados,
    String chave,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final stringDados = json.encode(dados);

    await prefs.setString(chave, stringDados);
  }
}

abstract class LocalManager<T> {
  Future<void> save({
    @required Map<String, dynamic> dados,
    @required String chave,
  });

  Future<Map<String, dynamic>> read({
    @required String chave,
  });

  Future<void> remove({
    @required String chave,
  });
}
