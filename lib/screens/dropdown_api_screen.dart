import 'package:crona_virus/model/dropdown_model.dart';
import 'package:flutter/material.dart';
import '../services/states_services.dart';

class DropdownApiScreen extends StatefulWidget {
  const DropdownApiScreen({super.key});

  @override
  State<DropdownApiScreen> createState() => _DropdownApiScreenState();
}

class _DropdownApiScreenState extends State<DropdownApiScreen> {
  var selectedValue;

  @override
  Widget build(BuildContext context) {
    StatesService statesService = StatesService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown api data '),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<DropdownModel>>(
                future: statesService.getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton(
                      isExpanded: true,
                        value: selectedValue,
                        icon: const Icon(Icons.add_circle_outline),
                        hint: const Text('Selected Value'),
                        items: snapshot.data!.map((e) {
                          return DropdownMenuItem(
                              value: e.title.toString(),
                              child: Text(e.title.toString()));
                        }).toList(),
                        onChanged: (value) {
                          selectedValue = value;
                          setState(() {});
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
