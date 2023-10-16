// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../data/repository/http_controller.dart';
import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  final HttpController controller;
  const WelcomePage({super.key, required this.controller});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  //Controlador de video
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/makeup.mp4')
      ..initialize().then((_) {
        _controller.play(); //Inicia a reprodução
        _controller.setLooping(true); //Loop
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //Video
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),

          //Nome
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Daily Makeup',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            ),
          ),
          
          //Botão entrar
          Positioned(
            bottom: 50,
            left: 10,
            right: 10,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => Get.to(() => HomePage(
                      controller: Get.find<HttpController>(), 
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFFe01e26),
                      minimumSize: Size.fromHeight(50),
                    ), 
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                  ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}


