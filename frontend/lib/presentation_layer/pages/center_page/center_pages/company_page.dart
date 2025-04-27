import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intellirec/presentation_layer/pages/center_page/center_pages/faqs.dart';
import 'package:intellirec/presentation_layer/pages/center_page/center_pages/relatedTopicsPage.dart';
class CompanyPage extends StatefulWidget {
  final String company;
  final Color color;
  const CompanyPage({super.key,required this.company,
  required this.color
  });
  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  PageController _pageController=PageController();
  final List<String> items =
  ['Top FAQS',
    'Related Topics'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16151a),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: widget.color,
        title: Text(this.widget.company,style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
               right: 20
            ),
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 300,
                  height: 60,
                  child:
                  DropdownButtonHideUnderline(child:
                  DropdownButton2<String>(
                    iconStyleData: IconStyleData(
                      iconEnabledColor: Colors.white
                    ),
                      isExpanded: true,
                      hint: Text(
                        'Filter Options',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                          .toList(),
                      value: selectedValue, // Use the state variable here
                      onChanged: (String? value) {
                      if (value=="Top FAQS"){
                        _pageController.jumpToPage(0);
                      }
                      else{
                        _pageController.jumpToPage(1);
                      }
                        setState(() {
                          selectedValue = value; // Update the selected value
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white),
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),)
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                Faqs(Company: this.widget.company,),
                Relatedtopicspage(Company: this.widget.company,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
