// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class transferMoney extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _transferMoney();
  }
}

class _transferMoney extends State<transferMoney> {
  String dropdownvalue = 'Item 1';   
  
  // List of items in our dropdown menu
  var items = [    
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 71, 196, 79),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Transfer Money'))
                ],
          ),
          actions: [
            Container(
              alignment: Alignment.centerRight,
              child: const Text(
                '',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
        body:
        // const Center(
        //   child: Text(
        //     'Transfer Money Screen',
        //     style: TextStyle(
        //         fontSize: 30,
        //         fontStyle: FontStyle.italic,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.black),
        //   ),
        // ),
        Container(
                padding: const EdgeInsets.only(left: 40, top: 25, right: 40),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    children: [
                      // const SizedBox(
                      //   height: 40,
                      // ),
                      // const Center(
                      //   child: Text(
                      //     "Transfer Money Screen",
                      //     style: TextStyle(
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.bold,
                      //         fontStyle: FontStyle.italic,
                      //         fontSize: 30),
                      //   ),
                      // ),
                      
                    TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                   // keyboardType: TextInputType.emailAddress,
                   // controller: pN,
                    maxLength: 11,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(RegExp('[^0-9]')),
                    ],
                    decoration: const InputDecoration(
                       prefixIcon: Icon(Icons.phone_android,color: Colors.white,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 71, 196, 79),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),


                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      
                    ),
                    inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
  ],
                    maxLength: 11,
                  //  inputFormatters: <TextInputFormatter>[
                    //  FilteringTextInputFormatter.deny(RegExp('[^0-9]')),
                    //],
                    
                    decoration: const InputDecoration(
                       prefixIcon: Icon(Icons.money_off_sharp,color: Colors.white,),
                       //suffixText: Text($EGP'),
                       suffixText: 'EGP',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 71, 196, 79),
                      hintText: 'Cash Ammount',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                      
                    ),
                  ),

                  
                
           Container(
            // padding: const EdgeInsets.all(20),
             //padding: const EdgeInsets.only(left: 40, top: 25, right: 60),
// decoration:  BoxDecoration(
//   borderRadius: BorderRadius.circular(16.0),
//   color: Color.fromARGB(255, 71, 196, 79),
//   ),
             child: DropdownButton(
               elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        
        color: Colors.deepPurpleAccent,
      ),
                             value: dropdownvalue,
                                           // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

               
              items: items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                  );
                }).toList(),

                //After selecting the desired option,it will
                //change button value to selected value
                onChanged: (String? newValue) { 
                  setState(() {
                      dropdownvalue = newValue!;
                  },);
                },
),
           ),
                  
                   Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 71, 196, 79)),
                        ),
                        child: const Text('view'),
                        onPressed: () {},
                      ),
                    ),
                     
                    ],
                  ),
                ),
              )
        );
  }
}
