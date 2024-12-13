import 'package:crona_virus/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../services/states_services.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesService statesService = StatesService();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Country list data"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'Search with country name',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: statesService.countryListApi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: ListTile(
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 10,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]['country'];
                              if (searchController.text.isEmpty) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  name: snapshot.data![index]
                                                      ['country'],
                                                  active: snapshot.data![index]
                                                      ['active'],
                                                  critical: snapshot
                                                      .data![index]['critical'],
                                                  image: snapshot.data![index]
                                                      ['countryInfo']['flag'],
                                                  todayRecovered:
                                                      snapshot.data![index]
                                                          ['recovered'],
                                                  totalCases:
                                                      snapshot.data![index]
                                                          ['todayCases'],
                                                  totalDeaths:
                                                      snapshot.data![index]
                                                          ['todayDeaths'],
                                                  test: snapshot.data![index]
                                                      ['tests'],
                                                  totalRecovered:
                                                      snapshot.data![index]
                                                          ['todayCases'],
                                                )));
                                  },
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                  ),
                                );
                              } else if (name.toLowerCase().contains(
                                  searchController.text.toLowerCase())) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  name: snapshot.data![index]
                                                      ['country'],
                                                  active: snapshot.data![index]
                                                      ['active'],
                                                  critical: snapshot
                                                      .data![index]['critical'],
                                                  image: snapshot.data![index]
                                                      ['countryInfo']['flag'],
                                                  todayRecovered:
                                                      snapshot.data![index]
                                                          ['recovered'],
                                                  totalCases:
                                                      snapshot.data![index]
                                                          ['todayCases'],
                                                  totalDeaths:
                                                      snapshot.data![index]
                                                          ['todayDeaths'],
                                                  test: snapshot.data![index]
                                                      ['tests'],
                                                  totalRecovered:
                                                      snapshot.data![index]
                                                          ['todayRecovered'],
                                                )));
                                  },
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
