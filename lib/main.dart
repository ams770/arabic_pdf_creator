import 'package:flutter/material.dart';
import 'package:pdf_creator/pdf_creator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyView(),
    );
  }
}


class MyView extends StatefulWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {

  @override
  void initState() {
    super.initState();
    PdfGenerator.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.indigoAccent,
          onPressed: (){
            PdfGenerator.createPdf();
          },
          child: const Text("Open File", style: TextStyle(color: Colors.white),),),
      ),
    );
  }
}
