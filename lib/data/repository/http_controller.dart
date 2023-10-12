// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:makeup_app/data/repository/product_repository.dart';

class HttpController extends GetxController with StateMixin {

  //controlador ordem
  bool isOrden = true;
  
  //Instância de IProductRepository que será usada para buscar produtos
  final IProductRepository _httpRepository;

  HttpController(this._httpRepository);

  @override
  void onInit() {
    super.onInit();
    findProducts(); //Inicia a busca de produtos assim que o controlador é criado
  }
  
  Future<void> findProducts() async {
    change([], status: RxStatus.loading()); //Atualiza o estado para "carregando" antes de iniciar a busca
    try {
    final data = await _httpRepository.getProduct(); //Faz uma chamada para buscar dados de produtos por meio do _httpRepository
      
      data.sort((a, b) {
        if(isOrden) {
          return a.price.compareTo(b.price);
        } else {
          return b.price.compareTo(a.price);
        }
      });

      change(data, status: RxStatus.success()); //Atualiza o estado com os dados retornados da busca

    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar')); //Atualiza o estado para indicar um erro
    }
  }

}