import 'package:advice_generator/Presentation/Bloc/advice_bloc.dart';
import 'package:advice_generator/Presentation/Provider/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advice Generator'), centerTitle: true),
      drawer: Drawer(
        child: FloatingActionButton(
          onPressed: () => context.go('/login'),
          child: Text('Sign Out'),
        ),
      ),
      body: Consumer<UsernameProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi,', style: TextStyle(fontSize: 20)),
                      Row(
                        children: [
                          Text(
                            context.watch<UsernameProvider>().newUsername,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.hail_rounded),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<AdviceBloc, AdviceState>(
                  builder: (context, state) {
                    if (state is AdviceLoading) {
                      return Center(child: const CircularProgressIndicator());
                    } else if (state is AdviceLoaded) {
                      return Card(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Advice #${state.advice.id}',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 150),
                                    Text(
                                      state.advice.advice,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 200.ms)
                          .slideX(
                            begin: 0.2,
                            duration: 1000.ms,
                            curve: Curves.easeOut,
                          );
                    } else if (state is AdviceError) {
                      return Center(child: Text(state.message));
                    }

                    return SizedBox.shrink();
                  },
                ),
              ),
              Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 38, 66),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Click To Generate Advice',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -50,
                        left: 160,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                context.read<AdviceBloc>().add(
                                  GetAdviceEvent(),
                                );
                              },
                              icon: Icon(
                                Icons.restart_alt,
                                size: 50,
                                color: const Color.fromARGB(255, 0, 38, 66),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(duration: 200.ms)
                  .slideX(begin: 0.2, duration: 1000.ms, curve: Curves.easeOut),
            ],
          ),
        ),
      ),
    );
  }
}
