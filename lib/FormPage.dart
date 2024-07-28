import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _placeNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _ownerContactController = TextEditingController();
  String _selectedCategory = 'Salon';
  final List<String> _categories = [ 'Salon', 'Cafes and Restaurants', 'Shopping Area','Amusement Parks','Nature Places','Sport Places','Museum'];
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  XFile? _image2;
  int _currentRating =  5;

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }
  Future<void> _pickImage2() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image2 = pickedImage;
    });
  }
  final _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        // color: Colors.white,
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
                      Icon(Icons.info_outline, color: Colors.black), 
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
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
              ),
              child: Column(
                children: [
                  SizedBox(height:10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Place Name:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                    
                  ),
                  SizedBox(
                    height:45,
                    child: TextField(
                      controller: _placeNameController,
                      decoration: InputDecoration(
                        hintText: 'Place Name:',
                        border: OutlineInputBorder(),
                      ),
                      
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Category:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                  ),
                  Container(
                    height: 50,
                    child: DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue!;
                        });
                      },
                      items: _categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Location:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                    
                  ),
                  SizedBox(
                    height:45,
                    child: TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        hintText: 'Set pin point:',
                        suffixIcon: Icon(Icons.location_pin),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Owner Contact:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                    
                  ),
                  SizedBox(
                    height:45,
                    child: TextField(
                      controller: _ownerContactController,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number:',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Add Place Photo:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                    
                  ),
                  Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Choose Image'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, // Text color
                        backgroundColor: Colors.grey[300], // Background color
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 48, // Matching the height of the ElevatedButton
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            _image?.name ?? 'No image chosen', // Display the name of the file
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Add Menu or Pricelist Photo:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                    
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _pickImage2,
                        child: Text('Choose Image'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, // Text color
                          backgroundColor: Colors.grey[300], // Background color
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 48, // Matching the height of the ElevatedButton
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              _image2?.name ?? 'No image chosen', // Display the name of the file
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Review:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                    
                  ),
                  SizedBox(
                    height:65,
                    child: TextField(
                      controller: _reviewController,
                      decoration: InputDecoration(
                        hintText: 'Share details of your experience here...:',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height:12),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Rating:",
                      style:TextStyle(
                        fontSize: 15,
                      )
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) { // Generate 5 stars
                      return IconButton(
                        icon: Icon(
                          index < _currentRating ? Icons.star : Icons.star_border, // Fill star if index is less than current rating
                          color: index < _currentRating ? Colors.yellow : Colors.grey, // Yellow if selected, grey otherwise
                        ),
                        onPressed: () {
                          setState(() {
                            _currentRating = index + 1; // Set rating to index of pressed star + 1
                          });
                        },
                        iconSize: 30, // Set the icon size for better visibility
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Submit form functionality here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form submitted successfully')),
                      );
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF36C073),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}