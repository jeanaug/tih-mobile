import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:tih_mobile/services/interceptors/auth_interceptor.dart';

const requestTimeout = 5;

final client = HttpClientWithInterceptor.build(
    interceptors: [AuthInterceptor()],
    requestTimeout: Duration(seconds: requestTimeout));

const String baseUrl = "http://192.168.15.13:3000";
