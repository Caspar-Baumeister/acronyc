import 'package:acronyc_app/models/asana_model.dart';
import 'package:acronyc_app/models/transition_model.dart';
import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/pages/home/home_page.dart';
import 'package:acronyc_app/pages/single_skill_screens/single_asana_page/single_asana_page.dart';
import 'package:acronyc_app/pages/single_skill_screens/single_transition_page/single_transition_page.dart';
import 'package:acronyc_app/pages/single_skill_screens/single_wm_page/single_wm_page.dart';
import 'package:acronyc_app/routing/routes/base_route.dart';
import 'package:acronyc_app/routing/transitions/transitions.dart';

class HomePageRoute extends BaseRoute {
  HomePageRoute()
      : super(
          const HomePage(),
          transitionsBuilderFunction: Transitions.slideLeftWithFade,
        );
}

class SingleAsanaPageRoute extends BaseRoute {
  SingleAsanaPageRoute(AsanaModel asana)
      : super(
          SingleAsanaPage(asana: asana),
          transitionsBuilderFunction: Transitions.slideLeftWithFade,
        );
}

//SingleWmPageRoute
class SingleWmPageRoute extends BaseRoute {
  SingleWmPageRoute(WashingMachinesModel wm)
      : super(
          SingleWmPage(wm: wm),
          transitionsBuilderFunction: Transitions.slideLeftWithFade,
        );
}

class SingleTransitionPageRoute extends BaseRoute {
  SingleTransitionPageRoute(TransitionModel transition)
      : super(
          SingleTransitionPage(transition: transition),
          transitionsBuilderFunction: Transitions.slideLeftWithFade,
        );
}

// class ChatPageRoute extends BaseRoute {
//   ChatPageRoute(ChatModel chatContact)
//       : super(
//           ChatPage(chat: chatContact),
//         );
// }
