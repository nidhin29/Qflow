import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/Presentation/Home/home.dart';
import 'package:hospital/Presentation/Member/booking.dart';
import 'package:hospital/Presentation/Profile/profile.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  final PageController _pageController = PageController();

  @override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _selectedIndexNotifier.value = index;
            },
            children: const [
              HomeScreen(),
              BookingPage(),
              ProfileScreen(),
            ],
          ),
          Positioned(
            bottom: 15.h,
            left: 0,
            right: 0,
            child: CustomNavBar(
              selectedIndexNotifier: _selectedIndexNotifier,
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final ValueNotifier<int> selectedIndexNotifier;
  final PageController pageController;

  const CustomNavBar({
    super.key,
    required this.selectedIndexNotifier,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 85.h,
        width: 245.w,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(79, 79, 79, 0.11),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          NavBarItem(
  imagePath: 'assets/icon/ticket.png',
  index: 0, // First item
  notifier: selectedIndexNotifier,
  pageController: pageController,
),
NavBarItem(
  imagePath: 'assets/icon/home.png',
  index: 1, // Second item
  notifier: selectedIndexNotifier,
  pageController: pageController,
),
NavBarItem(
  imagePath: 'assets/icon/profile.png',
  index: 2, // Third item
  notifier: selectedIndexNotifier,
  pageController: pageController,
  isCenterIcon: true,
),

          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String imagePath;
  final int index;
  final ValueNotifier<int> notifier;
  final PageController pageController;
  final bool isCenterIcon;

  const NavBarItem({
    super.key,
    required this.imagePath,
    required this.index,
    required this.notifier,
    this.isCenterIcon = false,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: notifier,
      builder: (context, selectedIndex, _) {
        final bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            notifier.value = index;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            width: 70.w,
            height: 72.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromRGBO(253, 253, 253, 1)
                  : const Color.fromRGBO(255, 255, 255, 0.22),
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Colors.white
                    : const Color.fromRGBO(247, 247, 247, 1),
                width: 1,
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 20.w,
                height: 22.h,
                color: Colors.black,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
