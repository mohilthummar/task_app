import '../services/client/client_service.dart';
import '../services/client/result.dart';

class ImageRepository extends ClientService {
  Future<Result<BaseResponse, String>> fetch({
    int page = 1,
    int perPage = 40,
  }) async {
    return await request(
      requestType: RequestType.get,
      path: "",
      queryParameters: {
        "page": page,
        "per_page": perPage,
        "q": "animal+forest+sky",
        "pretty": true,
        "image_type": "photo",
        "key": "46274266-0167e335b239589d776bde3ad",
      },
    );
  }
}
