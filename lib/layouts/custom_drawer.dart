import 'package:flutter/material.dart';
import 'package:loja_virutal_app/tiles/drawer_tile.dart';
class CustomDrawer extends StatelessWidget {

  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 15.0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: [
                    Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text('Cake´s\nFlutter',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        )
                    ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Olá',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              child:
                              Text('Entre ou cadastre-se',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 13, fontWeight: FontWeight.bold
                                ),
                              ),
                              onTap: (){},
                            ),
                          ],
                        )
                    ),

                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Produtos', pageController, 1),
              DrawerTile(Icons.location_on, 'Lojas', pageController, 2),
              DrawerTile(Icons.playlist_add, 'Meus Pedidos', pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
