// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}

class PdfApi {
  static Future<File> generateCenteredText(String text) async {
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (context) => pw.Center(
        child: pw.Text(text, style: pw.TextStyle(fontSize: 48, font: font)),
      ),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  // static Future<File> saveDocument({
  //   required String name,
  //   required Document pdf,
  // }) async {
  //   final bytes = await pdf.save();

  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/$name');

  //   await file.writeAsBytes(bytes);

  //   return file;
  // }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    // Use external storage directory instead of the app documents directory
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  // static Future openFile(File file) async {
  //   final url = file.path;

  //   await OpenFile.open(url);
  // }

  static Future openFile(File file) async {
    final url = file.path;
    print('File Path: $url');
    await OpenFile.open(url);
  }

  static Future<File> generateTable() async {
    final pdf = pw.Document();
    final headers = ['Name', 'Age'];
    final users = [
      User(name: "Yusuf", age: 22),
      User(name: "Samet", age: 24),
      User(name: "Gökhan", age: 65),
    ];
    final data = users.map((user) => [user.name, user.age]).toList();
    // ignore: deprecated_member_use
    pdf.addPage(pw.Page(
        build: (context) =>
            pw.Table.fromTextArray(headers: headers, data: data)));
    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> generateImage() async {
    final pdf = pw.Document();

    final imageSvg = await rootBundle.loadString('assets/fruit.svg');
    final imageJpg =
        (await rootBundle.load('assets/person.jpg')).buffer.asUint8List();

    final pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 1) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Image(pw.MemoryImage(imageJpg), fit: pw.BoxFit.cover),
          );
        } else {
          return pw.Container();
        }
      },
    );

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          pw.Container(
            height: pageTheme.pageFormat.availableHeight - 1,
            child: pw.Center(
              child: pw.Text(
                'Foreground Text',
                style: pw.TextStyle(color: PdfColors.white, fontSize: 48),
              ),
            ),
          ),
          pw.SvgImage(svg: imageSvg),
          pw.Image(pw.MemoryImage(imageJpg)),
          pw.Center(
            child: pw.ClipRRect(
              horizontalRadius: 32,
              verticalRadius: 32,
              child: pw.Image(
                pw.MemoryImage(imageJpg),
                width: pageTheme.pageFormat.availableWidth / 2,
              ),
            ),
          ),
          pw.GridView(
            crossAxisCount: 3,
            childAspectRatio: 1,
            children: [
              pw.SvgImage(svg: imageSvg),
              pw.SvgImage(svg: imageSvg),
              pw.SvgImage(svg: imageSvg),
              pw.SvgImage(svg: imageSvg),
              pw.SvgImage(svg: imageSvg),
              pw.SvgImage(svg: imageSvg),
            ],
          )
        ],
      ),
    );

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }
}
