// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:create_pdf/api/pdf_paragrapgh_api.dart';
import 'package:create_pdf/api/text_Editor.dart';
import 'package:flutter/material.dart';
import 'package:create_pdf/api/pdf_api.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          // const SizedBox(
          //   height: 20,
          // ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextEditor(),
                    ));
              },
              child: const Text("Text Editor")),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              try {
                final pdfFile =
                    await PdfApi.generateCenteredText('Bu bir denemedir');
                PdfApi.openFile(pdfFile);
              } catch (e) {
                print('Error: $e');
              }
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 100,
                    height: MediaQuery.sizeOf(context).height / 5.5,
                    child: Image.asset(
                      "assets/pdf.png",
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text.rich(TextSpan(
                      text: 'Convert your \nsample ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: 'text',
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' files to PDF easily',
                            style: GoogleFonts.quicksand(fontSize: 16)),
                      ],
                    )),
                  ),
                  const Icon(
                    Icons.text_snippet_outlined,
                    color: Colors.red,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              try {
                final pdfFile = await PdfParagraphApi.generate();
                PdfApi.openFile(pdfFile);
              } catch (e) {
                print("Error: :::::::::" + e.toString());
              }
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.description,
                    color: Colors.red,
                    size: 35,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text.rich(TextSpan(
                      text: 'You can convert your \nsample ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: 'paragraph',
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' files to PDF',
                            style: GoogleFonts.quicksand(fontSize: 16)),
                      ],
                    )),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 100,
                      height: MediaQuery.sizeOf(context).height / 5.5,
                      child: Image.asset(
                        "assets/pdf.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              final pdfFile = await PdfApi.generateTable();
              PdfApi.openFile(pdfFile);
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 100,
                    height: MediaQuery.sizeOf(context).height / 5.5,
                    child: Image.asset(
                      "assets/pdf.png",
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text.rich(TextSpan(
                      text: 'You can convert your \nsample ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: 'table',
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' files to PDF',
                            style: GoogleFonts.quicksand(fontSize: 16)),
                      ],
                    )),
                  ),
                  const Icon(
                    Icons.table_chart_outlined,
                    color: Colors.red,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              final pdfFile = await PdfApi.generateImage();
              PdfApi.openFile(pdfFile);
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.image,
                    color: Colors.red,
                    size: 35,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text.rich(TextSpan(
                      text: 'You can convert your \nsample ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: 'image',
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' files to PDF',
                            style: GoogleFonts.quicksand(fontSize: 16)),
                      ],
                    )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 100,
                    height: MediaQuery.sizeOf(context).height / 5.5,
                    child: Image.asset(
                      "assets/pdf.png",
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ElevatedButton(
          //     style: ButtonStyle(
          //       minimumSize: MaterialStateProperty.all(const Size(250, 50)),
          //     ),
          //     onPressed: () async {
          //       try {
          //         final pdfFile =
          //             await PdfApi.generateCenteredText('Bu bir denemedir');
          //         PdfApi.openFile(pdfFile);
          //       } catch (e) {
          //         print('Error: $e');
          //       }
          //     },
          //     child: const Text("Simple PDF")),
          // const SizedBox(
          //   height: 10,
          // ),
          // ElevatedButton(
          //     style: ButtonStyle(
          //       minimumSize: MaterialStateProperty.all(const Size(250, 50)),
          //     ),
          //     onPressed: () async {
          //       final pdfFile = await PdfParagraphApi.generate();
          //       PdfApi.openFile(pdfFile);
          //     },
          //     child: const Text("Paragraphs PDF")),
          // const SizedBox(
          //   height: 10,
          // ),
          // ElevatedButton(
          //     style: ButtonStyle(
          //       minimumSize: MaterialStateProperty.all(const Size(250, 50)),
          //     ),
          //     onPressed: () async {
          //       final pdfFile = await PdfApi.generateTable();
          //       PdfApi.openFile(pdfFile);
          //     },
          //     child: const Text("Table PDF")),
          // const SizedBox(
          //   height: 10,
          // ),
          // ElevatedButton(
          //     style: ButtonStyle(
          //       minimumSize: MaterialStateProperty.all(const Size(250, 50)),
          //     ),
          //     onPressed: () async {
          //       final pdfFile = await PdfApi.generateImage();
          //       PdfApi.openFile(pdfFile);
          //     },
          //     child: const Text("Image PDF")),
        ]),
      ),
    );
  }
}
