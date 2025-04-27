import 'package:flutter/material.dart';
import 'package:intellirec/presentation_layer/pages/main_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intellirec/presentation_layer/pages/center_page/center_pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: '22176385837-uiu1h6he4p9on54u02ae3c0q2pcc7bdj.apps.googleusercontent.com'
  );
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      // User canceled the sign-in
      return null;
    }
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFF0D47A1), // Dark Blue
      Color(0xFF000000), // Black (dominant)
      Color(0xFF000000), // Black continued
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.3, 1.0], // More black, less blue
  ),
),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Welcome to IntelliREC',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: screenWidth < 600 ? screenWidth * 0.9 : screenWidth * 0.45,
                  padding: const EdgeInsets.all(28),
                 decoration: BoxDecoration(
   gradient: LinearGradient(
    colors: [
      Colors.black.withOpacity(0.6),
      Color(0xFF0D47A1).withOpacity(0.3), // dark blue with transparency
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  borderRadius: BorderRadius.circular(25),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.8),
      blurRadius: 20,
      offset: Offset(0, 12),
    ),
  ],
),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.login, size: 45, color: Colors.white70),
                      const SizedBox(height: 12),
                      const Text(
                        'Sign in with email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Last-minute prep?\nIntelliREC guides you with the right questions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
  prefixIcon: const Icon(Icons.email, color: Color(0xFF00B4DB)), // cyan blue
  hintText: 'Email',
  hintStyle: const TextStyle(color: Color(0xFFB3E5FC)), // light cyan
  filled: true,
  fillColor: Color(0xFF1E1E2F), // slightly lighter than background
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  ),
),

),
                      const SizedBox(height: 15),
                      TextField(
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock, color: Color(0xFF00B4DB)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.white54,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                      
                          hintText: 'Password',
                         hintStyle: const TextStyle(color: Color(0xFFB3E5FC)), // light cyan
  filled: true,
  fillColor: Color(0xFF1E1E2F), // slightly lighter than background
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  ),
),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.white60, fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MainPage()),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Colors.white30, thickness: 1)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Or sign in with',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.white30, thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         InkWell(child:_buildIconButton(Icons.g_mobiledata, 'Google'),onTap:()async{
                         User? user = await signInWithGoogle();
                         print(user?.displayName.toString());
                         print(user.runtimeType);
                         if (user != null) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
                          =>MainPage(userName:user.displayName.toString(), profileUrl:user.photoURL.toString())
                          ));
                          // Navigate to the next screen or update the UI accordingly
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Failed")));
                        }
                         }),
                          // _buildIconButton(Icons.facebook, 'Facebook'),
                          _buildIconButton(Icons.apple, 'Apple'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
  // Set icon color and background based on label
  Color iconColor;
  BoxDecoration boxDecoration;

  switch (label.toLowerCase()) {
    case 'google':
      iconColor = Color(0xFFDB4437); // Google red
      boxDecoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      );
      break;
    case 'apple':
      iconColor = Colors.black; // Apple logo black
      boxDecoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      );
      break;
    // case 'github':
    //   iconColor = Colors.white; // GitHub white logo
    //   boxDecoration = BoxDecoration(
    //     color: Color(0xFF24292E), // GitHub dark background
    //     border: Border.all(color: Colors.white24),
    //     borderRadius: BorderRadius.circular(12),
    //   );
    //   break;
    default:
      iconColor = Color(0xFFB3E5FC); // fallback
      boxDecoration = BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(12),
      );
  }

  return Container(
    width: 50,
    height: 45,
    decoration: boxDecoration,
    child: Icon(icon, size: 26, color: iconColor),
  );
}

}
