import 'package:flutter/material.dart';
import 'package:custom_dropdown/custom_dropdown.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Dropdown Demo')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomDropdown<String>(
                  items: const ['Option 1', 'Option 2', 'Option 3'],
                  onChanged: (value) => print('Selected: $value'),
                  hint: const Text('Select an option'),
                ),
                const SizedBox(height: 20),
                CustomDropdown<int>(
                  items: const [1, 2, 3],
                  itemBuilder: (item) => Text('Item $item'),
                  onChanged: (value) => print('Selected: $value'),
                  decoration: const InputDecoration(
                    labelText: 'Numbers',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}