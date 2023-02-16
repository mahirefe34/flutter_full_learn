import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                //servise istek at
                //sayfanın rengini düzenle
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              child: Text('Text Button',
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            const ElevatedButton(
              onPressed: null, //Tıklanması istemediğimiz durumda.
              child: Text('Elevated Button'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.abc),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            SizedBox(
              width: 300,
              height: 150,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text('Outlined Button'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text('InkWell Button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.safety_check),
              label: const Text('Mahir'),
            ),
            Container(
              height: 100,
              color: Colors.white,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Place Bid',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Borders
// CircleBorder(), RoundedRectangleBorder(),
