import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/presentation/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rick and morty Characters"),
        ),
        body: FutureBuilder(
            future: provider.getCharacters(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(
                        snapshot.data?[index].id ?? "",
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "${snapshot.data?[index].name ?? ""}\n${snapshot.data?[index].species ?? ""}",
                        textAlign: TextAlign.center,
                      )),
                );
              }
            }));
  }
}
