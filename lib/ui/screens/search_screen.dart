import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/widgets/post_list_item.dart';
import 'package:yana_gaman/ui/widgets/textfield.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search.text = "bo";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.lightGreen[700],
        title: Text("Search"),
        leading: GestureDetector(
          onTap: ()=>Navigator.of(context).pop(),
                  child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
            child: CustomTextField(
              prifixIcon: Icon(Icons.search),
              labelText: "Search",
              labelStyle: HintTextStyle_1,
              controller: _search,
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "search result",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          _searchList()
        ],
      ),
    );
  }

  Widget _searchList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (buildContext, index) {
          return PostLitTile(
            title: "Bopath Falls",
            description: smapleText,
            rating: 4.0,
            name: "Nilupul",
          );
        });
  }
}
