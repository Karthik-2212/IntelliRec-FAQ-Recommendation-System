import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarr extends StatefulWidget {
   final double height;
  final double width;
  final String userProfileUrl;

 AppBarr({
    super.key,
    required this.height,
    required this.width,
    required this.userProfileUrl,
  });

  @override
  State<AppBarr> createState() => _AppBarState();
}

class _AppBarState extends State<AppBarr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 0.3,
          ),
        ),
      ),
      height: 0.05 * widget.width,
      width: widget.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// 🔹 Centered & Lengthier Search Bar
          Container(
            decoration: BoxDecoration(
              color: Color(0xff1b1e27),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 0.035 * widget.width,
            width: 0.45 * widget.width, // ⬅️ Increased from 0.3 to 0.45
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.search_rounded,
                    color: Color(0xffc0c2cd),
                    size: 0.018 * widget.width,
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.blue),
    ),
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        // Icon(
        //   CupertinoIcons.search,
        //   color: Color(0xff6d7079),
        // ),
        // SizedBox(width: 8),
        Expanded(
          child: CupertinoTextField(
            cursorColor: Color(0xffc0c2cd),
            decoration: null, // Remove internal border
            placeholder: "Search",
            placeholderStyle: TextStyle(
              color: Color(0xff6d7079),
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    ),
  ),
)
              ],
            ),
          ),

          /// 🔹 Left Placeholder (e.g., Logo)
          Positioned(
            left: 30,
            child: Text("Hi 👋,${this.widget.userProfileUrl}",
            style:GoogleFonts.inter(
               fontWeight:FontWeight.bold,
               color:Colors.white
            )
            ),
          ),

          /// 🔹 Right Icons
          Positioned(
            right: 20,
            child: Row(
              children: [
                Container(
                  height: 0.03 * widget.width,
                  width: 0.03 * widget.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff1b1e27),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.notifications_active,
                      size: 0.02 * widget.width,
                      color: Color(0xffc0c2cd),
                    ),
                  ),
                ),
                SizedBox(width: 10),
//                Container(
//   height: 0.03 * widget.width, // Make the parent container big enough
//   width: 0.12 * widget.width,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(50),
//     color: Color(0xff1b1e27),
//   ),
//   child: Center(
//     child: Container(
//       width: 0.03 * widget.width,
//       height: 0.03 * widget.width,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//       ),
//       child: ClipOval(
//         child: CachedNetworkImage(
//           imageUrl: widget.userProfileUrl,
//           width: 0.03 * widget.width, // Increase image size to match the container
//           height: 0.03 * widget.width,
//           fit: BoxFit.cover,
//           placeholder: (context, url) => CircularProgressIndicator(),
//           errorWidget: (context, url, error) => Icon(Icons.error),
//         ),
//       ),
//     ),
//   ),
// )


              ],
            ),
          ),
        ],
      ),
    );
  }
}
