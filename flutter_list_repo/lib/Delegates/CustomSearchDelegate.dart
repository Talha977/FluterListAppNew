// import 'package:flutter/material.dart';

// Widget BuildSearch() => SearchWidget {
// hintTex
// }
import 'package:flutter/material.dart';
import 'package:flutter_list_repo/Widgets/screen_select.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> listItems;
  CustomSearchDelegate({this.listItems});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          print('clear button pressed');
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in listItems) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              int onTapIndex = listItems.indexOf(result);
              print('Index pressed: $onTapIndex');
              onTapMainScreen(context, onTapIndex);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in listItems) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              int onTapIndex = listItems.indexOf(result);
              print('Index pressed: $onTapIndex');
              onTapMainScreen(context, onTapIndex);
            },
          );
        });
  }
}
