import 'package:acronyc_app/pages/home/sections/transition_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/providers/filter_provider.dart';
import '../../utiles/colors.dart';
import '../../utiles/constants.dart';
import 'sections/asana_section.dart';
import 'sections/filter_row_section.dart';
import 'sections/search_bar_section.dart';
import 'sections/wm_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: NestedScrollView(
                headerSliverBuilder: (context, _) {
                  return [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Consumer<FilterProvider>(
                                    builder: (context, filterProvider, _) =>
                                        SearchBarWidget(
                                      text: filterProvider.search,
                                      onChanged: (value) {
                                        filterProvider.setSearchQuery(value);
                                      },
                                      hintText:
                                          "Suche nach Asanas und Waschmaschinen",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: FilterRowSection()),
                          ),
                          const SizedBox(
                            height:
                                SEARCHBAR_HEIGHT, // Adjust the height of the TabBar here
                            child: TabBar(
                              labelPadding: EdgeInsets.zero,
                              labelStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              tabs: [
                                Tab(text: 'Asanas'),
                                Tab(text: 'Transitions'),
                                Tab(text: 'Flows'),
                              ],
                              indicator: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color:
                                        ACCENT_COLOR, // Color of the indicator
                                    width: 2.0, // Thickness of the indicator
                                  ),
                                ),
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: ACCENT_COLOR,
                              unselectedLabelColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: const Column(
                  children: [
                    SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: STANDART_HORIZONTAL_PADDING),
                        child: TabBarView(
                          children: [
                            AsanaSection(),
                            TransitionSection(),
                            WmSection()
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
