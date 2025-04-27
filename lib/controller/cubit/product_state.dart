part of 'product_cubit.dart';

@immutable
sealed class ProductState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<Product> productList;

  ProductLoaded(this.productList);

  @override
  List<Object?> get props => [productList];

}

final class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
