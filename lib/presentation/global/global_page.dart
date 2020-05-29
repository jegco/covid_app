import 'package:covidapp/presentation/details/details_page.dart';
import 'package:covidapp/presentation/global/global_bloc.dart';
import 'package:covidapp/presentation/global/global_event.dart';
import 'package:covidapp/presentation/global/global_state.dart';
import 'package:covidapp/presentation/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage>{
  GlobalBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<GlobalBloc>(context);
    _bloc.add(LoadGlobalData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, GlobalState state) {
        if (state is GlobalDataIsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () async => _bloc.add(UpdateGlobalData()),
          child: state is GlobalDataLoaded
              ? CustomScrollView(
                  slivers: <Widget>[
                    SliverFixedExtentList(
                        delegate: SliverChildListDelegate(
                          [
                            Container(
                              height: 300.0,
                              margin: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Card(
                                  color: Colors.white,
                                  child: StatusWidget(
                                    totalConfirmed:
                                        state.summary.global.totalConfirmed,
                                    totalDeaths:
                                        state.summary.global.totalDeaths,
                                    totalRecovered:
                                        state.summary.global.totalRecovered,
                                    title: 'Datos globales',
                                    date: state.summary.date,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        itemExtent: 300.0),
                    SliverFixedExtentList(
                        delegate: SliverChildListDelegate(
                          [
                            Container(
                              height: 100.0,
                              width: 400.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Listado de paises con covid-19',
                                          style: TextStyle(fontSize: 20.0),
                                          textAlign: TextAlign.center,
                                        )),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton.icon(
                                          onPressed: () {},
                                          icon: Icon(Icons.sort_by_alpha),
                                          label: Text('Ordenar')),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        itemExtent: 100.0),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          countryData:
                                              state.summary.countries[index]),
                                    ));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            state.summary.countries[index]
                                                .country,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text(
                                                state.summary.countries[index]
                                                    .totalConfirmed
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Icon(
                                                  Icons.sentiment_dissatisfied,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                state.summary.countries[index]
                                                    .totalDeaths
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Text(
                                                state.summary.countries[index]
                                                    .totalRecovered
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          childCount: state.summary.countries.length),
                    ),
                  ],
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverFixedExtentList(
                        delegate: SliverChildListDelegate(
                          [
                            Center(
                              child:
                                  Text('hubo in error buscando la informacion'),
                            ),
                          ],
                        ),
                        itemExtent: 200.0)
                  ],
                ),
        );
      },
    );
  }
}
