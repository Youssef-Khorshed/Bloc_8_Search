part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class GetData extends ProductsEvent {}

class SearchData extends ProductsEvent {
  String query;
  SearchData({required this.query});
}
