import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/cubit/application_state.dart';
import 'package:weather_app/src/core/cubit/cubit_factory.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';
import 'package:weather_app/src/features/home/presentation/business_components/home_cubit.dart';
import 'package:weather_app/src/features/weather_details/presentation/user_interfaces/location_weather_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  final HomeCubit _homeCubit = CubitFactory.homeCubit;

  List<LocationModel>? _searchResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: BlocBuilder<HomeCubit, ApplicationState>(
          bloc: _homeCubit,
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeWeatherLocationSearchSuccessState:
                _searchResults =
                    (state as HomeWeatherLocationSearchSuccessState).results;
                break;
              default:
            }

            return Column(
              children: [
                SearchBar(
                  onChanged: (value) {
                    _homeCubit.updateSearchResults(value);
                  },
                  hintText: 'City/Country',
                  onSubmitted: (value) {
                    _cityController.clear();
                  },
                ),
                Visibility(
                    visible:
                        (_searchResults != null && _searchResults!.isNotEmpty),
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: _searchResults?.length,
                        itemBuilder: (context, index) {
                          final location = _searchResults?[index];
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  LocationWeatherDetailsScreen.routeName,
                                  arguments: location);
                            },
                            title:
                                Text("${location?.name},${location?.country}"),
                          );
                        },
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
