import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/404_handlers.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // ---------- Auth router ----------

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // ---------- Dashboard ----------

  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // ----------Auth Routes ----------
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    // router.define(dashboardRoute, handler: handler);

    // ---------- 404 Route ----------
    router.notFoundHandler = NotPageFoundHandlers.notPageFound;
  }
}
