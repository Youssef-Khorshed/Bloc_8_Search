import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/dio.dart';
import 'package:flutter_application_1/Model/model.dart';
import 'package:rxdart/rxdart.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetData>(_getdata, transformer: _trans);
    on<SearchData>(_search, transformer: _searchtrans);
  }
  AllProducts getdata = AllProducts.empty();
  String textquery = '';
  FutureOr<void> _getdata(GetData event, Emitter<ProductsState> emit) async {
    getdata = await getDataFromApi();
    emit(GetDataSuccessState(getdata));
  }

  Stream<GetData> _trans(Stream<GetData> events, EventMapper<GetData> mapper) {
    return events
        .debounceTime(const Duration(milliseconds: 500))
        .asyncExpand(mapper);
  }

  FutureOr<void> _search(SearchData event, Emitter<ProductsState> emit) async {
    textquery = event.query;
    getdata = await getDataFromApi();

    getdata.data = getdata.data
        .where((element) => element.productsTypeNameEnglish!
            .toLowerCase()
            .contains(textquery.toLowerCase()))
        .toList();
    print(getdata.data.length);
    emit(SearchDataState(textquery));
  }

  Future<AllProducts> getDataFromApi() async {
    final alldata =
        await DioHelper.getdata(path: 'LoadProductsTypeCategoriesPage.php');
    final res = jsonDecode(alldata.data);
    final value = AllProducts.fromJson(res);
    return value;
  }

  Stream<SearchData> _searchtrans(
      Stream<SearchData> events, EventMapper<SearchData> mapper) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .asyncExpand(mapper);
  }
}
