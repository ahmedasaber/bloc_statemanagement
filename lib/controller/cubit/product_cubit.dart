import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_statemanagement/model/product-model.dart';
import 'package:bloc_statemanagement/repo/product-repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  ProductRepo productRepo = ProductRepo();

  getProducts() async{
    try {
      await Future.delayed(Duration(seconds: 1));
      List<Product> productList = await productRepo.fetchProducts();
      emit(ProductLoaded(productList));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

}
