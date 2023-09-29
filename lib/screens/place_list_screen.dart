import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mapapp/providers/great_places.dart';
import 'package:mapapp/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => AddPlaceScreen(),
                    ));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fectchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(child: Text('null')),
                builder: (ctx, greatplaces, ch) => greatplaces.items.length <= 0
                    ? ch!
                    : ListView.builder(
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatplaces.items[i].image),
                          ),
                          title: Text(greatplaces.items[i].title),
                          onTap: () {
                            //go to detail page..
                          },
                        ),
                        itemCount: greatplaces.items.length,
                      ),
              ),
      )),
    );
  }
}
