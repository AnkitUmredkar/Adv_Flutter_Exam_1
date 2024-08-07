import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/countryProvider.dart';

class SavedCountriesPage extends StatelessWidget {
  const SavedCountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    CountryProvider countryProviderFalse =
        Provider.of<CountryProvider>(context, listen: false);
    CountryProvider countryProviderTrue =
        Provider.of<CountryProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text(
            'Saved Countries',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: (countryProviderTrue.favList.isEmpty)
            ? Center(
              child: Text('Liked Country Details Are Here',style: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: 'poppins')),
            )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: countryProviderTrue.favList.length,
            itemBuilder: (BuildContext context, int index) {
              final name = countryProviderTrue.favList[index]
                  .split('_')
                  .sublist(0, 1)
                  .join(' ');
              final region = countryProviderTrue.favList[index]
                  .split('_')
                  .sublist(1, 2)
                  .join(' ');
              final img = countryProviderTrue.favList[index]
                  .split('_')
                  .sublist(2, 3)
                  .join(' ');
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                    height: 82,
                    width: 76,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain, image: NetworkImage(img))),
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(region,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      )),
                  trailing: IconButton(
                      onPressed: () {
                        countryProviderFalse.removeFromLikePage(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.blue.shade800,
                      )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
