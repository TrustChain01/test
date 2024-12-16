import 'package:flutter/material.dart';
import 'package:trustchain/constants/colors.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  String? _selected;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: carribeanblue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.2),
            Text(
              "Select the user",
              style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: selectionBlock(
                        Image.asset(
                          'assets/images/student.png',
                        ),
                        "Student"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: selectionBlock(
                        Image.asset('assets/images/employer.png'), "Employer"),
                  ),
                ),
              ],
            ),
             SizedBox(height: screenHeight * 0.2),
            Hero(
              
              tag: "tag1",
              
              child: ElevatedButton( 
                onPressed: () {
                  _selected==null?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select a user to proceed",)),
                  snackBarAnimationStyle: AnimationStyle(reverseCurve: FlippedCurve(Curves.bounceInOut))):null;
              
              
              
                }, child: Text("Proceed",style: TextStyle(color: Colors.black,fontSize:screenWidth * 0.05 ),),
              style: ElevatedButton.styleFrom(elevation: 0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide.none,)),),
            )
          ],
        ),
      ),
    );
  }

  Widget selectionBlock(Image img, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = text;
        });
      },
      child: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            img,
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _selected==text?Colors.yellowAccent:Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }
}
