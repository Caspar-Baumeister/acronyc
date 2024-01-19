// import 'package:acronyc_app/services/providers/filter_provider.dart';
// import 'package:acronyc_app/utiles/colors.dart';
// import 'package:acronyc_app/utiles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SearchSettingsModal extends StatelessWidget {
//   const SearchSettingsModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: const Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Difficulty",
//               style: SUB_TITLE,
//             ),
//             SizedBox(height: 10),
//             SettingsFilterCards(filterType: FilterType.difficulty),
//             SizedBox(height: 20),
//             Text(
//               "Type",
//               style: SUB_TITLE,
//             ),
//             SizedBox(height: 10),
//             SettingsFilterCards(filterType: FilterType.type),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SettingsFilterCards extends StatelessWidget {
//   const SettingsFilterCards({Key? key, required this.filterType})
//       : super(key: key);

//   final FilterType filterType;

//   @override
//   Widget build(BuildContext context) {
//     FilterProvider asanaSearchProvider = Provider.of<FilterProvider>(context);

//     List<String> filterList = [];
//     String? activeFilter;
//     Function(String)? changeActiveFilter;
//     switch (filterType) {
//       case FilterType.difficulty:
//         filterList = asanaSearchProvider.difficulties;
//         activeFilter = asanaSearchProvider.activeDifficulty;
//         changeActiveFilter =
//             (String filter) => asanaSearchProvider.updateDifficulty(filter);
//         break;

//       case FilterType.type:
//         filterList = asanaSearchProvider.types;
//         activeFilter = asanaSearchProvider.activeType;
//         changeActiveFilter =
//             (String filter) => asanaSearchProvider.updateType(filter);
//         break;
//       default:
//         break;
//     }

//     return Wrap(
//       spacing: 6.0, // gap between adjacent chips
//       runSpacing: 0.0, // gap between lines
//       children: <Widget>[
//         ...filterList.map((String filter) {
//           bool isSelected = filter == activeFilter;
//           return GestureDetector(
//             onTap: () => changeActiveFilter!(filter),
//             child: Chip(
//               label: Text(
//                 filter,
//                 style: H14W5.copyWith(
//                     color: isSelected ? Colors.white : TEXT_COLOR),
//               ),
//               backgroundColor: isSelected ? ACCENT_COLOR : Colors.white,
//             ),
//           );
//         })
//       ],
//     );
//   }
// }

// // enum of filter types
// enum FilterType { difficulty, category, duration, intensity, type }
