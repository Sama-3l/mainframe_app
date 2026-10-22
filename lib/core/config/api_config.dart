class ApiConfig {
  String? baseUrl;

  String imageUrl(String fileName) => '$baseUrl/uploads/$fileName';
}
