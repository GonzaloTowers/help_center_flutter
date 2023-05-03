import 'package:help_center/bloc/model/help_center_model.dart';
import 'package:http/http.dart' as http;

abstract class HelpCenterRepository {
  Future<HelpCenterModel> fetchData();
}

class HelpCenterRepo extends HelpCenterRepository {
  String url;

  HelpCenterRepo(this.url);

  @override
  Future<HelpCenterModel> fetchData() async {
    final response = await http.post(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return HelpCenterModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load API data');
    }
  }
}
