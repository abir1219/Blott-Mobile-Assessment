import '../data/network/network_api_services.dart';
import '../helper/api_end_points.dart';

class NewsRepository {
  final _apiClient = NetworkApiService();

  Future<dynamic> fetchNews() async {
    var url =
        "${ApiEndPoints.BASE_URL}${ApiEndPoints.authEndpoints.FETCH_NEWS}?category=general&token=crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg";
    dynamic response = _apiClient.getApi(url);
    return response;
  }
}
