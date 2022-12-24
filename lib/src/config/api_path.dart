abstract class Urls {
  Urls._();

  // App's base url
  static const String baseUrl = 'template.gosoftweb.com';

  static const String restApiVersion = '/v1';

  // image path
  static String imagePath(String? url) => 'https://$baseUrl$url';

  // login endpoint
  static const String signIn = '$restApiVersion/login';
}
