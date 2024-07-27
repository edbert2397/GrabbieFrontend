import 'package:flutter/material.dart';
import 'package:grabbie_fe/Navbar.dart';
import 'package:grabbie_fe/SurveyScreen2.dart';
class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final List<String> options = [
    "Museums and art galleries",
    "Restaurants and cafes",
    "Shopping areas",
    "Historical sites",
    "Amusement parks",
    "Nature place",
    "Sport place"
  ];
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Grabbie', style: TextStyle(color: Colors.black)),  // Ensure the title text color is white
        backgroundColor: (Color(0xFF36C073)),  // Green background as in the screenshot
        elevation: 0,  // No shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),  // White back arrow icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          
          child: SingleChildScrollView(  // Wrap the Column with SingleChildScrollView
            
            child: Column(
              children: [
                Container(
                  height: 75,
                  padding: EdgeInsets.only(left: 20,right:10),
                  color: Color(0xFF36C073), // Background color of the container
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Explore somewhere interesting and enjoy the vibes!',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Image.asset(
                        '../assets/images/logo2.png',  // Adjust the asset path as necessary
                        width: 125, // Set an appropriate width for your image
                        height:75,
                      ),
                    ]
                  )
                ),
                Text(
                  'Question 1 of 3',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'What type of places do you most enjoy visiting?',
                  style: TextStyle(
                    fontSize: 12,

                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Choose your top 3!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ...options.map((option) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedOptions.contains(option)) {
                        selectedOptions.remove(option);
                      } else if (selectedOptions.length < 3) {
                        selectedOptions.add(option);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selectedOptions.contains(option)
                          ? Colors.lightGreenAccent
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                )),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SurveyScreen2()),
                    );
                  },
                  child: Icon(Icons.arrow_right_alt_rounded, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    backgroundColor: Colors.grey, // <-- Button color
                    foregroundColor: Colors.black, // <-- Splash color
                  ),
                )

          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
