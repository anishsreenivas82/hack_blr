// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'login.dart';

class Display extends StatefulWidget {
   Display({super.key, required this.fundsAllocated, required this.fundsLeft});
   int fundsAllocated;
   int fundsLeft; 


  @override
  State<Display> createState() => _DisplayState();
}


class _DisplayState extends State<Display> {
TextEditingController _amount = TextEditingController(); 
TextEditingController _nameOfThePatient = TextEditingController();  
TextEditingController _detailsOfThePatient = TextEditingController();  

double _value = 1;


  @override
  Widget build(BuildContext context) {
    var fundsAllocated;
    var fundsLeft;
    fundsAllocated = fundsAllocated;
    fundsLeft = fundsLeft;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: Column(children: [
                        Text('Funds allocated for this Quarter: $fundsAllocated'),
                        SizedBox(height: 5,),
                        Text('Funds left with the hospital for this Quarter: $fundsLeft'),
                        
                        ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _amount,
                    decoration: const InputDecoration(
                          labelText: 'Amount Requested in Rs',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                    ),
                    TextFormField(
                    controller: _nameOfThePatient,
                    decoration: const InputDecoration(
                          labelText: 'Name Of The Patient',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                    ),
                    TextFormField(
                    controller: _detailsOfThePatient,
                    decoration: const InputDecoration(
                          labelText: 'Details Of The Patient',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                    ),
                    Slider(value: _value, 
                    min: 1,
                    max: 3,
                    label: 'Urgency Level',
                    onChanged: (dynamic newValue) {
                      setState(() {
              _value = newValue;
                      });
                    },),
                    TextButton(
                      onPressed: () {
                        print("Your request has been submitted!");
              //the request should be sent to the backend 
                      }, 
                      child: Text('Submit Request'),)
                ],
                      
              ),
            ),
              
          )
          ]),
      ),
    );
  }
}