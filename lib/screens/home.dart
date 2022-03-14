import 'package:flutter/material.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_event.dart';
import 'package:flutter_assesment/utils/common_appbar.dart';
import 'package:flutter_assesment/widgets/home_left_icon_widget.dart';
import 'package:flutter_assesment/widgets/home_right_icon_widget.dart';
import 'package:flutter_assesment/widgets/page_indicator.dart';

class HomeBannersContainer {
  final List<Image> _images = const [
    Image(
      image: AssetImage('assets/images/offers.jpg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('assets/images/offers.jpg'),
      fit: BoxFit.fill,
    ),
  ];

  int getCount() {
    return _images.length;
  }

  List<Image> getBanners() {
    return _images;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CommonAppBar {
  int currentPageValue = 0;
  final _container = HomeBannersContainer();

  void onCartTap() {
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(onTap: onCartTap),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            height: 140,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: _container.getBanners(),
                  onPageChanged: (value) {
                    setState(() {
                      currentPageValue = value;
                    });
                  },
                ),
                PageIndicator(
                  count: _container.getCount(),
                  currentPage: currentPageValue,
                )
              ],
            ),
          ),
          HomeLeftIconWidget(
            title: "Fruits & Vegetables",
            description: 'A variety of fresh Fruits and Vegetables',
            buttonLabel: 'Explore fruit-and-veg',
            onTap: () {
              Navigator.pushNamed(context, '/pl',
                  arguments: ProductType.fruits);
            },
          ),
          HomeRightIconWidget(
            title: "Bakery Cakes and Dairy",
            description:
                'The best cupcakes, cookies, cakes, pies, cheesecakes, fresh breads, biscotti, muffins, bagels, fresh coffee and milk',
            buttonLabel: 'Explore bakery-cakes-dairy',
            onTap: () {
              Navigator.pushNamed(context, '/pl',
                  arguments: ProductType.bakery);
            },
          ),
          HomeLeftIconWidget(
            title: "Beverages",
            description:
                'Our beverage department will ensure your fridge is always fully stocked, Shop for soda, juice, beer and more',
            buttonLabel: 'Explore beverages',
            onTap: () {},
          ),
          HomeRightIconWidget(
            title: "Bakery Cakes and Dairy",
            description:
                'The best cupcakes, cookies, cakes, pies, cheesecakes, fresh breads, biscotti, muffins, bagels, fresh coffee and milk',
            buttonLabel: 'Explore bakery-cakes-dairy',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
