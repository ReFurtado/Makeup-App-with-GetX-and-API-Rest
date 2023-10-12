// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../data/model/product_model.dart';


class ProductPage extends StatefulWidget {

   final ProductModel product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

//Botão favorito
bool isSolidHeart = false; 

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.circleChevronLeft,
            color: Color(0xFFe01e26),
          ),
          onPressed: () => Get.back()
        ),
        title: Text(
          widget.product.producttype[0].toUpperCase() + 
            widget.product.producttype.substring(1),
            style: TextStyle(
              color: Color(0xFFe01e26),
            ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSolidHeart = !isSolidHeart;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                isSolidHeart ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                color: Color(0xFFe01e26),
              ),
            ),
          )
        ],
      ),


      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30
          ),
          child: Column(
            children: [

              //Imagem
              Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.product.imagelink
                      )
                    )
                  ),
                ),
              ),

              //Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  //Nome
                  Text(
                    widget.product.name, 
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20), //Espaçamento

                  //Descrição
                  Text(
                    widget.product.description, 
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                  ),

                  SizedBox(height: 20), //Espaçamento

                  //Preço
                  Center(
                    child: Text(
                      'R\$ ${widget.product.price}', 
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(height: 20), //Espaçamento

                  //Nota
                  Center(
                    child: Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFFe01e26),
                      ),                            
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.product.rating.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                          SizedBox(width: 6), //Espaçamento
                          //Icone 
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.white,
                          )
                        ],
                      ),                             
                    ),
                  ),

                  SizedBox(height: 50), //Espaçamento

                  //Comprar
                  ElevatedButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFFfcd5d6),
                      minimumSize: Size.fromHeight(50),
                    ), 
                    child: Text(
                      'Adicionar ao carrinho',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFe01e26),
                      ),
                    ),
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}