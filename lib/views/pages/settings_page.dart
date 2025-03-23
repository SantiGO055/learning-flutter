import 'package:flutter/material.dart';

import '../data/notifiers.dart';
import '../widgets/bottom_modal.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key
  });

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
        title: ValueListenableBuilder(
          valueListenable: titleSettings,
          builder: (context, selectedPage, child) =>
              Text(titleSettings.value)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("This is a snackbar"),
                        duration: Duration(milliseconds: 1500),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                            label: "Close",
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            })));
                  },
                  child: Text("Open Snackbar")),
              BottomModal(),
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
                  onTap: () {},
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.white12,
                  )),
              ElevatedButton(onPressed: () {}, child: Text("Click me")),
              FilledButton(onPressed: () {}, child: Text("Click me")),
              TextButton(onPressed: () {}, child: Text("Click me")),
            ],
          ),
        ),
      ),
    );
  }
}
