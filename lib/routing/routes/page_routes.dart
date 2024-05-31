import 'package:acronyc_app/pages/home/home_page.dart';
import 'package:acronyc_app/routing/routes/base_route.dart';
import 'package:acronyc_app/routing/routes/transitions.dart';

class HomePageRoute extends BaseRoute {
  HomePageRoute()
      : super(
          const HomePage(),
          transitionsBuilderFunction: Transitions.slideLeftWithFade,
        );
}

// class ChatPageRoute extends BaseRoute {
//   ChatPageRoute(ChatModel chatContact)
//       : super(
//           ChatPage(chat: chatContact),
//         );
// }
