import 'package:flutter/material.dart';

class CustomGridViewWithShadow extends StatelessWidget {
  CustomGridViewWithShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom GridView'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GridItemWidget();
          },
        ),
      ),
    );
  }
}


class GridItemWidget extends StatefulWidget {
  GridItemWidget({super.key});

  @override
  _GridItemWidgetState createState() => _GridItemWidgetState();
}

class _GridItemWidgetState extends State<GridItemWidget> {
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
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(4),
        transform: isTapped
            ? Matrix4.translationValues(0, -5, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isTapped ? Colors.blue.withOpacity(0.5) : Colors.grey.withOpacity(0.5),
              spreadRadius: isTapped ? 4 : 2,
              blurRadius: isTapped ? 8 : 4,
              offset: Offset(0, isTapped ? 4 : 2),
            ),
          ],
          gradient: isTapped
              ? LinearGradient(
            colors: [Colors.blueGrey, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: !isTapped ? Colors.white : null,
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: isTapped ? 25 : 21,
              color: isTapped ? Colors.white : Colors.black,
              fontWeight: isTapped ? FontWeight.bold : FontWeight.normal,
              fontStyle: isTapped ? FontStyle.italic : FontStyle.normal,
              letterSpacing: isTapped ? 1.2 : 0,
            ),
            child: Text(
              'Click Me!', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
