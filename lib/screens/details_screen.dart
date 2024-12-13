import 'package:crona_virus/screens/world_states.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailsScreen(
      {super.key,
      required this.name,
      required this.active,
      required this.critical,
      required this.image,
      required this.todayRecovered,
      required this.totalCases,
      required this.totalRecovered,
      required this.totalDeaths,
      required this.test});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .06),
                      ReusableRow(
                          title: 'Cases', value: widget.totalCases.toString()),
                      ReusableRow(
                          title: 'Active', value: widget.active.toString()),
                      ReusableRow(title: 'Test', value: widget.test.toString()),
                      ReusableRow(
                          title: 'Critical', value: widget.critical.toString()),
                      ReusableRow(
                          title: 'Total Deaths',
                          value: widget.totalDeaths.toString()),
                      ReusableRow(
                          title: 'Today recovered',
                          value: widget.todayRecovered.toString()),
                      ReusableRow(
                          title: 'Total Recovered',
                          value: widget.totalRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          ),
        ],
      ),
    );
  }
}
