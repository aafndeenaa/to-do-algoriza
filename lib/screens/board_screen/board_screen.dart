import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/screens/all_task_screen/all_tasks_screen.dart';
import 'package:note_app/screens/compelet_screen/completed_tasks_screen.dart';
import 'package:note_app/screens/favorite_screen/favorites_screen.dart';
import 'package:note_app/screens/un_compeleted_screen/uncompleted_tasks_screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light),
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: const TextStyle(color: Colors.black),
            title: const Text(
              'Board',
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.black),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                  color: Colors.black),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: Colors.black,
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.grey[500],
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: const [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Uncompleted",
                ),
                Tab(
                  text: "Favorites",
                ),
              ],
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
            ),
          ),
          body: TabBarView(
            children: [
              AllTasksScreen(),
              const CompletedTasksScreen(),
              const UncompletedTasksScreen(),
              const FavoritesTasksScreen(),
            ],
          )),
    );
  }


}
