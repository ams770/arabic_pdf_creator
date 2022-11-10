
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'pdf_to_img_conveter.dart';

class PdfGenerator{
  static late Font arFont ;

  static init()async{
    arFont = Font.ttf( (await rootBundle.load("assets/fonts/Cairo-Bold.ttf")) );
  }

  static createPdf()async{
    String path =( await getApplicationDocumentsDirectory()).path;
    File file = File(path + "MY_PDF.pdf");

    Document pdf = Document();
    pdf.addPage(_createPage());

    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);
    createImg(file.path);
    // await OpenFile.open(file.path);
  }

  static Page _createPage() {
    return Page(
      textDirection: TextDirection.rtl,
      theme: ThemeData.withFont(
        base: arFont,
      ),
      pageFormat: PdfPageFormat.roll80 ,
        build: (context) {
      return Center(
        child: Container(
          child: Text("بسم الله")
        )
      );
    });
  }




  static createImg(String path){
    PdfConverter.convertToImage(path) ;
  }



}