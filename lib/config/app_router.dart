import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/presentation/pages/login_page.dart';
import 'package:auth_mobile_app/features/authentication/presentation/pages/profile_page.dart';
import 'package:auth_mobile_app/features/authentication/presentation/pages/register_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {

  static const String splashRoute = '/splash';
  static const String loginRoute = '/logIn';
  static const String registerRoute = '/register';
  static const String profileRoute = '/profile';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: profileRoute,
        builder: (context, state) => ProfilePage(user: state.extra as UserEntity,),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state)  {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}
