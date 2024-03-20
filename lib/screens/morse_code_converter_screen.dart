import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/morse_code_converter_form.dart';

class MorseCodeConverterScreen extends StatelessWidget {
  const MorseCodeConverterScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Morse Code Converter'),
      ), 
      body:const Padding(
        padding:  EdgeInsets.all(20.0),
        child: const MorseCodeConverterForm(),
      ),
    );
  }
}
