import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  static const routeName = "third_page";

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController _textController = TextEditingController();
  backToHome(context, routeName) {}
  int numberTiles = 1;
  String tileText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: "Enter the title",
            ),
          ),
          OutlinedButton(
              onPressed: () {
                setState(() {
                  numberTiles = numberTiles + 1;
                  tileText = _textController.text == "" ? "Default Tile" : _textController.text;
                });
              },
              child: const Text("Add a tile")),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: index.isEven ? Colors.blue : Colors.orange,
                  child: ListTile(
                      leading: const Icon(Icons.date_range),
                      trailing: const Icon(Icons.arrow_back),
                      title: Text(tileText),
                      subtitle: const Text("This will pop the current page"),
                      onTap: () {}),
                );
              },
              itemCount: numberTiles,
            ),
          ),
        ],
      ),
    );
  }
}
