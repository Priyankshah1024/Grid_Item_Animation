import 'package:flutter/material.dart';

class CustomGridViewWithShadow extends StatelessWidget {
  const CustomGridViewWithShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom GridView'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const GridItemWidget();
          },
        ),
      ),
    );
  }
}

class GridItemWidget extends StatefulWidget {
  const GridItemWidget({super.key});

  @override
  GridItemWidgetState createState() => GridItemWidgetState();
}

class GridItemWidgetState extends State<GridItemWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(4),
        transform:
            isTapped ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isTapped
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5),
              spreadRadius: isTapped ? 4 : 2,
              blurRadius: isTapped ? 8 : 4,
              offset: Offset(0, isTapped ? 4 : 2),
            ),
          ],
          gradient: isTapped
              ? const LinearGradient(
                  colors: [Colors.blueGrey, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: !isTapped ? Colors.white : null,
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: isTapped ? 25 : 21,
              color: isTapped ? Colors.white : Colors.black,
              fontWeight: isTapped ? FontWeight.bold : FontWeight.normal,
              fontStyle: isTapped ? FontStyle.italic : FontStyle.normal,
              letterSpacing: isTapped ? 1.2 : 0,
            ),
            child: const Text(
              'Click Me!',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
