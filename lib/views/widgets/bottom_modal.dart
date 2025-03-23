import 'package:app_incense/views/data/notifiers.dart';
import 'package:flutter/material.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show Modal'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter the title page',
                      ),
                      controller: controllerText,
                      onEditingComplete: () {
                        setState(() {
                          titleSettings.value = controllerText.text;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => {
                        setState(() {
                          titleSettings.value = controllerText.text;
                        }),
                        Navigator.pop(context)
                        },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}