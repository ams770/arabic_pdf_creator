
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfConverter{
  static convertToImage(String pdfPath)async{
    PdfDocument doc = await PdfDocument.openFile(pdfPath);
    PdfPage page  = await doc.getPage(1);

    final PdfPageImage? pageImg = await page.render(
        width: 575,
        height: page.height +200,
       backgroundColor: "#ffffff"
    );

    if(pageImg!=null){
      String path = (await getApplicationDocumentsDirectory()).path;
      File file = File(path + "MY_IMG.png");

      await file.writeAsBytes(pageImg.bytes);
      OpenFile.open(file.path);

    }
  }
}