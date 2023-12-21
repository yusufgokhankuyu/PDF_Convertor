import 'package:create_pdf/api/pdf_paragrapgh_api.dart';
import 'package:flutter/material.dart';
import 'package:create_pdf/api/pdf_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate PDF"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(250, 50)),
              ),
              onPressed: () async {
                try {
                  final pdfFile =
                      await PdfApi.generateCenteredText('Bu bir denemedir');
                  PdfApi.openFile(pdfFile);
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: const Text("Simple PDF")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(250, 50)),
              ),
              onPressed: () async {
                final pdfFile = await PdfParagraphApi.generate();
                PdfApi.openFile(pdfFile);
              },
              child: const Text("Paragraphs PDF")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(250, 50)),
              ),
              onPressed: () async {
                final pdfFile = await PdfApi.generateTable();
                PdfApi.openFile(pdfFile);
              },
              child: const Text("Table PDF")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(250, 50)),
              ),
              onPressed: () async {
                final pdfFile = await PdfApi.generateImage();
                PdfApi.openFile(pdfFile);
              },
              child: const Text("Image PDF")),
        ]),
      ),
    );
  }
}
