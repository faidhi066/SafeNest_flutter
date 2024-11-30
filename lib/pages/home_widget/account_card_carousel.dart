import 'package:flutter/material.dart';

class AccountCardCarousel extends StatefulWidget {
  const AccountCardCarousel({super.key});

  @override
  _AccountCardCarouselState createState() => _AccountCardCarouselState();
}

class _AccountCardCarouselState extends State<AccountCardCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _selectedCardIndex = 0;

  final List<List<Color>> gradients = [
    [Colors.yellow, Colors.orange], // Gradient for Card 0
    [Colors.purple, Colors.pink], // Gradient for Card 1
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320, // Adjust height for the cards
          child: PageView.builder(
            controller: _pageController,
            itemCount: gradients.length + 1, // Add one for the "Add New Card"
            onPageChanged: (index) {
              setState(() {
                _selectedCardIndex = index; // Update the selected card
              });
            },
            itemBuilder: (context, index) {
              if (index < gradients.length) {
                final bool isSelected = _selectedCardIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.symmetric(
                    horizontal: isSelected ? 10 : 20,
                    vertical: isSelected ? 10 : 30,
                  ),
                  width: isSelected ? 220 : 200, // Enlarge selected card
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: gradients[index % gradients.length],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: isSelected
                        ? [
                            const BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(0, 8), // Lifts the card
                            ),
                          ]
                        : [],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.account_balance,
                              color: Colors.white,
                              size: 24,
                            ),
                            Icon(
                              Icons.credit_card,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Available",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "RM 18,009.64",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Visa",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "****${525 + index}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // "Add New Card" placeholder
                return GestureDetector(
                  onTap: _addNewCard,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _addNewCard() {
    setState(() {
      // Add a new gradient to represent the new card
      gradients.add([
        Colors.blueAccent,
        Colors.lightBlue, // Example gradient colors for new cards
      ]);
      // Automatically scroll to the newly added card
      _pageController.jumpToPage(gradients.length - 1);
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }
}
