import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class ImageCropper{
  Future<Uint8List?> resizeImage(Uint8List imageBytes, int maxWidth, int maxHeight) async {
    // Decode the image
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) return null;

    // Resize the image
    img.Image resizedImage = img.copyResize(image, width: maxWidth, height: maxHeight);

    // Encode the resized image back to bytes
    Uint8List resizedBytes = Uint8List.fromList(img.encodePng(resizedImage));
    return resizedBytes;
  }
}


