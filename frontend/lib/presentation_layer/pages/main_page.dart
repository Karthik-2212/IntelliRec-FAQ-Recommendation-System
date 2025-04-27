import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:highlight/languages/python.dart';
import 'package:intellirec/main.dart';
import 'package:intellirec/presentation_layer/pages/right_page/right_page.dart';
import 'package:intellirec/presentation_layer/widgets/app_bar.dart';
import 'package:intellirec/presentation_layer/widgets/left_button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'center_page/center_page.dart';
List<Map<String, dynamic>> menuItems = [
  {
    'icon': Icons.home,
    'text': 'Home',
  },
  // {
  //   'icon': Icons.question_answer,
  //   'text': 'Questions',
  // },
  {
    'icon': Icons.business,
    'text': 'Companies',
  },
  // {
  //   'icon': Icons.label,
  //   'text': 'Tags',
  // },
  {
    'icon': Icons.people,
    'text': 'Users',
  },
];

class MainPage extends StatefulWidget {
  //MainPage({super.key});
  final String profileUrl;
  final String userName;

  MainPage({
    super.key,
    required this.profileUrl,
    required this.userName,
  });
  @override
  State<MainPage> createState() => _HomePageState();
}
class _HomePageState extends State<MainPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
  final snackBar = SnackBar(
    elevation: 0,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    content: Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 40.0, left: 20.0),
        child: Container(
          width: 300,
          height: 110,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0d1b2a), Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 12,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(
                '👋 Welcome!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '${this.widget.userName}, IntelliRec is ready for you!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
});

  }
  bool _left_button_clciked=false;
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MediaQuery(
      data: MediaQueryData(
        textScaler: TextScaler.linear(1)
      ),
      child: Scaffold(
        backgroundColor: Color(0xFF000000), //color change
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBarr(
              userProfileUrl:this.widget.userName,
              height: screenHeight,
              width: screenWidth,
            ),
            Expanded(child: Container(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                       border: Border(
                         right: BorderSide(
                           color: Colors.blue,
                           width: 0.3,
                         ),
                       )
                    ),
                    width: 0.18*screenWidth,
                    child:  ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context,index){
                          return
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent, // Disable splash effect
                            highlightColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            onTap: (){
                              SharedPageController.controller.jumpToPage(index);
                              _selectedIndex = index;
                              setState(() {
                              });
                            },
                            child: LeftButton(
                              textColor: Color(0xFFFFFFFF),
                                backgroundColor: _selectedIndex==index?Color(0xFF00BFFF):Colors.transparent,
                                screenWidth: screenWidth,
                                text: menuItems[index]['text'],
                                imagePath: menuItems[index]['icon']),
                          ),
                        );
                        }
                    )
                    ),
                  Container(
                    width: 0.8*screenWidth,
                    // decoration: BoxDecoration(
                    //     border: Border(
                    //       right: BorderSide(
                    //         color: Colors.blue,
                    //         width: 0.3,
                    //       ),
                    //     )
                    // ),
                    child: CenterPage(
                      width: screenWidth,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
