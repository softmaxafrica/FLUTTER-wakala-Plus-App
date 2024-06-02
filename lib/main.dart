import 'package:flutter/material.dart';
import 'package:flutter_wakala_mobile_app/data_controllers/customerRequestsController.dart';
import 'package:flutter_wakala_mobile_app/screens/agent/agent_home.dart';
import 'package:flutter_wakala_mobile_app/screens/agent/wakala_main.dart';
import 'package:flutter_wakala_mobile_app/screens/login.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'api_services/agent_apis.dart';
import 'screens/customer/mteja_home.dart';
import 'shared/custom_theme.dart';

 //
// void main() {
//   runApp(const MyApp());
// }
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomerRequestsController()),
        ChangeNotifierProvider(create: (context) => AgentApiServices()),

      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',

      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              // bottomNavigationBar: BottomBarWidget(),
            );
          },

          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) {
                return WakalaMain();
                // return TruckDriver();

              },
            ),
            GoRoute(
              path: '/agent_home',
              builder: (context, state) {
                return WakalaMain();
              },
            ),
            GoRoute(
              path: '/customer_home',
              builder: (context, state) {
                return MtejaHome();
              },
            ),
          ],
        ),
      ],
    );


    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      routerConfig: _router,
    );

  }
}

