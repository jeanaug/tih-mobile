import 'package:http_interceptor/http_interceptor.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('request');
    print('BaseUrl: ${data.baseUrl}');
    print('Url: ${data.url}');
    print('Headers: ${data.headers}');
    print('Body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('StatusCode: ${data.statusCode}');
    print('Method: ${data.method}');
    print('Headers: ${data.headers}');
    print('Body: ${data.body}');
    print(data);
    return data;
  }
}
