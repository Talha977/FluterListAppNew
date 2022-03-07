import 'package:flutter/material.dart';

class Datatablescreen extends StatefulWidget {
  const Datatablescreen({Key key}) : super(key: key);

  @override
  _DatatablescreenState createState() => _DatatablescreenState();
}

class _DatatablescreenState extends State<Datatablescreen> {
  List<User> _users;
  int sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    _users = getAllUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Data Table Example',
          ),
        ),
        body: ScrollableWidget(
          child: buildDataTable(),
        ),
      );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'Age'];
    return DataTable(
      border: TableBorder.all(
        width: 1.0,
        color: Colors.grey,
      ),
      columns: getColumns(columns),
      rows: getRows(_users),
      sortColumnIndex: sortColumnIndex,
      sortAscending: isAscending,
    );
  }

  // This vertical divider is not being used for the time being.
  // Widget _verticalDivider = const VerticalDivider(
  //   color: Colors.black,
  //   thickness: 1,
  // );
  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> rows) => rows.map((User user) {
        final cells = [user.firstName, user.lastName, user.age];
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      _users.sort((user1, user2) =>
          compareString(ascending, user1.firstName, user2.firstName));
    } else if (columnIndex == 1) {
      _users.sort((user1, user2) =>
          compareString(ascending, user1.lastName, user2.lastName));
    } else if (columnIndex == 2) {
      _users.sort((user1, user2) =>
          compareString(ascending, '${user1.age}', '${user2.age}'));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

List<User> getAllUsers() {
  final allUsers = <User>[
    User(firstName: 'Emma', lastName: 'Field', age: 37),
    User(firstName: 'Max', lastName: 'Stone', age: 27),
    User(firstName: 'Sarah', lastName: 'Winter', age: 20),
    User(firstName: 'James', lastName: 'Summer', age: 21),
    User(firstName: 'Lorita', lastName: 'Wilcher', age: 18),
    User(firstName: 'Anton', lastName: 'Wilbur', age: 32),
    User(firstName: 'Salina', lastName: 'Monsour', age: 24),
    User(firstName: 'Sunday', lastName: 'Salem', age: 42),
    User(firstName: 'Alva', lastName: 'Cowen', age: 47),
    User(firstName: 'Jonah', lastName: 'Lintz', age: 18),
    User(firstName: 'Kimberley', lastName: 'Kelson', age: 33),
    User(firstName: 'Waldo', lastName: 'Cybart', age: 19),
    User(firstName: 'Garret', lastName: 'Hoffmann', age: 27),
    User(firstName: 'Margaret', lastName: 'Yarger', age: 25),
    User(firstName: 'Foster', lastName: 'Lamp', age: 53),
    User(firstName: 'Samuel', lastName: 'Testa', age: 58),
    User(firstName: 'Sam', lastName: 'Schug', age: 44),
    User(firstName: 'Alise', lastName: 'Bryden', age: 41),
  ];
  return allUsers;
}

// User class
class User {
  final String firstName;
  final String lastName;
  final int age;

  User({@required this.firstName, @required this.lastName, @required this.age});
}

class ScrollableWidget extends StatelessWidget {
  final Widget child;

  const ScrollableWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
}
