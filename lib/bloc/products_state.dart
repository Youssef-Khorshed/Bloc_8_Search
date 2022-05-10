// ignore_for_file: unnecessary_this, must_be_immutable

part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class GetDataSuccessState extends ProductsState {
  AllProducts getdata;
  GetDataSuccessState(this.getdata);
  @override
  List<Object> get props => [getdata];
}

class SearchDataState extends ProductsState {
  String query;
  SearchDataState(this.query);
  @override
  List<Object> get props => [query];
}
