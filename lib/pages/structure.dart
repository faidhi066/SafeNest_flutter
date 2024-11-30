// Defines application's structure

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/transactions_provider.dart';
import 'chatbot_page/chatbot_page.dart';
import 'home_page.dart';
// import 'graphs_page/graphs_page.dart';
import 'stress_test_page/stress_test_page.dart';
import 'transactions_page/transactions_page.dart';

final StateProvider selectedIndexProvider = StateProvider<int>((ref) => 0);

class Structure extends ConsumerStatefulWidget {
  const Structure({super.key});

  @override
  ConsumerState<Structure> createState() => _StructureState();
}

class _StructureState extends ConsumerState<Structure> {
  // We could add this List in the app's state, so it isn't intialized every time.
  final List<String> _pagesTitle = [
    "Hi Izzy!",
    "Trends & Insights",
    "",
    "Chatbot",
    "Stress Test",
  ];
  final List<Widget> _pages = [
    const HomePage(),
    const TransactionsPage(),
    const SizedBox(),
    const ChatbotPage(),
    const StressTestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    return Scaffold(
      // Prevent the fab moving up when the keyboard is opened
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: selectedIndex == 0
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.surface,
        title: Text(
          _pagesTitle.elementAt(selectedIndex),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(0),
              // backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Image.asset("assets/avatar.png"
                // color: Theme.of(context).colorScheme.surface,
                ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/settings'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _pages[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        currentIndex: selectedIndex,
        onTap: (index) => index != 2
            ? ref.read(selectedIndexProvider.notifier).state = index
            : null,
        items: [
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 1
                ? Icons.bar_chart
                : Icons.bar_chart_outlined),
            label: "Trends",
          ),
          const BottomNavigationBarItem(icon: Text(""), label: ""),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 3
                ? Icons.assistant
                : Icons.assistant_outlined),
            label: "Chatbot",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                selectedIndex == 4 ? Icons.science : Icons.science_outlined),
            label: "Stress Test",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        highlightElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add_rounded,
          size: 55,
          color: Theme.of(context).colorScheme.surface,
        ),
        onPressed: () {
          ref.read(transactionsProvider.notifier).reset();
          Navigator.of(context).pushNamed("/add-page");
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
