import 'package:project_uas/surah.dart';
import 'package:http/http.dart' as http;

class SurahService {
  static const String _baseUrl =
      'https://api.npoint.io/99c279bb173a6e28359c/data';

  Future getSurah() async {
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      return surahFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data surah");
    }
  }
}
