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
    "Sport place",
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
        child: Column(
          children: [
            SingleChildScrollView(  // Wrap the Column with SingleChildScrollView
                
                child: Column(
                  children: [
                    Container(
                      height: 85,
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
                                fontSize: 17.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // Image.asset(
                          //   '../assets/images/logo2.png',  // Adjust the asset path as necessary
                          //   width: 125, // Set an appropriate width for your image
                          //   height:75,
                          // ),
                          Image.network(
                           "https://cdn.discordapp.com/attachments/1264936584277528600/1266683792928800878/logo2.png?ex=66a60ab6&is=66a4b936&hm=f014bc60f05f2a464b1346476f40e0742f475b17ab5038d12c8292850a5948b9&",
                            width: 65,
                            height: 85,
                            fit: BoxFit.cover,
                          ),
                        ]
                      )
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left:20),
                      child: Text(
                        'Question 1 of 3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey[600]
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'What type of places do you most enjoy visiting?',
                      style: TextStyle(
                        fontSize: 17,
            
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Choose your top 3!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
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
                        width:300,
                        height:55,
                        decoration: BoxDecoration(
                          color: selectedOptions.contains(option)
                              ? Color(0xFFECFFE5)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          
                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurveyScreen2()),
                  );
                },
                child: Icon(Icons.arrow_right_alt_rounded, color: Colors.white,size:35),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(5),
                  backgroundColor: Colors.grey, // <-- Button color
                  foregroundColor: Colors.black, // <-- Splash color
                  fixedSize: Size(50,50)
                ),
              ),
          ],
        ),
        ),
      );
  }
}
