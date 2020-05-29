import 'package:covidapp/domain/models/models.dart';
import 'package:covidapp/presentation/widgets/status_card.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Country countryData;

  DetailsPage({@required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryData.country),
      ),
      body: Container(
        color: Colors.white60,
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            child: StatusWidget(
              totalConfirmed: countryData.totalConfirmed,
              totalDeaths: countryData.totalDeaths,
              totalRecovered: countryData.totalRecovered,
              date: countryData.date,
              title: 'Covid-19 en ' + countryData.country,
              countryCode: countryData.countryCode,
            ),
          ),
        ),
      ),
    );
  }
}
