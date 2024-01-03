import 'package:anywhere_exercise/src/controller/character_controller.dart';
import 'package:anywhere_exercise/src/model/duck_model.dart';
import 'package:anywhere_exercise/src/widgets/character_card.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ListViewScreen());

  const ListViewScreen({
    super.key,
  });

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  TextEditingController searchBarController = TextEditingController();
  CharacterController controller = CharacterController();
  String query = '';

  Future<Duck>? _future;

  @override
  void initState() {
    super.initState();
    _future = controller.getDuck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: SearchBar(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    controller: searchBarController,
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('${snapshot.error} occurred'),
                          );
                        } else if (snapshot.hasData) {
                          final duck = snapshot.data;

                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: duck!.relatedTopics.length,
                            itemBuilder: (context, index) {
                              return CharacterCard(
                                character: duck.relatedTopics[index],
                                query: query,
                              );
                            },
                          );
                        }
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
