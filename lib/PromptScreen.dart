import 'package:flutter/material.dart';
import 'package:grabbie_fe/FormPage.dart';

class Place {
  final String name;
  final String category;
  final String rangePrice;
  final double rating;
  final String review;
  final String imageUrl;

  Place({
    required this.name,
    required this.category,
    required this.rangePrice,
    required this.rating,
    required this.review,
    required this.imageUrl,
  });
}

class PromptScreen extends StatefulWidget {
  final String searchQuery;

  const PromptScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _PromptScreenState createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  final List<Place> allPlaces = [
    Place(
      name: 'Filosofi Kopi',
      category: 'Cafe',
      rangePrice: 'Rp18.000 - Rp35.000',
      rating: 4.9,
      review: 'My favorite is butterscotch coffee. The wifi is quite fast. The fun seat is by the window, you can see the activity outside.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266885224349044808/image_6.png?ex=66a6c64f&is=66a574cf&hm=2b65210de71f4fe319e14746df46f543ac95d0aa02380267fae5f1de02791eee&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Suasana Kopi',
      category: 'Cafe',
      rangePrice: 'IDR 20.000 - 42.000',
      rating: 4.9,
      review: 'For coffee drinks, yesterday I tried the Aroma Dia Strong menu, it felt like it had a fragrance, different from other milk coffees.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266885224130674749/image_4_1.png?ex=66a6c64f&is=66a574cf&hm=a4dbd088cfad48bdaa967909991fdb680b246774fc17f59f5bf8456957b668ca&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Tuku',
      category: 'Cafe',
      rangePrice: 'IDR 15.000 - 34.000',
      rating: 4.7,
      review: 'I really like Kopi Susu tetangga, the taste is unique and has not changed from the past until now.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266885223887671441/image_2_1.png?ex=66a6c64e&is=66a574ce&hm=37e9e4ecb8166d75c529ec8074cb458a7ebae246272b51de9443a014804c0d65&', // Replace with actual image URL or asset
    ),
  ];

  List<Place> displayedPlaces = [];

  @override
  void initState() {
    super.initState();
    displayedPlaces = allPlaces;

  }
  void filterPlaces(String category) {
    setState(() {
      if (category == 'Explore') {
        displayedPlaces = allPlaces;
      } else {
        displayedPlaces = allPlaces.where((place) => place.category == category).toList();
      }
    });
  }

  void updateSearchResults(String query) {
    setState(() {
      displayedPlaces = allPlaces.where((place) {
        return place.name.toLowerCase().contains(query.toLowerCase()) ||
               place.category.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grabbie'),
        backgroundColor: Color(0xFF36C073),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              height: 95,
              padding: EdgeInsets.only(left: 20,right:10),
              color: Color(0xFF36C073), // Background color of the container
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Explore somewhere interesting and enjoy the vibes!',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FormPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFCAF1DC), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            ),
                            child: IntrinsicWidth(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(width: 5),
                                  Text("Add New Place"),
                                ],
                              ),
                            ),
                          ),
                        )
                        // InkWell(
                        //   onTap: (){
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => FormPage()),
                        //     );
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.centerLeft,
                        //     padding: EdgeInsets.only(left: 10,right:50, bottom: 5,top:5), // Adjust padding to fit your design needs
                        //     decoration: BoxDecoration(
                        //       color: Color(0xFFCAF1DC), // Use the hex color that matches your button background
                        //       borderRadius: BorderRadius.circular(30), // Adjust the border radius to get the desired roundness
                        //       border: Border.all(
                        //         color: Colors.white, // Set the border color
                        //         width: 2, // Set the border width
                        //       ),
                        //     ),
                        //     child:IntrinsicWidth(
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Icon(Icons.add),
                        //           SizedBox(width:5),
                        //           Text("Add New Place"),
                              
                        //         ],
                        //       ),
                        //     )
                        //   ),
                        // )
                      ],
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
                        height: 95,
                        fit: BoxFit.cover,
                      ),
                ]
              )
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: updateSearchResults,
                decoration: InputDecoration(
                  hintText: '${widget.searchQuery}',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none, // This hides the border for the default state
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey), // Grey color for the border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey), // Grey color for the border when focused
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),

              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: displayedPlaces.length,
                itemBuilder: (context, index) {
                  return _buildPlaceCard(displayedPlaces[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPlaceCard(Place place) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Color(0xFFECFFE5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                place.imageUrl,
                width: 150,
                height: 175,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Category: ${place.category}'),
                      Text('Range price: ${place.rangePrice}'),
                      Row(
                        children: [
                          const Text('Rating: '),
                          Text(
                            place.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ],
                      ),
                      Text('Review: ${place.review}'),
                    ],
                  ),
                  Row(
                    children: [
                      Image.network(
                       "https://cdn.discordapp.com/attachments/1264936584277528600/1266882686526554213/image_7.png?ex=66a6c3f2&is=66a57272&hm=d1641797ee3e4f9f88a28b47bc0cb5566a9909db1b0e0acb0f3dfad6e3856fc5&",
                        width: 50,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Light green background color
                              borderRadius: BorderRadius.circular(40), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(0, 3), // Shadow position
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            margin: EdgeInsets.only(bottom: 8), // Add space between the containers
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to the space between
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                                  children: [
                                    Text(
                                      "Start from",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Rp 12.000",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.network(
                                  "https://cdn.discordapp.com/attachments/1264936584277528600/1266691625615364126/Image_4.png?ex=66a61201&is=66a4c081&hm=69b6e32804b129cccda309543050a0199efc377d3f696f90e423c07c9f10c91f&",
                                  width: 40,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFECFFE5), // Light green background color
                              borderRadius: BorderRadius.circular(40), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(0, 3), // Shadow position
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to the space between
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                                  children: [
                                    Text(
                                      "Start from",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Rp 20.000",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.network(
                                  "https://cdn.discordapp.com/attachments/1264936584277528600/1266691417590333440/Image_3.png?ex=66a611cf&is=66a4c04f&hm=fdef8354570970f871b11e46a5065a8f7374497fcf1e3b7f5853065c5fc3ce1f&",
                                  width: 40,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ]
                      ),
                    ],
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [

                  //     Image.network(
                  //      "https://cdn.discordapp.com/attachments/1264936584277528600/1266691625615364126/Image_4.png?ex=66a61201&is=66a4c081&hm=69b6e32804b129cccda309543050a0199efc377d3f696f90e423c07c9f10c91f&",
                  //       width: 45,
                  //       height:45,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     const SizedBox(width: 8),
                  //     Text("or"),
                  //     const SizedBox(width: 8),
                  //     Image.network(
                  //      "https://cdn.discordapp.com/attachments/1264936584277528600/1266691417590333440/Image_3.png?ex=66a611cf&is=66a4c04f&hm=fdef8354570970f871b11e46a5065a8f7374497fcf1e3b7f5853065c5fc3ce1f&",
                  //       width: 45,
                  //       height: 45,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }

  Widget _buildTransportIcon(String icon) {
    return CircleAvatar(
      backgroundColor: Colors.green,
      child: Image.asset(
        '../assets/images/${icon}.png',  // Adjust the asset path as necessary
        width: 125, // Set an appropriate width for your image
        height:75,
      ),
    );
  }
}
