import 'dart:convert';

import 'package:anywhere_exercise/src/api/api.dart';
import 'package:anywhere_exercise/src/model/duck_model.dart';

class CharacterController {
  CharacterApi characterApi = CharacterApi();

  Future<Duck> getDuck() async {
    final body = await characterApi.getCharacters();
    print('body: $body');
    Map<String, dynamic> map = jsonDecode(body);
    final Duck duck = Duck.fromMap(map);

    return duck;
  }
}
