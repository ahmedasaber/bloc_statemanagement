import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/model/product-model.dart';
import 'package:bloc_statemanagement/repo/product-repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoading()) {

    ProductRepo productRepo = ProductRepo();

    on<FetchProducts>((event, emit) async{
      try {
        await Future.delayed(Duration(seconds: 1));
        List<Product> productList = await productRepo.fetchProducts();
        emit(ProductLoaded(productList));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
