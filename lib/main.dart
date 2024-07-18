import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PDF Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Printing.layoutPdf(
                onLayout: (PdfPageFormat format) async {
                  final pdf = pw.Document();

                  final image = pw.MemoryImage(
                    File('/assets/ey.jpg').readAsBytesSync(),
                  );

                  pdf.addPage(
                    pw.Page(
                      pageFormat: format,
                      build: (pw.Context context) {
                        return pw.Stack(
                          children: [
                            pw.Positioned.fill(child: pw.Image(image)),
                            pw.Positioned(
                              left: 100,
                              top: 180,
                              child: pw.Text('Account Number: 1234567890'),
                            ),
                            pw.Positioned(
                              left: 400,
                              top: 180,
                              child: pw.Text('Date: 2024-07-18'),
                            ),
                            pw.Positioned(
                              left: 100,
                              top: 220,
                              child: pw.Text('Account Name: John Doe'),
                            ),
                            pw.Positioned(
                              left: 100,
                              top: 260,
                              child: pw.Text(
                                  'Amount of deposit in words: One Thousand Pesos'),
                            ),
                            pw.Positioned(
                              left: 100,
                              top: 300,
                              child: pw.Text('In figures: 1000'),
                            ),
                            pw.Positioned(
                              left: 100,
                              top: 350,
                              child: pw.Text(
                                  'Denomination/Bank/Branch: Main Branch'),
                            ),
                            pw.Positioned(
                              left: 300,
                              top: 350,
                              child: pw.Text('Pieces/Check No.: 0001'),
                            ),
                            pw.Positioned(
                              left: 500,
                              top: 350,
                              child: pw.Text('Amount: 1000'),
                            ),
                            pw.Positioned(
                              left: 100,
                              top: 700,
                              child: pw.Text('Total Amount: 1000'),
                            ),
                            pw.Positioned(
                              left: 100,
                              top: 750,
                              child: pw.Text('Contact Number: 09123456789'),
                            ),
                          ],
                        );
                      },
                    ),
                  );

                  return pdf.save();
                },
              );
            },
            child: Text('Generate PDF'),
          ),
        ),
      ),
    );
  }
}
