import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/core/constants/app_text_constants.dart';
import 'package:rikandmorty/routes/mobile_auto_router.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/app_scroll_behavior.dart';
import 'package:rikandmorty/widgets/init_widget.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final appRouter = sl<AppRouter>();

void main() async {
  await Future.wait([
    init(),
  ]);
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(
        builder: (context) => MaterialApp.router(
          scrollBehavior: AppScrollBehavior(),
          scaffoldMessengerKey: scaffoldKey,
          theme: context.watch<ThemeProvider>().theme,
          title: AppTextConstants.appTitle,
          debugShowCheckedModeBanner: false,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(appRouter),
          routeInformationProvider: appRouter.routeInfoProvider(),
        ),
      ),
    );
  }
}
