//ValueNotifier: Hold the data
//Usar ValueListenableBuilder: Listen to data (don't need setState)

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
ValueNotifier<String> titleSettings = ValueNotifier("Settings");