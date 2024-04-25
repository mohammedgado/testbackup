import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart';

Future<XFile> compressImage(XFile image) async {
  try {
    var fileSize = await image.length();
    print(fileSize);
    final tempDir = Directory.systemTemp;

    bool isPNG = false;
    if (image.path.split(".").last.toLowerCase() == 'png') {
      isPNG = true;
      final pngImage = decodeImage(File(image.path).readAsBytesSync())!;
      File('${tempDir.path}/${image.name}.jpg')
          .writeAsBytesSync(encodeJpg(pngImage));
    }

    final targetPath = '${tempDir.path}/${image.name}';
    final imageOutputNormal = await FlutterImageCompress.compressAndGetFile(
      isPNG ? '${tempDir.path}/${image.name}.jpg' : image.path,
      targetPath,
      quality: 60,
      minHeight: 600,
      minWidth: 600,
      format: isPNG ? CompressFormat.png : CompressFormat.jpeg,
    );

    var normalCompressedSize = await (imageOutputNormal!).length();
    if (normalCompressedSize > 200000) {
      final heavyTargetPath = '${tempDir.path}/compressed_${image.name}';
      final imageOutputHeavy = await FlutterImageCompress.compressAndGetFile(
        targetPath,
        heavyTargetPath,
        quality: 40,
        minHeight: 400,
        minWidth: 400,
        format: isPNG ? CompressFormat.png : CompressFormat.jpeg,
      );
      var heavyCompressedSize = await (imageOutputHeavy!).length();
      if (heavyCompressedSize > 200000) {
        final aggressiveTargetPath =
            '${tempDir.path}/highlycompressed_${image.name}';
        final imageOutputAggressive =
            await FlutterImageCompress.compressAndGetFile(
          heavyTargetPath,
          aggressiveTargetPath,
          quality: 30,
          minHeight: 200,
          minWidth: 200,
          format: isPNG ? CompressFormat.png : CompressFormat.jpeg,
        );
        print('Applied Agressive Compression, new size:');
        var aggresiveCompressedSize = await (imageOutputAggressive!).length();
        print(aggresiveCompressedSize);
        return imageOutputAggressive;
      }
      print('Applied Heavy Compression, new size:');
      print(heavyCompressedSize);
      return imageOutputHeavy;
    } else {
      print('Applied Normal Compression, new size:');
      print(normalCompressedSize);
      return imageOutputNormal;
    }
  } catch (error) {
    print("Error during compression: $error");
    return image;
  }
}
