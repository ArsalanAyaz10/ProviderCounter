import 'package:counter_app/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "CounterProvider.dart";

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CounterProvider()),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          shadowColor: Colors.blueAccent,
          elevation: 3,
          title: const Text("Counter App",style:TextStyle(
            color: Colors.white,
            fontSize: 25,
          )),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Provider.of<CounterProvider>(context,listen: false).increment();
          },
          elevation: 5,
          autofocus: true,
          focusElevation: 5,
          child: const Icon(Icons.add),
        ),
        body: const CounterUI(),
      ),
    );
  }
}

class CounterUI extends StatefulWidget {
  const CounterUI({super.key});

  @override
  State<CounterUI> createState() => _CounterUIState();
}

class _CounterUIState extends State<CounterUI> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, CounterProvider, child){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    CounterProvider.counter.toString(),
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
                ElevatedButton(onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Second()));
                }, child: Text("Second Page")),
              ],
            ),
          ],
        );
      }
    );}
}

