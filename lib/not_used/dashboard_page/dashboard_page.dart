// import 'package:acronyc_app/components/bottom_navigation/custom_bottom_navigation_bar.dart';
// import 'package:acronyc_app/components/custom_app_bar.dart';
// import 'package:acronyc_app/layouts/main_body_padding.dart';
// import 'package:acronyc_app/utiles/helper_functions/get_difficulty_icon.dart';
// import 'package:acronyc_app/utiles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       appBar: CustomAppBar(
//         title: "Dashboard",
//       ),
//       endDrawer: SafeArea(
//         child: Drawer(
//           child: Text("Drawer"),
//         ),
//       ),
//       bottomNavigationBar: MainBottomNavigationBar(0),
//       body: MainBodyPadding(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ProgressRow(
//                 title: "Asanas",
//               ),
//               // divider
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Divider(
//                   height: 1,
//                   thickness: 1,
//                 ),
//               ),
//               ProgressRow(
//                 title: "Transitions",
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Divider(
//                   height: 1,
//                   thickness: 1,
//                 ),
//               ),
//               ProgressRow(
//                 title: "Washing Machines",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProgressRow extends StatelessWidget {
//   const ProgressRow({
//     super.key,
//     required this.title,
//   });

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // show the header with padding
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text(
//             title,
//             style: MAIN_TITLE,
//           ),
//         ),
//         // show a row with 3 cards
//         const Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ProgressCard(
//                 difficultyIndex: 0,
//                 progress: 100,
//                 progressColor: Color.fromARGB(125, 255, 235, 59),
//               ),
//               ProgressCard(
//                 difficultyIndex: 1,
//                 progress: 84,
//                 progressColor: Color.fromARGB(125, 76, 175, 79),
//               ),
//               ProgressCard(
//                 difficultyIndex: 2,
//                 progress: 12,
//                 progressColor: Color.fromARGB(125, 0, 0, 0),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class ProgressCard extends StatelessWidget {
//   const ProgressCard(
//       {super.key,
//       required this.difficultyIndex,
//       required this.progress,
//       required this.progressColor});

//   final int difficultyIndex;
//   final double progress;
//   final Color progressColor;

//   @override
//   Widget build(BuildContext context) {
//     final ValueNotifier<double> progressListener =
//         ValueNotifier<double>(progress);
//     return Column(
//       children: [
//         Stack(
//           children: [
//             // show the difficulty image
//             Positioned(
//               top: 3,
//               left: 3,
//               right: 3,
//               bottom: 3,
//               child: Image(
//                 image: getDifficultyIcon(difficultyIndex),
//                 fit: BoxFit.cover,
//               ),
//             ),

//             SimpleCircularProgressBar(
//               valueNotifier: progressListener,
//               animationDuration: 3,
//               progressColors: [progressColor],
//               backColor: Colors.transparent,
//               mergeMode: true,
//               backStrokeWidth: 7,
//               progressStrokeWidth: 7,
//             ),
//           ],
//         ),
//         // display the progress
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Text(
//             "${progress.toInt()}%",
//             style: H14W5,
//           ),
//         )
//       ],
//     );
//   }
// }
