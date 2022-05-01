import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo_components/pages/card_page.dart';

import 'package:google_fonts/google_fonts.dart';

import 'alert_page.dart';
import 'avatar_Page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  image: const DecorationImage(
                    // image: NetworkImage("https://ih1.redbubble.net/image.622748019.0162/pp,504x498-pad,600x600,f8f8f8.u1.jpg",),
                    image: NetworkImage(
                      "https://malditopaparazzo.com.ar/wp-content/uploads/2021/05/David-Chicle.jpg",
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      offset: Offset(4, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Flutter Components",
                style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 160.0,
                child: Divider(
                  thickness: 0.45,
                ),
              ),
              ItemComponentWidget(
                title: "Avatar",
                toPage: AvatarPage(),
              ),
              ItemComponentWidget(
                title: "Alert Page",
                toPage: AlertPage(),
              ),
              ItemComponentWidget(
                title: "Card Page",
                toPage: CardPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemComponentWidget extends StatelessWidget {
  String title;
  Widget toPage;

  ItemComponentWidget({
    required this.title,
    required this.toPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(4, 4),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => toPage));
        },
        leading: Icon(
          Icons.check_circle_outline,
          color: Color(0xff4A5467),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(),
        ),
        subtitle: Text(
          "Ir al detalle de $title",
          style: GoogleFonts.poppins(
            fontSize: 13.0,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}
