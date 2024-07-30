import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/models/product.dart';

class ProductCubit extends Cubit<List<Product>> {
  ProductCubit()
      : super([
          Product(
            category: "living room",
            count: 100,
            id: UniqueKey().toString(),
            imageUrl: "https://www.pngall.com/wp-content/uploads/2016/04/BMW-PNG-Image.png",
            price: 1550.0,
            title: "BMW",
          ),
          Product(
            category: "living room",
            count: 100,
            id: UniqueKey().toString(),
            imageUrl: "https://www.pngall.com/wp-content/uploads/2016/04/BMW-PNG-Image.png",
            price: 1555.0,
            title: "BMW",
          ),
          Product(
            category: "living room",
            count: 100,
            id: UniqueKey().toString(),
            imageUrl: "https://www.pngall.com/wp-content/uploads/2016/04/BMW-PNG-Image.png",
            price: 155.0,
            title: "BMW",
          ),
        ]);

  void addProduct(Product product) {
    emit([...state, product]);
  }

  void editProduct(Product updatedProduct) {
    final products = state;
    final index = products.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) {
      final updatedProducts = List<Product>.from(products)..[index] = updatedProduct;
      emit(updatedProducts);
    }
  }

  void deleteProduct(String id) {
    emit(state.where((product) => product.id != id).toList());
  }
}
