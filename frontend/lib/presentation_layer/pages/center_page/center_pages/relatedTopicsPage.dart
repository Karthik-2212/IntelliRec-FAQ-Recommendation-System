import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:intellirec/questions_dictionary.dart';

class Relatedtopicspage extends StatefulWidget {
  final String Company; 
  const Relatedtopicspage({super.key,required String this.Company});
  @override
  State<Relatedtopicspage> createState() => _RelatedtopicspageState();
}

class _RelatedtopicspageState extends State<Relatedtopicspage> {

  List topicQuestions=[];
  Future<void> getTopicQuestions(String topic)async{
    final dio = Dio();
    final response = await dio.get('http://127.0.0.1:7200/faqs/${this.widget.Company}?query=${topic}');
    topicQuestions=response.data['faqs'];
    setState(() {});
  }

  List<String> chipLabels= [
    "Array",
    "Linked List",
    "Hash Table",
    "String",
    "Math",
    "Two Pointers",
    "Backtracking",
    "Dynamic Programming",
    "Tree",
    "Stack",
    "Breadth-first Search",
    "Depth-first Search",
    "Greedy",
    "Bit Manipulation",
    "Design",
    "Sort",
    "Binary Search",
    "Divide and Conquer",
    "Heap",
    "Graph",
  ];
  int? selectedChipIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(chipLabels.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ChoiceChip(
                      label: Text(chipLabels[index],
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                      selected: selectedChipIndex == index,
                      selectedColor: Colors.blue,
                      backgroundColor: Colors.black,
                      onSelected: (bool selected)async{
                        setState(() {
                          selectedChipIndex = selected ? index : null; // Select only one
                        });
                     await getTopicQuestions(chipLabels[index]);
                      },
                    ),
                  );
                }),
              )),
          Expanded(
            child: ListView(
                children: List.generate(topicQuestions.length,
                    (index)=> ExpandedTile(
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
                      title: Text(topicQuestions[index].toString()), // Show dynamic title
                      content: Container(
                        color: Colors.black,
                        child: Text(questions[topicQuestions[index].toString()].toString()),
                      ),
                      controller: ExpandedTileController(),
                    )),
              ),
          ),
        ],
      ),
    );
  }
}