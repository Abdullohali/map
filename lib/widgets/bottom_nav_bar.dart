import 'package:flutter/material.dart';

class AppBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onPressed;

  const AppBottomNavBar({
    Key? key,
    required this.onPressed,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  void initState() {
    super.initState();
    // Hive.box('parentImage').clear(); Bazi Hivelarini clear qilish uchun joy chiqib ketganda tozalanadiganlarni
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _setItem(Icons.home, 'Home', 0),
            flex: 5,
          ),
          Expanded(
            child: _setItem(Icons.location_city, 'Location', 1),
            flex: 5,
          ),
        ],
      ),
    );
  }

   _setItem(var assetIcon, String label, int index) =>
      InkWell(
        onTap: () {
          widget.onPressed.call(index);
        },
        child: Column(
          children: [
            SizedBox(height: 6),
            Icon(assetIcon,
                color:
                    index == widget.currentIndex ? Colors.blue : Colors.grey),
            SizedBox(height: 7),
            Text(label,
                style: TextStyle(
                    fontSize: index == widget.currentIndex ? 12.0 : 10.5,
                    color: index == widget.currentIndex
                        ? Colors.blue
                        : Colors.grey)),
          ],
        ),
      );
}
