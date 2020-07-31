import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation>{

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();
      // navigate home screen
      Navigator.pop(context , {   //arguments
        'location': instance.location,
        'flag': instance.flag
        'time': instance.time,
        'isDaytime' : instance.isDaytime,
      });
    }

  @override
  Widget build(BuildContext context) {
    print('Build initState function run');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text('CHOOSE YOUR COUNTRY '),
        elevation: 0.0,
      ),
      body : ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context , index){
           return Padding(
             padding: const EdgeInsets.symmetric(vertical : 7.0 , horizontal: 4.0),
             child : Card(
                child: ListTile(
                  onTap: () { updateTime(index); },
                    title: Text(locations[index].location),
                    leading : CircleAvatar(
                  backgroundImage: AssetImage('assets/''${locations[index].flag}'),
                ),
              ),
             ),
          );
        }
      ),
    );
  }
}






/*
void getDate() async {


  String username = await Future.delayed(Duration(seconds: 3), () {
    return 'imad';
  });

//  simulate network request to get bio of the username
  String bio = await Future.delayed(Duration(seconds: 2), () {
    return 'my bio looooooooooooooooool';
  });

//  Now print all name and bio
  print('${username} - ${bio}');
}



/////////////////////////////////////////
@override
void initState() {
  super.initState();
  print('initState function run');
  getDate();
}

*/
