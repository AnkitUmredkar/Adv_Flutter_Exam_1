import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/countryModel.dart';
import '../../Provider/countryProvider.dart';

class DetailsPage extends StatelessWidget {
  List<CountryModel>? dataList = [];

  DetailsPage({super.key, required this.dataList});

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
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.favorite,
          //         color: Colors.white,
          //       ))
          // ],
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(dataList![selectedIndex].flags.png),
                  )),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Official Name',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 220,
                              child: Text(dataList![selectedIndex].name.official,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey.shade600,
                                  )),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              countryProviderFalse.addToFavorites(
                                  selectedIndex, dataList!);
                            },
                            icon: const Icon(
                              Icons.bookmark,
                              color: Colors.blue,
                              size: 25,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Common Name',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            Text(dataList![selectedIndex].name.common,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade600,
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Area',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            Text(
                              dataList![selectedIndex].area.toString(),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Region',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            Text(dataList![selectedIndex].region,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade600,
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Population',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            Text(dataList![selectedIndex].population.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade600,
                                )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    const Text(
                      'SubRegion',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    Text(dataList![selectedIndex].subregion,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade600,
                        )),
                    const SizedBox(
                      height: 8.5,
                    ),
                    const Text(
                      'Capital',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    Text(
                      dataList![selectedIndex].capital.join(' ,'),
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

int length = 0;
String title = '';
int selectedIndex = 0;
