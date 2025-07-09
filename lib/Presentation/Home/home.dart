import 'package:advice_generator/Presentation/Home/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                child: Column(
                  children: [Text('Theme'), SizedBox(height: 5), ThemeToggle()],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => context.go('/'),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 38, 66),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
