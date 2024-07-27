import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
              padding: EdgeInsets.all(16), // Add padding around the text
              decoration: BoxDecoration(
                color: Color(0xFFECFFE5), // Background color as green
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2), // Bottom border
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.black), /
                      SizedBox(width: 10), // Space between icon and text
                      Expanded(
                        child: Text(
                          'About Grab Pioneers',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16, // Font size
                            fontWeight: FontWeight.bold,
                  
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("Grab Pioneers is a global community of explorers who can add new places and provide reviews of those places on the Grab platform.",
                   style: TextStyle(
                            color: Colors.grey[600], 
                            fontSize: 14,
                  
                          ),
                  )
                ],
              ),
            )

          ],
        ),
        ),
      );
  }
}