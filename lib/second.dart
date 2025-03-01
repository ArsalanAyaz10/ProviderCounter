import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<CounterProvider>(context,listen: false).increment();
        },
        elevation: 5,
        autofocus: true,
        focusElevation: 5,
        child: const Icon(Icons.add),
      ),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Second Page")),
              Text('Times Pressed: ${value.counter.toString()}',style: TextStyle(fontSize: 15),),
            ],
          );
        },
      ),
    );
  }
}
