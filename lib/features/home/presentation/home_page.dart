import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:untitled/features/home/presentation/bloc/home_bloc.dart';
import 'package:untitled/features/internet_connection/internet_connection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInternet();
  }

  Future<void> getInternet() async {
    var noNetwork = await InternetConnectionChecker().hasConnection;
    if (!noNetwork) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return InternetConnectionPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Users'),
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
          ),
          body: ListView.builder(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                        state.usersList?.results?[index].picture?.medium ?? ''),
                  ),
                ),
                title: Text(state.usersList?.results?[index].name?.first ?? ''),
                subtitle: Text(state.usersList?.results?[index].email ?? ''),
              );
            },
          ),
        );
      },
    );
  }
}
