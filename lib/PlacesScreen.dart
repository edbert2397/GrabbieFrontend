import 'package:flutter/material.dart';
import 'package:grabbie_fe/FormPage.dart';
import 'package:grabbie_fe/PromptScreen.dart';

class Place {
  final String name;
  final String category;
  final double rating;
  final String starting_price;
  final String review;
  final String imageUrl;

  Place({
    required this.name,
    required this.category,
    required this.rating,
    required this.starting_price,
    required this.review,
    required this.imageUrl,
  });
}

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

// M Bloc Space
// Category: Shopping area
// Rating: 4.6/5
// Review: The location is very strategic to reach public transportation. The place is nice and very interesting.

class _PlacesScreenState extends State<PlacesScreen> {
  final List<Place> allPlaces = [
    Place(
      name: 'Blok M Plaza',
      category: 'Shopping Area',
      starting_price: "Rp10.000",
      rating: 4.7,
      review: 'One of the shopping centers in South Jakarta. There is an entrance from the MRT station.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266673984531992576/blokm.png?ex=66a60193&is=66a4b013&hm=4d01a1a601617031a2877bfa566fd2f9bc0d314b06802a575a81b8875232794f&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'M Bloc Space',
      category: 'Shopping Area',
      starting_price: "Rp30.000",
      rating: 4.6,
      review: 'The location is very strategic to reach public transportation. The place is nice and very interesting.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266916041301426268/image_5.png?ex=66a6e302&is=66a59182&hm=36ee63cc3301713378c95738fb7465ed8a686c463f4f92959c7d72f804caa47d&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Marta Tiahahu Literacy Park',
      category: 'Nature Places',
      starting_price: "-",
      rating: 4.7,
      review: 'Cool place to hangout, eat lots of snacks, relax while reading a book. Sometimes there are music shows too.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266673984796098622/marta.png?ex=66a60193&is=66a4b013&hm=df66617d1b2cd5cb74d772120151cad599d087ad3ca1927c28af3e989bc4628e&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Lucky Cat Salon',
      category: 'Salon',
      starting_price: "Rp50.000",
      rating: 4.5,
      review: 'Cool place to hangout, eat lots of snacks, relax while reading a book. Sometimes there are music shows too.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266938223515406336/image_4.png?ex=66a6f7ab&is=66a5a62b&hm=d2ebfd043d213b221279df913c272b1c1e5caf175cb976473665a8295b27033b&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Filosofi Kopi',
      category: 'Cafes and Restaurants',
      starting_price: "Rp18.000",
      rating: 4.5,
      review: 'Favorite coffee is butterscotch coffee. The wifi is quite fast. The fun seat is by the window, you can see the activity outside.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266885224349044808/image_6.png?ex=66a6c64f&is=66a574cf&hm=2b65210de71f4fe319e14746df46f543ac95d0aa02380267fae5f1de02791eee&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Futago Ya',
      category: 'Cafes and Restaurants',
      starting_price: "Rp40.000",
      rating: 4.5,
      review: 'Japanese Vibes, Good Service, Creamy Udon, Affordable Price.',
      imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOfCkiplNcMXDFNHM8vSxnSC32w5pedBYALYGLg=s680-w680-h510',
    ),
    Place(
      name: 'HAKA Dimsum Blok M',
      category: 'Cafes and Restaurants',
      starting_price: "Rp30.000",
      rating: 4.4,
      review: 'The place is nice, a lot of seating, have a very old chinatown vibe, a bit loud. The food is great, love all the dimsum',
      imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOZqDLcybobONoDTH9-MlFKvPwKHxJlSShCcCT2=s680-w680-h510', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Kedai Tjikini - M Bloc Space',
      category: 'Cafes and Restaurants',
      starting_price: "Rp30.000",
      rating: 4.3,
      review:  "Place is nice and comfortable with the ambience of grandma's home..",
      imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipM8ckPBqnpvHcvJS5k7QmKe8_SIlomnoEQMjUyq=s680-w680-h510', // Replace with actual image URL or asset
    ),
  ];

  List<Place> displayedPlaces = [];

  List<bool> isTappedList = List<bool>.filled(8, false); 

  @override
  void initState() {
    super.initState();
    displayedPlaces = allPlaces;
    isTappedList[0] = true;

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
  final TextEditingController _searchController = TextEditingController();

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
              color: Color(0xFF36C073), 
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
                        // SizedBox(height:5),
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
                        // Container(
                        //   alignment: Alignment.centerLeft,
                        //   child: InkWell(
                            
                        //     onTap: (){
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) => FormPage()),
                        //       );
                        //     },
                        //     child: Container(
                        //       width: 186,
                        //       padding: EdgeInsets.only(left: 10,right:50, bottom: 5,top:5), 
                        //       decoration: BoxDecoration(
                        //         color: Color(0xFFCAF1DC), 
                        //         borderRadius: BorderRadius.circular(30),
                        //         border: Border.all(
                        //           color: Colors.white,
                        //           width: 0, 
                        //         ),
                        //       ),
                        //       child:IntrinsicWidth(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           children: [
                        //             Icon(Icons.add),
                        //             SizedBox(width:5),
                        //             Text("Add New Place"),
                        //           ],
                        //         ),
                        //       )
                        //     ),
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
                controller: _searchController,
                onSubmitted: (value) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PromptScreen(searchQuery: value),
                    ),
                  );
                  _searchController.clear();
                },
                
                decoration: InputDecoration(
                  hintText: 'Where you wanna go?',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none, 
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
                  color: Color(0xFFECFFE5), // Ensure there's a background color to see the effect
                    borderRadius: BorderRadius.circular(10),// Rounded corners
                    // boxShadow: [ // Optional: adds shadow for better visibility of the container's edges
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 1,
                    //     blurRadius: 6,
                    //     offset: Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
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
          categoryCard(Icons.explore, "Explore", 'Explore',0),
          categoryCard(Icons.content_cut, "Salon", 'Salon',1),
          categoryCard(Icons.restaurant, "Cafes and Restaurants", 'Cafes and Restaurants',2),
          categoryCard(Icons.shopping_cart, "Shopping Area", 'Shopping Area',3),
          categoryCard(Icons.local_play, "Amusement Parks", 'Amusement Parks',4),
          categoryCard(Icons.nature_people, "Nature Places", 'Nature Places',5),
        ],
      ),
    );
  }
  Widget categoryCard(IconData icon, String label, String filter,int index) {
    return InkWell(
      // onTap: () => filterPlaces(filter),
      onTap:(){
        setState(() {
          for (int i = 0; i < isTappedList.length; i++) {
            isTappedList[i] = false;
          }
          isTappedList[index] = true;
        });
        filterPlaces(filter);
      },
      child: Container(
        height: 70,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.transparent,
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: isTappedList[index] ? Colors.green[700] : Colors.grey[700]),
            Center(child: Text(label, style: TextStyle(color: isTappedList[index] ? Colors.green[700] : Colors.grey[700], fontSize: 12,fontWeight: isTappedList[index] ? FontWeight.bold : FontWeight.normal),textAlign: TextAlign.center,)),
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
                      Text('Starting price: ${place.starting_price}'),
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
