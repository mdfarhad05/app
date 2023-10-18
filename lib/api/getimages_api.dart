import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class ImageApi {
  static const String baseUrl =
      'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c'; // Replace with your API base URL

  // Function to fetch an image by its ID
  static Future<File> fetchImageById(int imageId) async {
    final headers = {
      'X-RapidAPI-Key': 'ff7d38eb1bmsh5d9438c790492dfp14a9f4jsnfc3dbebe68fa',
    };

    final response = await http.get(
        Uri.parse('${baseUrl + imageId.toString()}/i.jpg'),
        headers: headers);

    print("response: ${response.body}");
    if (response.statusCode == 200) {
      final File imageData = response.body as File;
      final Directory appDir = await getApplicationDocumentsDirectory();
      final File imageFile = File('${appDir.path}/image_$imageId.jpg');

      print('baby $imageFile');
      await imageFile.writeAsBytes(imageData as List<int>);
      return imageFile;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
