import 'package:flutter/material.dart';
import 'package:loja_virutal_app/models/user_model.dart';
import 'package:loja_virutal_app/screens/login_screen.dart';
import 'package:loja_virutal_app/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';
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
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model){
                          return  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  child:
                                  Text( !model.isLoggedIn() ? 'Entre ou cadastre-se' : 'Sair', 
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 13, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onTap: (){
                                    if (!model.isLoggedIn()) {
                                        Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => LoginScreen())
                                      );  
                                    } else {
                                      model.signOut();
                                    }
                                  },
                                ),
                              ],
                            );
                          }
                        ),
                    ),

                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Produtos', pageController, 1),
              //DrawerTile(Icons.location_on, 'Lojas', pageController, 2),
              DrawerTile(Icons.shopping_cart, 'Meus Pedidos', pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
