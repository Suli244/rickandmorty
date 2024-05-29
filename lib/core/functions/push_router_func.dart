import 'package:auto_route/auto_route.dart';
import 'package:rikandmorty/routes/mobile_auto_router.dart';
import 'package:rikandmorty/server/service_locator.dart';

pushFunction(route) {
  sl<AppRouter>().push(route);
}

pushAndPopUntilFunction(PageRouteInfo<dynamic> route) {
  sl<AppRouter>().pushAndPopUntil(
    route,
    predicate: (route) => false,
  );
}

