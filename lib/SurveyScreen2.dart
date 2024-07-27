import 'package:flutter/material.dart';
import 'package:grabbie_fe/SurveyScreen3.dart';
class SurveyScreen2 extends StatefulWidget {
  const SurveyScreen2({super.key});

  @override
  State<SurveyScreen2> createState() => _SurveyScreen2State();
}

class _SurveyScreen2State extends State<SurveyScreen2> {
  final List<String> options = [
    "Busy and full of activities",
    "Quiet and peaceful",
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

                Container(
                  height: 85,
                  padding: EdgeInsets.only(left: 20,right:10),
                  color: Color(0xFF36C073), 
                  // Background color of the container
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
                    'Question 2 of 3',
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
                SizedBox(height: 10),
                
                ...options.map((option) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedOptions.contains(option)) {
                        selectedOptions.remove(option);
                      } else if (selectedOptions.length < 1) {
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
                Spacer(),
                ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SurveyScreen3()),
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
                SizedBox(height:10),

          
              ],
            ),
          ),
      );
  }
}
