import 'dart:convert';
import 'package:coolsql/core/utils/constants.dart';
import 'package:coolsql/core/utils/exceptions.dart';
import 'package:http/http.dart' as http;

class HttpManagerImpl implements HttpManager {
  static const hostUrl = URL_BASE;

  _decodeResponse(response) {
    final responseJson = json.decode(utf8.decode(response.bodyBytes));
    print(responseJson);

    if (response.statusCode == 200) {
      return responseJson;
    }

    var error = json.decode(response.body.toString())['error_description'];

    switch (response.statusCode) {
      case 400:
        throw GenericException(
          erro: 'RequisiÃ§Ã£o invÃ¡lida: ' + error,
        );
      case 401:
        throw GenericException(
          erro: 'RequisiÃ§Ã£o nÃ£o autorizada: ' + error,
        );
      default:
        throw GenericException(
          erro: 'Erro de conexÃ£o com o servidor: ' + error,
        );
    }
  }

  @override
  Future deleteRequest(String url, {header}) async {
    try {
      final response = await http.delete(
        hostUrl + url,
        headers: header,
      );

      return _decodeResponse(response);
    } catch (e) {}
  }

  @override
  Future getRequest(String url) async {
    try {
      final response = await http.get(
        hostUrl + url,
      );

      return _decodeResponse(response);
    } catch (e) {}
  }

  @override
  Future postRequest(String url, {header, body}) async {
    try {
      final response = await http.post(
        hostUrl + url,
        headers: header,
        body: body,
      );

      return _decodeResponse(response);
    } catch (error) {
      throw error;
    }
  }

  @override
  Future putRequest(String url, {header, body}) {
    throw UnimplementedError();
  }
}

abstract class HttpManager {
  Future<dynamic> getRequest(String url);
  Future<dynamic> postRequest(String url, {dynamic header, dynamic body});
  Future<dynamic> putRequest(String url, {dynamic header, dynamic body});
  Future<dynamic> deleteRequest(String url, {dynamic header});
}
