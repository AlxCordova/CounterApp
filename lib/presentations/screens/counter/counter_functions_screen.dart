import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text(clickCounter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 25)),
          ],
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomBotton(icon: Icons.refresh_outlined, onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            }),
            const SizedBox(height: 10),
            CustomBotton(icon: Icons.plus_one_outlined, onPressed: () {
              setState(() {
                clickCounter++;
              });
            }),
            const SizedBox(height: 10),
            CustomBotton(icon: Icons.exposure_minus_1_outlined, onPressed: () {
              setState(() {
                if(clickCounter == 0) return;
                clickCounter--;
              });
            })
          ],
        ));
  }
}

class CustomBotton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomBotton({
    super.key, 
    required this.icon, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      
      onPressed:  onPressed,
      child: Icon(icon),
    );
  }
}
