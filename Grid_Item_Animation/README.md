<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

Customizable Grid View: CustomGridViewWithShadow creates a grid view with a fixed number of columns and customizable cross-axis and main-axis spacing.

Interactive Tap Animation: GridItemWidget is a grid item widget that animates when tapped. It smoothly moves up, changes its appearance, and can be customized with various animation properties.

Shadow Effects: The grid item includes a shadow effect that changes when tapped, providing an interactive and visually appealing experience.


## Usage

Installation: Add the grid_item_animation package to your pubspec.yaml file.

dependencies:
grid_item_animation: ^latest_version

Import Package: Import the package in your Dart file where you plan to use it.
import 'package:grid_item_animation/grid_item_animation.dart';

Implementation: Use the CustomGridViewWithShadow and GridItemWidget widgets within your Flutter application as follows:

<hr>

<table>
<tr>

## Code

<td>

    class CustomGridViewWithShadow extends StatelessWidget {
        CustomGridViewWithShadow({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Custom GridView'),
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

</td>
</tr>


<tr>

<td>

## Code Output

<img src="https://raw.githubusercontent.com/Priyankshah1024/Grid_Item_Animation/main/Grid_Item_Animation/grid_preview.jpg" alt="GridView Item Animation" width="500px" height="500px"/>
</td>
</tr>
</table>    
