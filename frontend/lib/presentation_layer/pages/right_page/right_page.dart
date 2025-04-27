

import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
class CodeEditorPage extends StatefulWidget {
  const CodeEditorPage({super.key});

  @override
  State<CodeEditorPage> createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  final controller = CodeController(
    text: '...',
    language: python
    // Initial code
  );
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff23241f),
      appBar: AppBar(
        backgroundColor:Color(0xff16151a),
        title: Text("Code editor",
        style: TextStyle(
           color: Colors.white
        ),
        ),
      ),
        body: Column(
          children: [
            Container(
              height: 300,
              child: CodeTheme(
              data: CodeThemeData(
                styles: monokaiSublimeTheme,
              ),
                  child: SingleChildScrollView(
                  child: CodeField(

                  controller: controller,
                  ),
                  ),
                  ),
            ),
            Container(
              color: Colors.blue,
              height: 0.4*screenHeight,
            )
          ],
        ));
  }
}
