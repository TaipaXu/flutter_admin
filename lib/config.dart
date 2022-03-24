import '/development.dart' as development;
import '/production.dart' as production;

enum Env {
  development,
  production,
}

Env envirment = Env.development;
String baseApi = development.baseApi;
bool mock = development.mock;
bool debugShowCheckedModeBanner = development.debugShowCheckedModeBanner;

void load(Env env) {
  switch (env) {
    case Env.development:
      {
        envirment = Env.development;
        baseApi = development.baseApi;
        mock = development.mock;
        debugShowCheckedModeBanner = development.debugShowCheckedModeBanner;
        break;
      }
    case Env.production:
      {
        envirment = Env.production;
        baseApi = production.baseApi;
        mock = production.mock;
        debugShowCheckedModeBanner = production.debugShowCheckedModeBanner;
        break;
      }
    default:
  }
}
