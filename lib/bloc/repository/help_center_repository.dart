import 'package:help_center/bloc/model/help_center_model.dart';
import 'package:http/http.dart' as http;

abstract class HelpCenterRepository {
  Future<HelpCenterModel> fetchData(String title, String content);
}

class HelpCenterRepo extends HelpCenterRepository {
  String url;

  HelpCenterRepo(this.url);

  @override
  Future<HelpCenterModel> fetchData(String title, String content) async {
    final response = await http.post(
      Uri.parse(url),
    );

    if (response.statusCode == 201) {
      return HelpCenterModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load API data');
    }
  }
}
