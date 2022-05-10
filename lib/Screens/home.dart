import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/constant.dart';
import 'package:flutter_application_1/Screens/searchpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ProductsBloc>();
    final blocstate = context.watch<ProductsBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Simple Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SearchWidget(
                text: bloc.textquery,
                onChanged: (String query) {
                  bloc.add(SearchData(query: query));
                },
                hintText: 'Search'),
            blocstate is ProductsInitial
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3),
                    child: const CircularProgressIndicator(),
                  )
                : bloc.getdata.data.isEmpty
                    ? Image.network(notfound)
                    : Expanded(
                        child: ListView.separated(
                          itemBuilder: ((context, index) => ListTile(
                                leading: ClipOval(
                                  child: Image.network(
                                    '${bloc.getdata.data[index].productsTypeImage}',
                                    fit: BoxFit.fill,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                title: Text(
                                    '${bloc.getdata.data[index].productsTypeNameEnglish}'),
                              )),
                          itemCount: bloc.getdata.data.length,
                          separatorBuilder: (context, index) => Divider(),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
