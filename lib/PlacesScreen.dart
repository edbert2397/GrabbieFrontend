import 'package:flutter/material.dart';

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
      category: 'Shopping area',
      distance: '~1km',
      rating: 4.7,
      review: 'One of the shopping centers in South Jakarta. There is an entrance from the MRT station.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266673984531992576/blokm.png?ex=66a60193&is=66a4b013&hm=4d01a1a601617031a2877bfa566fd2f9bc0d314b06802a575a81b8875232794f&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Blok M Plaza',
      category: 'Shopping area',
      distance: '~1km',
      rating: 4.7,
      review: 'One of the shopping centers in South Jakarta. There is an entrance from the MRT station.',
      imageUrl: 'https://cdn.discordapp.com/attachments/1264936584277528600/1266673984531992576/blokm.png?ex=66a60193&is=66a4b013&hm=4d01a1a601617031a2877bfa566fd2f9bc0d314b06802a575a81b8875232794f&', // Replace with actual image URL or asset
    ),
    Place(
      name: 'Marta Tiahahu Literacy Park',
      category: 'Park',
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
    displayedPlaces = List.from(allPlaces);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildTransportIcon("motor"),
                      const SizedBox(width: 8),
                      Text("or"),
                      const SizedBox(width: 8),
                      _buildTransportIcon("mobil"),
                    ],
                  ),
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
