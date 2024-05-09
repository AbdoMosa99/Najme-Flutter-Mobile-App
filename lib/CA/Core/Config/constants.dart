class Constants {
  static const bool production = false;
  static const String baseUrl = production ? baseUrlPrd : baseUrlStg;
  static const String baseUrlStg = "https://virtserver.swaggerhub.com/ABDOMOSA598/Najme/";
  static const String baseUrlPrd = "https://virtserver.swaggerhub.com/ABDOMOSA598/Najme/";
  static const String text = "";
  static const String getSubjectsApi = "/1/students/1/subjects/";
}
