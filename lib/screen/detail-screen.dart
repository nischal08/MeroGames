import 'package:flutter/material.dart';
import 'package:merogames/constants/constants.dart';

class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 80.0,
              left: 30.0,
              child: _backBtn(context),
            ),
            Positioned(
              top: 0.0,
              child: _bgImage(),
            ),
            Positioned(
              bottom: 0.0,
              left: 0,
              child: _gameInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backBtn(context) {
    return CircleAvatar(
      child: Icon(
        Icons.arrow_back,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  Widget _bgImage() {
    return Container(
      height: 300,
      child: Image.network(
        "https://msgpwebcdn.azureedge.net/ori/wp-content/uploads/2020/11/X04_XSX-1.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _gameInfo(context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      height: 540,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _gameTitleInfo(context),
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
                _gameImage(
                  image:
                      "https://msgpwebcdn.azureedge.net/ori/wp-content/uploads/2020/11/X04_XSX-1.png",
                  context: context,
                ),
            ],
          ),
        )
        ],
      ),
    );
  }


Widget _gameImage({image, context}) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 100,
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
  Widget _gameTitleInfo(context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      child: Row(
        children: [
          _gameCube(context),
          SizedBox(
            width: 10,
          ),
          _gameTitleDetailInfo(context),
        ],
      ),
    );
  }

  Widget _gameCube(context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withBlue(210),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/ori.png",
          color: Theme.of(context).scaffoldBackgroundColor,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _gameTitleDetailInfo(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ori and The Blind Forest',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: colorBlackFont,
                  fontSize: 23,
                ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Adventure",
                      style: TextStyle(
                        color: colorGreyFont,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        _rating(context),
                        SizedBox(
                          width: 50,
                        ),
                        _downloadCount(context),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _downloadCount(context) {
    return Row(
      children: [
        Icon(
          Icons.download_done_sharp,
          color: red,
          size: 16,
        ),
        Text('382 K')
      ],
    );
  }

  Widget _rating(context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: colorRating,
          size: 16,
        ),
        Text('4.8')
      ],
    );
  }
}
