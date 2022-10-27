import 'package:flutter/material.dart';

class SlidingCard extends StatelessWidget {
  final String name;
  final String assetName;

  const SlidingCard({
    Key? key,
    required this.name,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(assetName),
            fit: BoxFit.none,
          )),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
