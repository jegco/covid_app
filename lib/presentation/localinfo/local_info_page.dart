import 'package:covidapp/presentation/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_info_bloc.dart';
import 'local_info_event.dart';
import 'local_info_page_state.dart';

class LocalInfoPage extends StatefulWidget{
  @override
  _LocalInfoPageState createState() => _LocalInfoPageState();
}

class _LocalInfoPageState extends State<LocalInfoPage>{
  LocalInfoBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<LocalInfoBloc>(context);
    _bloc.add(LoadLocalInfoData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is LocalInfoDataIsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () async => _bloc.add(UpdateLocalInfoData()),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  margin: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/sofka-logo.png'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                              text: '#',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 35.0,
                              ),
                              children: [
                                TextSpan(
                                  text: 'MeQuedoEnCasa',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 30.0),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300.0,
                  margin: const EdgeInsets.all(20.0),
                  child: state is LocalInfoDataLoaded
                      ? Container(
                          child: Card(
                            color: Colors.white,
                            child: StatusWidget(
                              totalConfirmed: state.data.totalConfirmed,
                              totalDeaths: state.data.totalDeaths,
                              totalRecovered: state.data.totalRecovered,
                              date: state.data.date,
                              title: 'Covid-19 en ' + state.data.country,
                              countryCode: state.data.countryCode,
                            ),
                          ),
                        )
                      : Center(
                          child: Text('hubo in error buscando la informacion'),
                        ),
                ),
                Container(
                  height: 300.0,
                  margin: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '¿Que es el Covid-19?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Los coronavirus (CoV) son virus '
                                    'que surgen periodicamente en '
                                    'diferentes areas del mundo y '
                                    'que causan Infección '
                                    'Respiratoria Aguda (IRA), es '
                                    'decir gripa, que pueden llegar a ser'
                                    ' leve, moderada o grave.',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 180.0,
                                  child: Center(
                                    child: OutlineButton(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                      shape: StadiumBorder(),
                                      onPressed: () {},
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Mas informacion',
                                            style:
                                                TextStyle(color: Colors.orange),
                                          ),
                                          Icon(
                                            Icons.launch,
                                            color: Colors.orange,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/sofka-logo.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200.0,
                  margin: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text('Sintomas'),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Image.asset(
                                              'assets/img/cough.png'),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('Tos seca'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Image.asset(
                                              'assets/img/nose.png'),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('Secreción nasal'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
