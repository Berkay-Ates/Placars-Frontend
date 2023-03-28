import 'package:go_router/go_router.dart';
import 'package:placars/features/home/view/home_view.dart';
import 'package:placars/features/login_signup/login/view/login_view.dart';
import 'package:placars/features/login_signup/signup/view/sign_up_view.dart';
import '../../../features/login_signup/onboard/view/onboard_view.dart';
import '../../constants/enums/navigation_enums.dart';

class NavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  final router = GoRouter(
    routes: [
      GoRoute(path: NavigationEnums.onBoardView.routeName, builder: (context, state) => const OnBoardView()),
      GoRoute(path: NavigationEnums.singUpView.routeName, builder: (context, state) => const SignUpView()),
      GoRoute(path: NavigationEnums.loginView.routeName, builder: (context, state) => const LoginView()),
      GoRoute(path: NavigationEnums.homeView.routeName, builder: (context, state) => const HomeView()),
    ],
  );
}
