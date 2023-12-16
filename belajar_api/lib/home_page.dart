import 'package:flutter/material.dart';
import '../../models/character_model.dart';
import '../../controllers/api_controller.dart';
import '../components/loading.dart';
import '../components/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Character> _characters = <Character>[];
  List<Character> _charactersDisplay = <Character>[];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchCharacters().then((value) {
      setState(() {
        _isLoading = false;
        _characters.addAll(value);
        _charactersDisplay = _characters;
// print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return MyListTile(character: _charactersDisplay[index]);
            } else {
              return const MyLoading();
            }
          },
          itemCount: _charactersDisplay.length,
        ),
      ),
    );
  }
}
