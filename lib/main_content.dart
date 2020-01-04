import 'package:flutter/material.dart';

class MainContent extends StatefulWidget {
  @override
  MainContentState createState() => MainContentState();
}

class MainContentState extends State<MainContent> {
  final _suggestions = <String>[];
  final _saved = new Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    _suggestions.clear();
    _suggestions.add("Day1 基础组件(A~Z)"); /*4*/
    _suggestions.add("Day2 列表"); /*4*/
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length+1,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2; /*3*/
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('21天菜单'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.share), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String pair) {
              return new ListTile(
                title: new Text(
                  pair,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('我的收藏'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildRow(String pair) {
    final bool alreadySaved = _saved.contains(pair); // 新增本行
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
