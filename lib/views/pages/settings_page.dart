import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controllerText = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  int? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownButton(
                  value: dropdownValue,
                  items: [
                    DropdownMenuItem(value: 1, child: Text("Item 1")),
                    DropdownMenuItem(value: 2, child: Text("Item 2")),
                    DropdownMenuItem(value: 3, child: Text("Item 3")),
                  ],
                  onChanged: (value) {
                    setState(() => dropdownValue = value);
                  }),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: controllerText,
                onEditingComplete: () => {setState(() {})},
              ),
              Text(controllerText.text),
              Checkbox.adaptive(
                  tristate: true,
                  value: isChecked,
                  onChanged: (bool? value) =>
                      setState(() => isChecked = value)),
              CheckboxListTile.adaptive(
                  tristate: true,
                  title: Text("Click me"),
                  value: isChecked,
                  onChanged: (bool? value) =>
                      setState(() => isChecked = value)),
              Switch.adaptive(
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() => isSwitched = value);
                  }),
              SwitchListTile.adaptive(
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  title: Text("Click me")),
              Slider.adaptive(
                  max: 10.0,
                  value: sliderValue,
                  divisions: 10,
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                  }),
              Text(sliderValue.toInt().toString()),
              InkWell(
                  splashColor: Colors.teal,
                  onTap: () {
                    print("Tapped");
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.white12,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: Text("Click me")),
              ElevatedButton(onPressed: () {}, child: Text("Click me")),
              FilledButton(onPressed: () {}, child: Text("Click me")),
              TextButton(onPressed: () {}, child: Text("Click me"))
            ],
          ),
        ),
      ),
    );
  }
}
