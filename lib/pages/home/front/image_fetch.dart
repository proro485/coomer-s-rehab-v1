import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';

class ImageFetch extends StatefulWidget {
  const ImageFetch({Key? key}) : super(key: key);

  @override
  State<ImageFetch> createState() => _ImageFetchState();
}

class _ImageFetchState extends State<ImageFetch> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: imageOfTheDayStream,
      builder: (context, snapshot) {
        final tilesList = <Widget>[];
        if (snapshot.hasData) {
          final images = Map<String, dynamic>.from((snapshot.data! as Event).snapshot.value);
          images.forEach((key, value) {
            final imgTile = Container(
              width: MediaQuery.of(context).size.width - 20,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: color3,
                border: Border.all(color: color7, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(value, width: MediaQuery.of(context).size.width - 50,),
            );
            tilesList.add(imgTile);
            tilesList.add(const SizedBox(
              height: 20.0,
            ));
          });
        } else {
          return Container(
            height: MediaQuery.of(context).size.height/4 + 40,
            width: MediaQuery.of(context).size.width/2,
            color: color2,
            child: const SpinKitPouringHourGlassRefined(
              size: 50,
              color: color7,
            ),
          );
        }
        return Column(
          children: tilesList,
        );
      },
    );
  }
}