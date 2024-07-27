import 'package:flutter/material.dart';
import 'package:grabbie_fe/FormPage.dart';

class Place {
  final String name;
  final String category;
  final String distance;
  final double rating;
  final String review;
  final String imageUrl;

  Place({
    required this.name,
    required this.category,
    required this.distance,
    required this.rating,
    required this.review,
    required this.imageUrl,
  });
}

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final List<Place> allPlaces = [
    Place(
      name: 'Blok M Plaza',
      category: 'Shopping Area',
      distance: '~1km',
      rating: 4.7,
      review: 'One of the shopping centers in South Jakarta. There is an entrance from the MRT station.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266673984531992576/blokm.png?ex=66a60193&is=66a4b013&hm=4d01a1a601617031a2877bfa566fd2f9bc0d314b06802a575a81b8875232794f&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Blok M Plaza',
      category: 'Shopping Area',
      distance: '~1km',
      rating: 4.7,
      review: 'One of the shopping centers in South Jakarta. There is an entrance from the MRT station.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266673984531992576/blokm.png?ex=66a60193&is=66a4b013&hm=4d01a1a601617031a2877bfa566fd2f9bc0d314b06802a575a81b8875232794f&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Marta Tiahahu Literacy Park',
      category: 'Nature Places',
      distance: '~1.2km',
      rating: 4.7,
      review: 'Cool place to hangout, eat lots of snacks, relax while reading a book. Sometimes there are music shows too.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266673984796098622/marta.png?ex=66a60193&is=66a4b013&hm=df66617d1b2cd5cb74d772120151cad599d087ad3ca1927c28af3e989bc4628e&', // Replace with actual image URL or asset
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
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FormPage()),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10,right:50, bottom: 5,top:5), // Adjust padding to fit your design needs
                            decoration: BoxDecoration(
                              color: Color(0xFFCAF1DC), // Use the hex color that matches your button background
                              borderRadius: BorderRadius.circular(30), // Adjust the border radius to get the desired roundness
                              border: Border.all(
                                color: Colors.white, // Set the border color
                                width: 2, // Set the border width
                              ),
                            ),
                            child:IntrinsicWidth(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(width:5),
                                  Text("Add New Place"),
                              
                                ],
                              ),
                            )
                          ),
                        )
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
                  hintText: 'Where you wanna go?',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Ensure there's a background color to see the effect
                    borderRadius: BorderRadius.circular(40),// Rounded corners
                    boxShadow: [ // Optional: adds shadow for better visibility of the container's edges
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                ),
                child: categorySection()
              )
            ),
            SizedBox(height:10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nearest You',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 7),
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
  Widget categorySection() {
    return SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      child: Row(

        children: [
          categoryCard(Icons.explore, "Explore", 'Explore'),
          categoryCard(Icons.content_cut, "Salon", 'Salon'),
          categoryCard(Icons.restaurant, "Cafes and Restaurants", 'Cafes and Restaurants'),
          categoryCard(Icons.shopping_cart, "Shopping Area", 'Shopping Area'),
          categoryCard(Icons.local_play, "Amusement Parks", 'Amusement Parks'),
          categoryCard(Icons.nature_people, "Nature Places", 'Nature Places'),
          categoryCard(Icons.sports_soccer, "Sport Places", 'Sport Places'),
          categoryCard(Icons.museum, "Museum", 'Museum'),
        ],
      ),
    );
  }
  Widget categoryCard(IconData icon, String label, String filter) {
    return InkWell(
      onTap: () => filterPlaces(filter),
      child: Container(
        height: 60,
        width: 80,
        decoration: BoxDecoration(
          color: Color(0xFFECFFE5),
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.grey[700]),
            Center(child: Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 12),textAlign: TextAlign.center,)),
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
                      Text('Estimation distance: ${place.distance}'),
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
