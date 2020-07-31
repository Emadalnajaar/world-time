import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg';
    //String bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
        appBar: AppBar(
          centerTitle : true ,
          leading: Icon(Icons.ac_unit),
          title : Text(
            'World Time ',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.grey[200],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          //backgroundColor: Colors.purple,
          //appBar: AppBar(),
      body: SafeArea(
         child : Container(
            decoration : BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/${bgImage}'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () async {
                          dynamic result =  await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time' : result['time'],
                              'location' : result['location'],
                              'isDaytime' : result['isDaytime'],
                              'flag' : result['flag'],
                            };
                          });
                        },
                        icon: Icon(
                            Icons.edit_location,
                            color: Colors.white,
                        ),
                        label: Text(
                            'Click here for Edit Location',
                          style: TextStyle(
                            color:Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}





