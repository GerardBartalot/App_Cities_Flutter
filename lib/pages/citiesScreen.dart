import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_cities_flutter/pages/cityDetailsScreen.dart';
import 'package:app_cities_flutter/pages/shoppingScreen.dart';
import 'package:flutter/material.dart';

class CitiesScreen extends StatefulWidget {
  final String username;

  const CitiesScreen({super.key, required this.username});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    final String helloText = texts.hello(widget.username);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: Text(
                  helloText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orangeAccent,
          labelColor: Colors.black,
          unselectedLabelColor: const Color.fromARGB(255, 51, 50, 50),
          tabs: [Tab(text: texts.cities), Tab(text: texts.products)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildCitiesList(context), const ShoppingScreen()],
      ),
    );
  }

  Widget _buildCitiesList(BuildContext context) {
    final texts = AppLocalizations.of(context)!;

    final List<Map<String, String>> cities = [
      {
        'name': texts.city_delhi,
        'country': texts.country_india,
        'population': '19 mil',
        'image': 'assets/delhi.jpg',
        'description': texts.description_delhi,
      },
      {
        'name': texts.city_london,
        'country': texts.country_britain,
        'population': '8 mil',
        'image': 'assets/london.jpg',
        'description': texts.description_london,
      },
      {
        'name': texts.city_vancouver,
        'country': texts.country_canada,
        'population': '2.4 mil',
        'image': 'assets/vancouver.jpg',
        'description': texts.description_vancouver,
      },
      {
        'name': texts.city_new_york,
        'country': texts.country_usa,
        'population': '8.1 mil',
        'image': 'assets/newyork.jpg',
        'description': texts.description_new_york,
      },
      {
        'name': texts.city_tokyo,
        'country': texts.country_japan,
        'population': '37.4 mil',
        'image': 'assets/tokyo.jpg',
        'description': texts.description_tokyo,
      },
      {
        'name': texts.city_paris,
        'country': texts.country_france,
        'population': '11 mil',
        'image': 'assets/paris.jpg',
        'description': texts.description_paris,
      },
      {
        'name': texts.city_sydney,
        'country': texts.country_australia,
        'population': '5.3 mil',
        'image': 'assets/sydney.jpg',
        'description': texts.description_sydney,
      },
      {
        'name': texts.city_rio,
        'country': texts.country_brazil,
        'population': '6.7 mil',
        'image': 'assets/riodejaneiro.jpg',
        'description': texts.description_rio,
      },
      {
        'name': texts.city_moscow,
        'country': texts.country_russia,
        'population': '12.4 mil',
        'image': 'assets/moscow.jpg',
        'description': texts.description_moscow,
      },
      {
        'name': texts.city_cairo,
        'country': texts.country_egypt,
        'population': '9.5 mil',
        'image': 'assets/elcairo.jpg',
        'description': texts.description_cairo,
      },
      {
        'name': texts.city_barcelona,
        'country': texts.country_spain,
        'population': '5.6 mil',
        'image': 'assets/barcelona.jpg',
        'description': texts.description_barcelona,
      },
      {
        'name': texts.city_berlin,
        'country': texts.country_germany,
        'population': '3.8 mil',
        'image': 'assets/berlin.jpg',
        'description': texts.description_berlin,
      },
      {
        'name': texts.city_dubai,
        'country': texts.country_uae,
        'population': '3.3 mil',
        'image': 'assets/dubai.jpg',
        'description': texts.description_dubai,
      },
      {
        'name': texts.city_rome,
        'country': texts.country_italy,
        'population': '2.8 mil',
        'image': 'assets/rome.jpg',
        'description': texts.description_rome,
      },
      {
        'name': texts.city_beijing,
        'country': texts.country_china,
        'population': '21 mil',
        'image': 'assets/beijing.jpg',
        'description': texts.description_beijing,
      },
      {
        'name': texts.city_buenos_aires,
        'country': texts.country_argentina,
        'population': '3.1 mil',
        'image': 'assets/buenosaires.jpg',
        'description': texts.description_buenos_aires,
      },
      {
        'name': texts.city_los_angeles,
        'country': texts.country_usa,
        'population': '4 mil',
        'image': 'assets/losangeles.jpg',
        'description': texts.description_los_angeles,
      },
      {
        'name': texts.city_bangkok,
        'country': texts.country_thailand,
        'population': '11 mil',
        'image': 'assets/bangkok.jpg',
        'description': texts.description_bangkok,
      },
    ];

    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: Hero(
              tag: city['image']!,
              child: Image.asset(
                city['image']!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              city['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${city['country']}\n${AppLocalizations.of(context)!.population}: ${city['population']}',
              style: const TextStyle(height: 1.5),
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityDetailsScreen(
                    cityName: city['name']!,
                    cityImage: city['image']!,
                    cityDescription: city['description']!,
                  ),
                ),
              );

              if (result != null) {
                setState(() {
                  cities.removeWhere((c) => c['name'] == result);
                });
              }
            },
          ),
        );
      },
    );
  }
}
