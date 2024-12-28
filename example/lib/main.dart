import 'package:pro_plus/pro_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Pro')),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Stack(
                children: [
                  Image.asset('assets/image.jpg', height: 250,width: double.infinity,fit: BoxFit.fill,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        color: Colors.red.glassEffect(),
                        child: Text('Red Glass Effect').withColor(Colors.white).center(),
                      ).paddingOnly(bottom: 10),
                      Container(
                        color: Colors.red.frostedEffect(),
                        height: 50,
                        width: 200,
                        child: Text('Red Frosted Effect').withColor(Colors.white).center(),
                      ).paddingOnly(bottom: 10),
                      Container(
                        color: Colors.red.glossyFrosted(),
                        height: 50,
                        width: 200,
                        child: Text('Red Glossy Frosted').withColor(Colors.white).center(),
                      ).paddingOnly(bottom: 10),
                      Container(
                        color: Colors.red,
                        height: 50,
                        width: 200,
                        child: Text('Red ').center(),
                      ),
                    ],
                  ).center()
                ],
              ),
            ),

            Text("with Background Color").paddingAll(16).center().withBackgroundColor(Colors.yellow).withBackgroundGradient([Colors.yellow, Colors.red]),
            Text("with Background Gradient").paddingAll(16).center().withBackgroundGradient([Colors.yellow, Colors.red],),
            Text("with Background Gradient").paddingAll(16).center().withGlossyEffect(overlayColor: Colors.green,glossFactor: 0.5 ),
            Icon(Icons.star, size: 50).withTooltip('I am tool tip ').withBackgroundColor(Colors.green,).paddingOnly(bottom: 10).align(Alignment.centerLeft),
            Text("Press Me").withColor(Colors.white).asColoredButton(backgroundColor: Colors.green).onSingleTap(()=> debugPrint('on Tap Pressed')),
            Divider(),
            Text('List View').center(),
            Divider(),
            Expanded(
              child: List.generate(10,(i)=> 'Item $i').toListView(
                itemBuilder: (context, item, index) => ListTile(title: Text(item)),
              ),
            ),
            Divider(),
            Text('Grid View').center(),
            Divider(),
            Expanded(
              child: List.generate(10,(i)=> 'Item $i').toGridView(
                  itemBuilder: (context, item, index) => ListTile(title: Text(item)),
                  crossAxisCount: 4
              ),
            ),

          ],
        ),
      ),
    );
  }
}
