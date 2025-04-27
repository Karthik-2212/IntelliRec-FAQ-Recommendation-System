import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intellirec/presentation_layer/pages/center_page/center_pages/company_page.dart';

class CompaniesPage extends StatefulWidget {
  final double width;

  const CompaniesPage({Key? key, required this.width}) : super(key: key);

  @override
  _CompaniesPageState createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  List<String> companies = [
    "Amazon",
    "Apple",
    "Facebook",
    "Google",
    "tcs",
    "Netflix",
    "American Express",
    "Barclays",
    "Bosch",
    "Cisco",
    "eBay",
    "Flipkart",
    "Goldman Sachs",
    "IBM",
    "Infosys",
    "Intel",
    "JP Morgan",
    "Microsoft",
    "Nokia",
    "Oracle",
    "PayPal",
    "Qualcomm",
    "Renault Nissan Limited",
    "Samsung",
    "Siemens",
    "Synopsys",
    "VMware",
    "Visa",
    "Walmart Labs",
    "Wipro",
    "Zoho",
    "Zscaler"
  ];
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
    Colors.cyan,
    Colors.amber,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Companies',
        style: TextStyle(
          fontWeight: FontWeight.bold,
           color: Colors.white,
        ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Number of columns
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: companies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>
                      CompanyPage(company: companies[index],
                      color:colors[index % colors.length] ,
                      )
                  )
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors[index % colors.length],
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withBlue(30), // Start color (lighter)
                      colors[index % colors.length], // End color (original)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("Top Questions",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                        fontSize: 25,
                      color: colors[index % colors.length],
                    ),
                  ),
                  Text(companies[index],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                  fontSize: 25
                ),
                ),

                ]),
              ),
            );
          },
        ),
      )
    );
  }
}
