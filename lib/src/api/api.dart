import 'package:http/http.dart' show Client;

class CharacterApi {
  Client client = Client();
  final String duck = 'https://duckduckgo.com/';
  final String characterUrl =
      'api.duckduckgo.com/?q=simpsons+characters&format=json';

  Future<dynamic> getCharacters() async {
    try {
      final Uri uri = Uri.http('api.duckduckgo.com', '/',
          {'q': 'simpsons characters', 'format': 'json'});
      final response = await client.get(uri);
      

      return response.body;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
