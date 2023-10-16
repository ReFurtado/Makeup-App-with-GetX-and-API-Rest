// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:makeup_app/data/model/category_image.dart';

import 'package:makeup_app/data/model/product_model.dart';
import 'package:makeup_app/data/repository/http_controller.dart';
import 'package:makeup_app/screens/category_page.dart';
import 'package:makeup_app/screens/product_page.dart';

class HomePage extends StatefulWidget {
  final HttpController controller;
  const HomePage({
    Key? key,
    required this.controller, 
    }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Categorias únicas
  late List<String> uniqueCategory;

  @override
  void initState() {
    super.initState();
    uniqueCategory = [];   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcd5d6),

      //AppBar
      appBar: AppBar(
        backgroundColor: Color(0xFFe01e26),
        elevation: 0,
        //Icone menu
        leading: IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
        //Titulo
        title: Text(
          'Daily MAKEUP',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ) 
        ),
        //Carrinho de compras
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Badge(
              //isLabelVisible: true,
              label: Text('0'),
              child: Icon(
                Icons.shopping_cart,
              )
            )
          ),
        ],
        //Aba de pesquisa
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(100),
        //   child: SearchFormField(), 
        // ),  
      ),

      //Body
      body: Column(
        children: [        

          //Produtos
          Expanded(
            child: widget.controller.obx(
              (state) { //Sucesso

                //Adicionar categorias à lista 'uniqueCategory'
                state.forEach((item) {
                  if (!uniqueCategory.contains(item.producttype)) {
                    uniqueCategory.add(item.producttype);
                  }
                });
                //print(uniqueCategory);
                return Column(
                  children: [       

                    //Categorias
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 180,
                          enlargeCenterPage: true,
                        ),
                        items: uniqueCategory.map((category) {
                          print(category);
                            return GestureDetector(
                            onTap: () => Get.to(() => CategoryPage(
                              controller: widget.controller, 
                              selectedCategory: category,
                            )),
                            child: Container(
                              height: 460,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    categoryImage[category] ?? 'imagem_padrao.png',
                                  )
                                )
                              )
                              ,
                              // child: Image.asset(
                              //   categoryImage[category] ?? 'imagem_padrao.png',
                              // ),
                            ),
                          );                   
                        }).toList(),        
                      ),
                    ),

                    //Título
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Todos os produtos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            //textAlign: TextAlign.start,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowUpWideShort,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    
                    
                    //Produtos
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          childAspectRatio: 0.8
                        ),
                        //reverse: isOrder,
                        itemCount: state.length,
                        itemBuilder: (_, index) {
                          final ProductModel item = state[index];
                          return GestureDetector(
                            onTap: () => Get.to(() => ProductPage(product: item)),
                            child: Column(
                              children: [
                    
                                //Produtos
                                Container(
                                  //width: 100,
                                  //height: 300,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.white,
                                    //     blurRadius: 10
                                    //   )
                                    // ]
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 20
                                    ),
                                    child: Column(
                                      children: [
                                        //Imagem do produto
                                        Container(
                                          //width: 140,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                item.imagelink,
                                              )
                                            )
                                          ),
                                        ),
                                        //Nome do produto
                                        ListTile(
                                          title: Text(
                                            item.name,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        //Descrição
                                        // ListTile(
                                        //   title: Text(
                                        //     item.description,
                                        //     maxLines: 2,
                                        //     overflow: TextOverflow.ellipsis,
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 0,
                                            vertical: 0
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              //Preço do produto
                                              Text(
                                                'R\$ ${item.price}',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w300
                                                ),
                                              ),
                                              //Nota
                                              Container(
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
                                                      item.rating.toString(),
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
                                              )
                                            ],
                                          ),
                                        ),                   
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                );
              }, 
            
              //Erro
              onError: (error) {
                return Center(child: Text(error!));
              }
            ),
          ),
        ],       
      ), 
    );
  }  
}

  
