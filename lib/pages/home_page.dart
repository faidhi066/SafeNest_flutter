import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pages/home_widget/budgets_home.dart';
import '../constants/functions.dart';
import '../providers/accounts_provider.dart';
import '../providers/currency_provider.dart';
import '../providers/transactions_provider.dart';
import 'home_widget/account_card_carousel.dart';
import 'home_widget/insight_card_carousel.dart';
import 'home_widget/transactions_home.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

List<String> buttons = [
  'Tax Claim',
  'Net Worth',
  'Transactions',
  'Goals',
  'Cash Flow',
  'Expense Tracker',
  'Pot'
];

final List<IconData> icons = [
  Icons.receipt, // Tax Claim
  Icons.account_balance_wallet, // Net Worth
  Icons.swap_horiz, // Transactions
  Icons.flag, // Goals
  Icons.money, // Cash Flow
  Icons.bar_chart, // Expense Tracker
  Icons.savings, // Pot
];

class _HomePageState extends ConsumerState<HomePage> with Functions {
  @override
  Widget build(BuildContext context) {
    final accountList = ref.watch(accountsProvider);
    final lastTransactions = ref.watch(lastTransactionsProvider);
    final currencyState = ref.watch(currencyStateNotifier);

    return Container(
      // color: Theme.of(context).colorScheme.tertiary,
      child: ListView(
        children: [
          const InsightCardCarousel(),
          SizedBox(
            height: 100, // Increased height to accommodate text
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: buttons.length, // Number of cards
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Increased to make edges more round
                        ),
                        margin: EdgeInsets
                            .zero, // Removed extra margin for better spacing
                        child: Container(
                          width: 50, // Width of each card
                          height:
                              50, // Adjusted height for consistent card size
                          alignment: Alignment.center,
                          child: Icon(icons[index]),
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Spacing between the card and the text
                      Text(
                        buttons[index], // Example text for each card
                        style: const TextStyle(fontSize: 12), // Text styling
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const AccountCardCarousel(),
          // ref.watch(dashboardProvider).when(
          //       data: (value) {
          //         final income = ref.watch(incomeProvider);
          //         final expense = ref.watch(expenseProvider);
          //         final total = income + expense;
          //         final currentMonthList = ref.watch(currentMonthListProvider);
          //         final lastMonthList = ref.watch(lastMonthListProvider);

          //         return Column(
          //           children: [
          //             const SizedBox(height: 24),
          //             const SizedBox(height: 16),
          //             LineChartWidget(
          //               lineData: currentMonthList,
          //               line2Data: lastMonthList,
          //             ),
          //             Row(
          //               children: [
          //                 const SizedBox(width: 16),
          //                 Container(
          //                   width: 8,
          //                   height: 8,
          //                   decoration: BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     color: Theme.of(context).colorScheme.primary,
          //                   ),
          //                 ),
          //                 const SizedBox(width: 4),
          //                 Text(
          //                   "Current month",
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .labelMedium
          //                       ?.copyWith(
          //                           color:
          //                               Theme.of(context).colorScheme.primary),
          //                 ),
          //                 const SizedBox(width: 12),
          //                 Container(
          //                   width: 8,
          //                   height: 8,
          //                   decoration: const BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     color: grey2,
          //                   ),
          //                 ),
          //                 const SizedBox(width: 4),
          //                 Text(
          //                   "Last month",
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .labelMedium
          //                       ?.copyWith(
          //                           color:
          //                               Theme.of(context).colorScheme.primary),
          //                 ),
          //               ],
          //             ),
          //             const SizedBox(height: 22),
          //           ],
          //         );
          //       },
          //       loading: () => const SizedBox(height: 330),
          //       error: (err, stack) => Text('Error: $err'),
          //     ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer, //da modificare in darkMode
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Text(
                    "Transactions",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                // SizedBox(
                //   height: 86.0,
                //   child: accountList.when(
                //     data: (accounts) => ListView.builder(
                //       itemCount: accounts.length + 1,
                //       shrinkWrap: true,
                //       padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                //       physics: const BouncingScrollPhysics(),
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, i) {
                //         if (i == accounts.length) {
                //           return Padding(
                //             padding: const EdgeInsets.fromLTRB(0, 4, 0, 16),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(8),
                //                 boxShadow: [defaultShadow],
                //               ),
                //               child: TextButton.icon(
                //                 style: ButtonStyle(
                //                   maximumSize: WidgetStateProperty.all(
                //                       const Size(130, 48)),
                //                   backgroundColor: WidgetStateProperty.all(
                //                       Theme.of(context).colorScheme.surface),
                //                   shape: WidgetStateProperty.all(
                //                     RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(8.0),
                //                     ),
                //                   ),
                //                 ),
                //                 icon: Container(
                //                   decoration: const BoxDecoration(
                //                     shape: BoxShape.circle,
                //                     color: blue5,
                //                   ),
                //                   child: const Padding(
                //                     padding: EdgeInsets.all(5.0),
                //                     child: Icon(
                //                       Icons.add_rounded,
                //                       size: 24.0,
                //                       color: white,
                //                     ),
                //                   ),
                //                 ),
                //                 label: Text(
                //                   "New Account",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .bodyLarge!
                //                       .copyWith(
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .secondary,
                //                       ),
                //                   maxLines: 2,
                //                 ),
                //                 onPressed: () {
                //                   ref.read(accountsProvider.notifier).reset();
                //                   Navigator.of(context)
                //                       .pushNamed('/add-account');
                //                 },
                //               ),
                //             ),
                //           );
                //         } else if (accounts.isNotEmpty) {
                //           BankAccount account = accounts[i];
                //           return AccountsSum(account: account);
                //         }
                //         return null;
                //       },
                //     ),
                //     loading: () => const SizedBox(),
                //     error: (err, stack) => Text('Error: $err'),
                //   ),
                // ),

                // lastTransactions.when(
                //   data: (transactions) =>
                //       TransactionsList(transactions: transactions),
                //   loading: () => const SizedBox(),
                //   error: (err, stack) => Text('Error: $err'),
                // ),
                // Display the transactions list
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //   child: Card(
                //     elevation: 3, // Adds a subtle shadow to the card
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16), // Rounded edges
                //     ),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(
                //             16), // Ensures the child respects the card shape
                //         color: Theme.of(context)
                //             .colorScheme
                //             .surface, // Card background color
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(16.0),
                //             child: Text(
                //               "Last transactions",
                //               style: Theme.of(context).textTheme.titleLarge,
                //             ),
                //           ),
                //           const Divider(
                //               height: 1), // Divider between title and content
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                const TransactionScreen(userId: 'ACC001'),
                const SizedBox(height: 28),
                const BudgetsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
