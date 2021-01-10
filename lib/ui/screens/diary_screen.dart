import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yana_gaman/ui/widgets/progressView.dart';
import 'package:yana_gaman/styles.dart';

class Diary extends StatefulWidget {
  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  List<Marker> _markerList = [];
  bool mapToogle = false;
  bool isLoad = true;
  var _currentLocation;
  int _initialIndex = 0;
  GoogleMapController mapController;
  void _reset(String shop) {
    _markerList.clear();
    _goToLocation(6.8000, 80.3667, 6.0);
  }

  List<String> _imagesList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg'
  ];
  List<String> _nameList = [
    'Bopath falls',
    'Babarakanda Falls',
    'Rath mal falls'
  ];

  @override
  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((value) {
      setState(() {
        _currentLocation = value;
        mapToogle = true;
      });
    });
    _markerList.add(_marker("6.8000", "80.3667", "1", "Bopath falls"));
    _markerList.add(_marker("6.9000", "80.5667", "2", "Hirigal Pokuna"));
    _markerList
        .add(_marker("6.766830266", "80.826496694", "3", "Babarakanda Falls"));
    _markerList.add(_marker("6.8000", "80.1667", "4", "Rath mal falls"));
  }

  Future<void> _goToLocation(double lat, double long, double zoom) async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: zoom, tilt: 50.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.lightGreen[700],
        title: Text("Travel Diary"),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        // bottom: AppBar(
        //   title: _tabView(),
        // ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _tabView(),
            Expanded(child: _getMap()),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 100.0,
            child: _getLocationList(),
          ),
        )
      ],
    );
  }

  _getLocationList() {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _goToLocation(6.8000, 80.3667, 14.0);
            },
            child: Stack(
              children: [
                Container(
                  height: 80.0,
                  width: 200,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(color: ShadowColor, blurRadius: 6.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            _imagesList[index].toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(_nameList[index].toString()),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: GestureDetector(
                      onTap: () {
                        print("gdggdgdgd");
                      },
                      child: Icon(Icons.more_vert)),
                )
              ],
            ),
          );
        });
  }

  Widget _getMap() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: mapToogle
            ? GoogleMap(
                zoomControlsEnabled: false,
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: LatLng(6.8000, 80.3667), zoom: 8),
                mapType: MapType.normal,
                markers: Set.of(_markerList),
              )
            : Container(child: Center(child: ProgressView(small: true))));
  }

  void _onMapCreated(controler) {
    mapController = controler;
  }

  Marker _marker(String lat, String long, String id, String name) {
    return Marker(
        markerId: MarkerId(id),
        position: LatLng(double.parse(lat), double.parse(long)),
        infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan));
  }

  Widget _tabView() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      // width: 170,
      color: Colors.white,
      child: DefaultTabController(
        initialIndex: _initialIndex,
        length: 2,
        child: TabBar(
          onTap: (index) {
            setState(() {
              switch (index) {
                case 0:
                  break;
                case 1:
                  break;

                default:
              }
            });
          },
          indicatorColor: DefaultColor,
          indicatorWeight: 4.0,
          unselectedLabelColor: Colors.grey,
          labelColor: DefaultColor,
          labelPadding: EdgeInsets.zero,
          // indicatorPadding: EdgeInsets.only(right: 10.0),
          tabs: [
            Tab(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Wish to travel",
                  textAlign: TextAlign.left,
                  style: TabMenuStyle,
                ),
              ),
            )),
            Tab(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Already visted",
                  textAlign: TextAlign.left,
                  style: TabMenuStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
