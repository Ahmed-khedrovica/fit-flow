enum Environment { dev, prod }

abstract class AppConfig {
  Environment get environment;
  String get appName;
  String get apiBaseUrl;
}

class DevAppConfig implements AppConfig {
  const DevAppConfig();

  @override
  Environment get environment => Environment.dev;

  @override
  String get appName => 'Fit Flow Dev';

  @override
  String get apiBaseUrl => 'https://api.dev.example.com';
}

class ProdAppConfig implements AppConfig {
  const ProdAppConfig();

  @override
  Environment get environment => Environment.prod;

  @override
  String get appName => 'Fit Flow';

  @override
  String get apiBaseUrl => 'https://api.example.com';
}
