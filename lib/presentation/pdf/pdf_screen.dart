import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfapplication/general_providers.dart';

class PdfScreen extends HookConsumerWidget {
  final String pdfLink;
  const PdfScreen({required this.pdfLink, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
        backgroundColor: ref.watch(homeControllerProvider).primaryColor,
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: true,
        pageSnap: true,
        fitEachPage: true,
        fitPolicy: FitPolicy.BOTH,
        onError: (error) {},
      ).fromUrl(pdfLink),
    );
  }
}
