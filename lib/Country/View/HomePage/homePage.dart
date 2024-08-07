import 'package:adv_flutter_exam_1/Country/View/SavedCountries/savedCountriesPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/countryModel.dart';
import '../../Provider/countryProvider.dart';
import '../DetailsPage/detailsPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CountryProvider countryProviderFalse = Provider.of<CountryProvider>(context, listen: false);
    CountryProvider countryProviderTrue = Provider.of<CountryProvider>(context, listen: true);
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SavedCountriesPage(),));
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ))
          ],
          title: const Text(
            'Country Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder(
          future: Provider.of<CountryProvider>(context, listen: false).fromList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CountryModel>? dataList = snapshot.data;
              return SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 10),
                  ...List.generate(
                    dataList!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          title = dataList[index].name.common;
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              dataList: dataList,
                            ),
                          ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Container(
                              height: 82,
                              width: 76,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          dataList[index].flags.png))),
                            ),
                            title: Text(
                              dataList[index].name.common,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(dataList[index].region,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.blue,));
            }
          },
        ),
      ),
    );
  }
}
//backgroundColor: Colors.blue.shade50,
// appBar : Colors.blue.shade800,
// cardColor : Colors.white70,
