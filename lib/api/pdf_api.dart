import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfApi {
  static Future<File> generateCenteredText(String text) async {
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(text, style: TextStyle(fontSize: 48, font: font)),
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
    required Document pdf,
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
    final pdf = Document();
    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }
}
