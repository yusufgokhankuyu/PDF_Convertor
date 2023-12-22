import 'package:create_pdf/api/pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEXT EDİTOR"),
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
          // ElevatedButton(
          //     onPressed: () async {
          //       try {
          //         //final htmlContent = controller.editorController.toString();
          //         // print(
          //         //     "html ::::::::::::::::::::::::::::::::::::: $htmlContent");
          //         final pdfFile =
          //             await PdfApi.generateCenteredText(htmlContent.toString());
          //         PdfApi.openFile(pdfFile);
          //       } catch (e) {
          //         print('Error: $e');
          //       }
          //     },
          //     child: Text("Convert to Pdf"))
        ],
      ),
    );
  }
}
