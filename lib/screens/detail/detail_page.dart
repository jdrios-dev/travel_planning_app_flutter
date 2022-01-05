import 'package:flutter/material.dart';
import 'package:travel_planning_app/constants/colors.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FullHeader(width: width),
            PriceTitleDetail(),
            ItinerayDetail(),
            BookNowButton(),
          ],
        ),
      ),
    );
  }
}

class BookNowButton extends StatelessWidget {
  const BookNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 250,
      height: 70,
      decoration: BoxDecoration(
        color: kPrimaryDark,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Book Now',
            style: TextStyle(
              color: kWhite,
              letterSpacing: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 15),
          Icon(Icons.arrow_right_alt_outlined, color: kWhite)
        ],
      ),
    );
  }
}

class FullHeader extends StatelessWidget {
  const FullHeader({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              'assets/imgs/img2.jpeg',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          HeaderActions(),
          HeaderImagesScroll(width: width),
        ],
      ),
    );
  }
}

class PriceTitleDetail extends StatelessWidget {
  const PriceTitleDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle styleTitle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
    final TextStyle styleSubTitle = TextStyle(
      fontSize: 16,
      color: kFont.withOpacity(0.5),
    );
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: kFontLigth.withOpacity(0.3),
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.only(bottom: 15, top: 35),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Kilimanjaro',
                style: styleTitle,
              ),
              Text(
                '\$ 99',
                style: styleTitle,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'National Park',
                style: styleSubTitle,
              ),
              Text(
                'Tickets',
                style: styleSubTitle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItinerayDetail extends StatelessWidget {
  const ItinerayDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle styleTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
    final TextStyle styleSubTitle = TextStyle(
      fontSize: 16,
      color: kFont,
    );
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.only(bottom: 15, top: 35),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icons.location_on_outlined,
                    color: kFontLigth,
                  ),
                  Text(
                    'Tanzania',
                    style: styleTitle,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icons.location_on_outlined,
                    color: kFontLigth,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Period',
                        style: styleTitle.copyWith(
                          color: kFontLigth,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '08:00 AM',
                        style: styleTitle,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Lifting Stroke',
                style: styleSubTitle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderImagesScroll extends StatelessWidget {
  const HeaderImagesScroll({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
          width: width,
          decoration: BoxDecoration(
              color: kFontLigth.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/imgs/img1.jpeg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/imgs/img2.jpeg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/imgs/img3.jpeg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/imgs/img4.jpeg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/imgs/img6.jpeg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          )),
    );
  }
}

class HeaderActions extends StatelessWidget {
  const HeaderActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const IconButton(
              icon: Icons.arrow_back_rounded,
              color: kWhite,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icons.favorite_outline_rounded,
                color: kWhite,
              ),
              IconButton(
                icon: Icons.bookmark_outline_rounded,
                color: kWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }
}
