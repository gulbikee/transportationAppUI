import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:keyseriulasim/data/bus_stations.dart';


class buildSearch extends StatefulWidget {
  @override
  _buildSearchState createState() => _buildSearchState();
}

class _buildSearchState extends State<buildSearch> {
  final kayseriBusStationsName=['551','552','553','554','555','556','557','558','559','560','561','556',];
       
    
  List<BusStations> kayseriBusStations=[
      BusStations('551',Icon(Icons.directions_bus)),
      BusStations('552',Icon(Icons.directions_bus)),
      BusStations('553',Icon(Icons.directions_bus)),
      BusStations('554',Icon(Icons.directions_bus)),
      BusStations('555',Icon(Icons.directions_bus)),
      BusStations('556',Icon(Icons.directions_bus)),
      BusStations('557',Icon(Icons.directions_bus)),
      BusStations('558',Icon(Icons.directions_bus)),
      BusStations('559',Icon(Icons.directions_bus)),
      BusStations('560',Icon(Icons.directions_bus)),
      BusStations('561',Icon(Icons.directions_bus)),
      BusStations('562',Icon(Icons.directions_bus)),


    ];
    
    var stations=List<String>();
  TextEditingController editingController=TextEditingController();
  @override
  void initState(){//Arama ekranını kulandığımız için anlık olarak ekranda görmemiz gerekecek
    super.initState();
    stations.addAll(kayseriBusStationsName);
  }
   void filterSearchResults(String query)
   {
     List<String> dummySearchList=List<String>();
     dummySearchList.addAll(kayseriBusStationsName);
     if(query.isNotEmpty)
     {
        List<String> dummyListData=List<String>();
        dummyListData.forEach((element) {
          if(stations.contains(query)){
          dummyListData.add(element);}
        },);
         setState(() {
           stations.clear();
           stations.addAll(dummyListData);
         });

     }
     else{
       setState(() {
         stations.clear();
         stations.addAll(kayseriBusStationsName);
       });
     }

   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
              child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            onChanged: (value){
              filterSearchResults(value);

            },
            controller: editingController,
            
    
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
            ),
          ),
        )
    );
  }
}
    
    
    class HomePage extends StatefulWidget {
      
    

      @override
      State<StatefulWidget> createState() {
        return _HomePageState();
      }
    }
    
    class _HomePageState extends State<HomePage> {

      Icon customIcon = const Icon(Icons.search);
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            title:
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_city, size: 50),
                    Text('OTOBÜS SAATLERİ'),
                  
                
               
              ],
            ),
            actions: [
              IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
            ],
            centerTitle: true,
            /*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),*/
           
            bottom: PreferredSize(
              
              preferredSize: Size.fromHeight(150.0),
              child:
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  buildSearch(),
                Text('FAVORİ EKLENMEDİ'),
                  Text('YAKINIMDAKİ DURAKLAR',style: TextStyle(fontSize: 25.0),),
                
                  ],
                ),
            ),
          ),
        );
      }
    }
    
    void _onSearchSchange() {
}
