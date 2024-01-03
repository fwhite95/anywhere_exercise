import 'package:anywhere_exercise/src/model/character_model.dart';
import 'package:anywhere_exercise/src/view/detail_view.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final String query;

  const CharacterCard({
    required this.character,
    required this.query,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return character.name.toLowerCase().contains(query.toLowerCase()) ||
            character.text.toLowerCase().contains(query.toLowerCase())
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          character.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(15),
                    //   child: Text(
                    //     character.text,
                    //     style: const TextStyle(
                    //       fontSize: 16,
                    //     ),
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 6,
                    //   ),
                    // ),
                  ],
                ),
              ),
              onTap: () =>
                  {Navigator.of(context).push(DetailView.route(character))},
            ),
          )
        : const SizedBox();
  }
}
