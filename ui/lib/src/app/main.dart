import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Storybook(
        stories: [
          Story(
            name: 'Custom Button',
            description: 'Example custom button.',
            builder: (context) => ElevatedButton(
              child: Text(context.knobs.text(label: 'Click', initial: 'Test')),
              onPressed: () {},
            ),
          ),
        ],
      );
}
