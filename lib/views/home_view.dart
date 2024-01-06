import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/after_search_widget.dart';
import 'package:weather_app/widgets/start_home_widget.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  bool search =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeatherApp"),
        actions: [
            IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return  SearchView();
                }));
            },
                icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context,state){
          if(state is NoWeatherState){
            return const StartHomeWidget();
          }else if(state is WeatherSuccessState){
            return AfterSearchWidget(weather: state.weatherModel,color: Theme.of(context).colorScheme.primary,);
          }else if(state is WeatherFailedState){
            return Text(state.msg);
          }else{
            return const Text("??????????");
          }
        }
      )
    );
  }
}
