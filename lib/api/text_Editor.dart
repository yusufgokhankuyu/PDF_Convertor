// ignore_for_file: avoid_print

import 'package:create_pdf/api/pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html/parser.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  HtmlEditorController controller = HtmlEditorController();
  TextEditingController plainTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Editor"),
      ),
      body: Column(
        children: [
          HtmlEditor(
            htmlToolbarOptions:
                const HtmlToolbarOptions(toolbarType: ToolbarType.nativeGrid),
            controller: controller,
            htmlEditorOptions:
                const HtmlEditorOptions(hint: 'Your text here ...'),
            otherOptions: const OtherOptions(height: 400),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  final htmlContent = await controller.getText();
                  _convertHtmlToPdf(htmlContent);
                  print(
                      "html ::::::::::::::::::::::::::::::::::::: $htmlContent");
                  // final pdfFile =
                  //     await PdfApi.generateCenteredText(htmlContent.toString());
                  // PdfApi.openFile(pdfFile);
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: const Text("print"))
        ],
      ),
    );
  }

  String _convertHtmlToPlainText(String htmlText) {
    final document = parse(htmlText);
    final String plainText = parse(document.body!.text).documentElement!.text;
    return plainText;
  }

  void _convertHtmlToPdf(String htmlContent) async {
    final plainTextContent = await _convertHtmlToPlainText(htmlContent);
    final pdfFile = await PdfApi.generateCenteredText(plainTextContent);
    PdfApi.openFile(pdfFile);
  }
}
