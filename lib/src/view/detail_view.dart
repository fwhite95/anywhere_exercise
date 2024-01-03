import 'package:anywhere_exercise/src/model/character_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  static route(Character character) => MaterialPageRoute(
      builder: (context) => DetailView(
            character: character,
          ));
  final Character character;

  const DetailView({
    required this.character,
    super.key,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Details'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.character.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.character.icon.url.isNotEmpty
                  ? Image.network(
                      'https://duckduckgo.com${widget.character.icon.url}')
                  : Image.network(
                      'https://cdn.icon-icons.com/icons2/2108/PNG/512/flutter_icon_130936.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.character.text,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
