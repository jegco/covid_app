import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final int totalConfirmed;
  final int totalDeaths;
  final int totalRecovered;
  final DateTime date;
  final String title;
  final String countryCode;

  StatusWidget({
    @required this.totalConfirmed,
    @required this.totalDeaths,
    @required this.totalRecovered,
    @required this.date,
    @required this.title,
    this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: CircleAvatar(
            child: ClipOval(
              child: countryCode != null ?Flag(
                countryCode,
                height: 150.0,
                fit: BoxFit.fill,
              ) : Image.asset('assets/img/world.png'),
            ),
            radius: 60.0,
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Confirmados totales',
                        textAlign: TextAlign.center,
                      ),
                      Text(totalConfirmed.toString()),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Bajas totales',
                        textAlign: TextAlign.center,
                      ),
                      Text(totalDeaths.toString()),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Recuperados totales',
                        textAlign: TextAlign.center,
                      ),
                      Text(totalRecovered.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('Actualizado el ' + date.toIso8601String()),
        )
      ],
    );
  }
}
