import 'package:flutter/material.dart';
import 'package:merogames/controller/home-controller.dart';
import 'package:merogames/screen/searchBarItems.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeController _homeStateController;
  @override
  Widget build(BuildContext context) {
    _homeStateController = Provider.of<HomeController>(context);
    return Scaffold(
      backgroundColor: Colors.indigoAccent.withOpacity(0.9),
      body: SafeArea(
        child: Column(
          children: [
            upperContainer(context),
            lowerContainer(context),
          ],
        ),
      ),
    );
  }

  Widget lowerContainer(context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          _category(context),
          _popularGame(context),
        ],
      ),
    );
  }

  _popularGame(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: Text(
            'Popular game',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // for (String image in _homeStateController.popularGame)
              for (var i = 0; i < 10; i++)
                _popularGameImage(
                  image:
                      "https://msgpwebcdn.azureedge.net/ori/wp-content/uploads/2020/11/X04_XSX-1.png",
                  context: context,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _popularGameImage({image, context}) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 80,
      width: 220,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
          child: Image.network(
        image,
        fit: BoxFit.cover,
      )),
    );
  }

  Container upperContainer(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            _playerInfo(context),
            SizedBox(
              height: 30,
            ),
            SearchBar(),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }

  Widget _category(context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ..._homeStateController.categoryItems.keys.map((String key) {
            return _categoryItem(
                context: context,
                label: key,
                icon: _homeStateController.categoryItems[key]);
          })
        ],
      ),
    );
  }

  Column _categoryItem({
    context,
    String label,
    IconData icon,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withBlue(210),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 60,
          width: 60,
          child: Icon(
            icon,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 40,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }

  Widget _playerInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _greeting(context),
        _playerPicture(context),
      ],
    );
  }

  Widget _greeting(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome,',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'What would you like to play?',
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Colors.white, fontSize: 14),
        )
      ],
    );
  }

  Widget _playerPicture(context) {
    return Container(
      child: Image.asset(
        'assets/user-picture.png',
        scale: 10,
      ),
    );
  }
}
