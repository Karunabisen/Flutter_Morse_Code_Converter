import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/morse_code.dart';

class MorseCodeConverterForm extends StatefulWidget {
  const MorseCodeConverterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MorseCodeConverterFormState createState() =>
      _MorseCodeConverterFormState();
}

class _MorseCodeConverterFormState extends State<MorseCodeConverterForm> {
  final TextEditingController _morseCodeController = TextEditingController();
  String _convertedText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _morseCodeController,
          decoration: const InputDecoration(
            labelText: 'Enter Morse Code',
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _convertedText =
                  convertToText(_morseCodeController.text);
            });
          },
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Converted Text:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          _convertedText,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  String convertToText(String morseCode) {
  if (morseCode.isEmpty) {
    return ''; // Return empty string for empty input
  }

  // Replace '/' with ' ' to handle word separation
  morseCode = morseCode.replaceAll('/', ' ');

  List<String> morseWords = morseCode.split('   ');
  String convertedText = '';

  for (String morseWord in morseWords) {
    List<String> morseLetters = morseWord.split(' ');

    for (int i = 0; i < morseLetters.length; i++) {
      String morseLetter = morseLetters[i];
      if (morseLetter.isNotEmpty) {
        String text = morseToTextMap.containsKey(morseLetter)
            ? morseToTextMap[morseLetter]!.toLowerCase()
            : '?';
        if (i == 0) {
          text = text.toUpperCase(); // Capitalize first letter of word
        }
        convertedText += text + ' '; // Add space between letters
      }
    }
    convertedText += '   '; // Add three spaces between words
  }

  // Trim trailing spaces
  convertedText = convertedText.trimRight();

  return convertedText;
}
}