import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> superheroes = [
    "Superman",
    "Batman",
    "Wonder Woman",
    "Flash",
    "Aquaman",
  ];

  Map<String, dynamic> teamMap = {
    "squadName": "Super hero squad",
    "homeTown": "Metro City",
    "formed": 2016,
    "secretBase": "Super tower",
    "active": true,
    "members": [
      {
        "name": "Batman",
        "image":
            "https://www.lacasadeel.net/wp-content/uploads/2021/11/BATMAN-ENCABEZADO.jpg",
        "age": 29,
        "secretIdentity": "Dan Jukes",
        "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
      },
      {
        "name": "Superman",
        "image":
            "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/980px/public/media/image/2021/06/superman-2354819.jpg",
        "age": 39,
        "secretIdentity": "Jane Wilson",
        "powers": [
          "Million tonne punch",
          "Damage resistance",
          "Superhuman reflexes"
        ]
      },
      {
        "name": "Wonder Woman",
        "image":
            "https://dam.smashmexico.com.mx/wp-content/uploads/2021/10/wonder-woman-historia-comics-escenciales-cover.jpg",
        "age": 1000000,
        "secretIdentity": "Unknown",
        "powers": [
          "Immortality",
          "Heat Immunity",
          "Inferno",
          "Teleportation",
          "Interdimensional travel"
        ]
      }
    ]
  };

  void showDetailSuperhero(Map<String, dynamic> hero) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(hero["image"]),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                hero["name"],
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 18.0,
                ),
              ),
              ListTile(
                title: Text(hero["age"].toString()),
                subtitle: Text("Superhero age"),
              ),
              ListTile(
                title: Text(hero["secretIdentity"]),
                subtitle: Text("Secret Identity"),
              ),
              ...hero["powers"].map<Widget>((e) => Text(e)).toList()
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("ListPage"),
        centerTitle: true,
      ),
      // body: ListView.builder(
      //   itemCount: superheroes.length,
      //   itemBuilder: (BuildContext context, int index){
      //     return ListTile(
      //       title: Text(superheroes[index]),
      //       subtitle: const Text("Nombre"),
      //       trailing: IconButton(
      //         icon: Icon(Icons.delete),
      //         onPressed: (){
      //           superheroes.removeAt(index);
      //           setState(() {
      //
      //           });
      //         },
      //       ),
      //     );
      //   },
      // ),

      // body: ListView.builder(
      //   itemCount: teamMap["members"].length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       leading: CircleAvatar(
      //         radius: 22,
      //         backgroundImage: NetworkImage(teamMap["members"][index]["image"]),
      //       ),
      //       title: Text(teamMap["members"][index]["name"]),
      //       subtitle: Text(teamMap["squadName"]),
      //       trailing: IconButton(
      //         icon: Icon(Icons.remove_red_eye_sharp),
      //         onPressed: () {
      //           // print(teamMap["members"][index]);
      //           showDetailSuperhero(teamMap["members"][index]);
      //         },
      //       ),
      //     );
      //   },
      // ),

      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(4, 4),
                  ),
                ]),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    "https://picsum.photos/500/500/?image=$index",
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Web Design",
                        style: GoogleFonts.montserrat(
                          color: Color(0xff3E4752),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "Wade Warren",
                        style: GoogleFonts.montserrat(
                          color: Color(0xff3E4752).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "06/12/2022",
                      style: GoogleFonts.montserrat(
                        color: Color(0xff3E4752).withOpacity(0.45),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            color: Color(0xff3FC2A3),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Completed",
                          style: GoogleFonts.montserrat(
                            color: Color(0xff3FC2A3),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
