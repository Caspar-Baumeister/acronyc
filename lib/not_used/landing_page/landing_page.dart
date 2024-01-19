// import 'package:acronyc_app/components/buttons/standart_button.dart';
// import 'package:acronyc_app/layouts/standart_text_column.dart';
// import 'package:acronyc_app/not_used/authentification_pages/login_page/login_page.dart';
// import 'package:acronyc_app/not_used/authentification_pages/register_page/register_page.dart';
// import 'package:acronyc_app/not_used/dashboard_page/dashboard_page.dart';
// import 'package:acronyc_app/utiles/constants.dart';
// import 'package:acronyc_app/utiles/text_styles.dart';
// import 'package:flutter/material.dart';

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double buttonWidth = (MediaQuery.of(context).size.width / 2) -
//         (STANDART_TEXT_HORIZONTAL_PADDING * 1.5);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Acronyc",
//           style: MAIN_TITLE,
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: STANDART_TEXT_HORIZONTAL_PADDING),
//             child: StandartTextColumn(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 "A comprehensive and beautiful guide to AcroYoga.",
//                 "Get started today and become a master base or flyer!"
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image.asset(
//               "assets/images/acronyc_expample.png",
//               height: MediaQuery.of(context).size.height * 0.45,
//               fit: BoxFit.fitHeight,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: STANDART_TEXT_HORIZONTAL_PADDING),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 StandartButton(
//                   text: "Register",
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const RegisterPage()),
//                   ),
//                   width: buttonWidth,
//                   isFilled: true,
//                 ),
//                 StandartButton(
//                     text: "Login",
//                     onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginPage()),
//                         ),
//                     width: buttonWidth)
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Center(
//               child: GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DashboardPage()),
//             ),
//             child: const Text(
//               "Continue without Login",
//               style: STANDART_DESCRIPTION,
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
