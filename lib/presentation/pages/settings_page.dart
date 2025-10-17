import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainMarding,
        child: Consumer<ContentSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  AppStrings.textFont,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appTheme.colorScheme.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: <int, Widget>{
                    0: Text(
                      'Gilroy',
                      style: appTheme.textTheme.bodyLarge,
                    ),
                    1: Text(
                      'Montserrat',
                      style: appTheme.textTheme.bodyLarge,
                    ),
                    2: Text(
                      'Raleway',
                      style: appTheme.textTheme.bodyLarge,
                    ),
                  },
                  groupValue: settingsState.fontIndex,
                  onValueChanged: (int? index) {
                    settingsState.fontIndex = index!;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.alignText,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appTheme.colorScheme.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Icon(CupertinoIcons.text_alignleft),
                    1: Icon(CupertinoIcons.text_aligncenter),
                    2: Icon(CupertinoIcons.text_alignright),
                    3: Icon(CupertinoIcons.text_justify),
                  },
                  groupValue: settingsState.textAlignIndex,
                  onValueChanged: (int? index) {
                    settingsState.textAlignIndex = index!;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.textSize,
                ),
                Slider(
                  value: settingsState.textSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label: settingsState.textSize.round().toString(),
                  onChanged: (double? size) {
                    settingsState.textSize = size!;
                  },
                ),
                Card(
                  shape: AppStyles.mainShape,
                  child: ListTile(
                    shape: AppStyles.mainShape,
                    contentPadding: AppStyles.mainMardingMini,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    title: Text(
                      AppStrings.textColor,
                      style: appTheme.textTheme.bodyMedium,
                    ),
                    leading: Icon(
                      Icons.palette_outlined,
                      color: appTheme.brightness == Brightness.dark
                          ? settingsState.darkTextColor
                          : settingsState.lightTextColor,
                    ),
                    trailing: Card(
                      margin: EdgeInsets.zero,
                      shape: AppStyles.mainShape,
                      color: appTheme.colorScheme.inversePrimary,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text(
                                      AppStrings.forLightTheme,
                                      textAlign: TextAlign.center,
                                    ),
                                    shape: AppStyles.mainShape,
                                    content: Material(
                                      color: Colors.transparent,
                                      child: MaterialColorPicker(
                                        onlyShadeSelection: true,
                                        onColorChange: (Color color) {
                                          settingsState.lightTextColor =
                                              color;
                                        },
                                        selectedColor:
                                            settingsState.lightTextColor,
                                      ),
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        shape: AppStyles.mainShape,
                                        child: const Text(
                                          AppStrings.close,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    settingsState.lightTextColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text(
                                      AppStrings.forDarkTheme,
                                      textAlign: TextAlign.center,
                                    ),
                                    shape: AppStyles.mainShape,
                                    content: Material(
                                      color: Colors.transparent,
                                      child: MaterialColorPicker(
                                        onlyShadeSelection: true,
                                        onColorChange: (Color color) {
                                          settingsState.darkTextColor = color;
                                        },
                                        selectedColor:
                                            settingsState.darkTextColor,
                                      ),
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        shape: AppStyles.mainShape,
                                        child: const Text(
                                          AppStrings.close,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: settingsState.darkTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SwitchListTile(
                  value: settingsState.wakeLock,
                  onChanged: (bool? onChanged) {
                    settingsState.wakeLock = onChanged!;
                  },
                  contentPadding: AppStyles.mainMardingHorizontalMini,
                  title: Text(
                    AppStrings.displayAlways,
                    style: appTheme.textTheme.bodyMedium,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
