import 'package:flutter/material.dart';
import 'login.dart';

class Display extends StatefulWidget {
   Display({super.key});
  //  int funds_allocated;
  //  int funds_left; 


  @override
  State<Display> createState() => _DisplayState();
}


class _DisplayState extends State<Display> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Row(children: [
            Text('Funds allocated for this Quarter:'),
            Text('Funds left with the hospital for this Quarter:'),
            ]),
        ),
      ),
      SizedBox(height: 10,),

      
        ]),
    );
  }
}