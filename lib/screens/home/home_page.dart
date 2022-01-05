import 'package:flutter/material.dart';
import 'package:travel_planning_app/constants/colors.dart';
import 'package:travel_planning_app/screens/detail/detail_page.dart';
import 'package:travel_planning_app/screens/home/widgets/bottom_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          MainContentHome(),
          Positioned(
            bottom: 20,
            child: Container(
              width: width,
              child: Align(
                child: BottomMenu(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainContentHome extends StatelessWidget {
  const MainContentHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            HeaderTitle(),
            InputWidget(),
            // Popular locations title and cities
            LocationPlaces(),
            TravelCards(),

            Container(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Traffic travel',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TransportColumn(
                        icon: Icons.airplanemode_active_sharp,
                        label: 'Plain',
                      ),
                      TransportColumn(
                        icon: Icons.train_rounded,
                        label: 'Train',
                      ),
                      TransportColumn(
                        icon: Icons.local_taxi,
                        label: 'Taxi',
                      ),
                      TransportColumn(
                        icon: Icons.pedal_bike,
                        label: 'Electric',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Discover \ninteresting places',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/imgs/profile.jpeg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: kFontLigth.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: kFontLigth,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Places',
                focusColor: kAccent,
                fillColor: kAccent,
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(
            Icons.settings,
            color: kFontLigth,
          ),
        ],
      ),
    );
  }
}

class LocationPlaces extends StatelessWidget {
  const LocationPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular locations',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PlacesMenuItem(
                  place: 'All',
                  active: true,
                ),
                PlacesMenuItem(place: 'Nature'),
                PlacesMenuItem(place: 'City attractions'),
                PlacesMenuItem(place: 'Ocean'),
                PlacesMenuItem(place: 'Forest'),
                PlacesMenuItem(place: 'Forest'),
                PlacesMenuItem(place: 'Forest'),
                PlacesMenuItem(place: 'Forest'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TravelCards extends StatelessWidget {
  const TravelCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TravelCard(image: 'img1'),
          TravelCard(image: 'img2'),
          TravelCard(image: 'img3'),
          TravelCard(image: 'img4'),
        ],
      ),
    );
  }
}

class TransportColumn extends StatelessWidget {
  const TransportColumn({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: kFontLigth.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: kPrimaryDark),
        ),
        Text(label,
            style: TextStyle(color: kPrimaryDark, fontWeight: FontWeight.w600))
      ],
    );
  }
}

class TravelCard extends StatelessWidget {
  const TravelCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    final VoidCallback navigateFunc = () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
    return GestureDetector(
      onTap: navigateFunc,
      child: SizedBox(
        width: 180,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.0,
              color: kFontLigth.withOpacity(0.3),
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/imgs/$image.jpeg',
                        width: 160, height: 160, fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kilimanjaro',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: kFontLigth,
                      ),
                      Text('Tanzania',
                          style: TextStyle(
                            color: kFontLigth,
                          )),
                    ],
                  )
                ],
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite_outline_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlacesMenuItem extends StatelessWidget {
  const PlacesMenuItem({
    Key? key,
    required this.place,
    this.active = false,
  }) : super(key: key);
  final String place;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 3.0, color: active ? kAccent : Colors.transparent),
          ),
        ),
        child: Text(
          place,
          style: TextStyle(color: active ? kFont : kFontLigth),
        ),
      ),
    );
  }
}
