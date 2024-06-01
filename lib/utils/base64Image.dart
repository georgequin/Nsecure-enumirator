import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class Base64Image extends StatelessWidget {
  final String? base64String;
  final double? width;
  final double? height;
  final BoxFit fit;

  const Base64Image({
    Key? key,
    required this.base64String,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (base64String == null) {
      return const Icon(Icons.error); // Placeholder for null or invalid input
    }
    try {
      // Optionally remove data URL scheme if present and decode
      final String cleanBase64String = base64String!.startsWith('data:image') ? base64String!.split(',').last : base64String!;
      final Uint8List imageBytes = base64Decode(cleanBase64String);
      return Image.memory(
        imageBytes,
        width: width,
        height: height,
        fit: fit,
      );
    } catch (e) {
      print("Error decoding Base64 string: $e");
      return const Icon(Icons.error); // Placeholder for decoding errors
    }
  }
}
