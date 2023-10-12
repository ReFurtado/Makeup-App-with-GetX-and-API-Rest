// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchFormField extends StatefulWidget {
  const SearchFormField({
    super.key,  
  });

  @override
  State<SearchFormField> createState() => _SearchFormFieldState();
}

class _SearchFormFieldState extends State<SearchFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 0,
      ),
      child: Column(
        children: [

          //Pesquisa
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Procurar',
              hintStyle: TextStyle(
                color: Colors.white
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
              filled: true,
              fillColor: Colors.white30
            ),
          ),

          //Icone
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.wb_shade,
              color: Colors.white,
            ),
          ),

          
        ],
      ),
    );
  }
}