import 'package:flighttickets/CustomShapeClipper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Flight List Mock Up',
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
      theme: appTheme,
    ));

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFF3791A),
// need add fontfamily
);

List<String> locations = ['Boston (BOS)', 'New York City (JFK)']; 

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopPart()],
      ),
    );
  }
}

const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize:  16.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize:  16.0);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor],),),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50.0,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.location_on, color: Colors.white,),
                          SizedBox(width: 16.0,),
                          PopupMenuButton(
                            onSelected: (index) {
                              setState(() {
                                selectedLocationIndex = index;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(locations[selectedLocationIndex], style: dropDownLabelStyle,),
                                Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                            ],),
                            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(locations[0], style: dropDownMenuItemStyle,),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(locations[1], style: dropDownMenuItemStyle),
                                value: 1,
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.settings, color: Colors.white,),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    Text('Where would\nyou want to go?', style: TextStyle(fontSize: 24.0, color: Colors.white,), textAlign: TextAlign.center,),
                    SizedBox(height: 30.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: TextField(
                          controller: TextEditingController(text: locations[1],),
                          style: dropDownMenuItemStyle,
                          cursorColor: appTheme.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 13.0),
                            suffixIcon: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(30.0),),
                              child: Icon(Icons.search, color: Colors.black,),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ChoiceChip(Icons.flight_takeoff, 'Flights', isFlightSelected),
                        SizedBox(width: 20.0,),
                        ChoiceChip(Icons.hotel, 'Hotels', !isFlightSelected),
                      ],)
                  ],
                ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15), 
        borderRadius: BorderRadius.all( 
          Radius.circular(20.0),
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text, 
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
