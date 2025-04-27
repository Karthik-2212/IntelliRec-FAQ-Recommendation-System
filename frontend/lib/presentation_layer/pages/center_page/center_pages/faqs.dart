import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import '../../../../questions_dictionary.dart';

class Faqs extends StatefulWidget {
  final String Company; 
  const Faqs({super.key,required String this.Company});
  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {

  late Future<List> faqs;
  @override
  void initState() {
    super.initState();
    faqs=getFaqs();
  }
  Future<List> getFaqs()async{
    final dio = Dio();
    final response = await dio.get('http://127.0.0.1:7200/faqs/${this.widget.Company}');
    // await Future.delayed(Duration(seconds: 3));
    return response.data['faqs'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
            future: faqs,
            builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return ExpandedTile(
                  contentseparator: 0,
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  ),

                  trailingRotation: 90,
                  theme: const ExpandedTileThemeData(
                    footerSeparatorColor: Colors.white,
                    headerColor: Colors.black,
                    headerSplashColor: Colors.transparent,
                    contentBackgroundColor: Colors.black,
                    headerBorder: OutlineInputBorder(
                    ),
                    fullExpandedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey),
                    ),
                  ),
                  title: Text(item.toString()), // Show dynamic title
                  content: Container(
                    color: Colors.black,
                    child: Text(questions[item.toString()].toString()),
                  ),
                  controller: ExpandedTileController(),
                );
        });}
    ));}}