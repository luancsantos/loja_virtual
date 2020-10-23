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
                Color.fromARGB(255, 204, 153, 0),
                Color.fromARGB(255, 0, 0, 0),
                
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
                        child: Image.asset(
                          "images/logo_marcia.jpg",
                          fit: BoxFit.cover,
                          height: 150.0,
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
                                Text("Olá, ${!model.isLoggedIn() ? '' : model.userData["name"]}",
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0,),
                                GestureDetector(
                                  child: !model.isLoggedIn() ?
                                    Text('Entre ou cadastre-se' , 
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 13, fontWeight: FontWeight.bold
                                      ), 
                                    )
                                   : null,
                                  onTap: (){
                                    if (!model.isLoggedIn()) {
                                        Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => LoginScreen())
                                      );  
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
              DrawerTile(Icons.location_on, 'Lojas', pageController, 2),
              DrawerTile(Icons.car_rental, 'Meus Pedidos', pageController, 3),
              Divider(),
              GestureDetector(
                child: ScopedModelDescendant<UserModel>(
                  builder: (context, child ,model){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: model.isLoggedIn() ? 
                          Row(
                            children: [
                              Icon(
                                Icons.logout,
                                size: 32.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(width: 30.0),
                              Text('Sair' , 
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 13, fontWeight: FontWeight.bold
                                ),
                              ), 
                            ],
                          ) : null,
                          onTap: (){
                            if (model.isLoggedIn()) {
                             model.signOut();
                            }
                          },
                        )
                      ],
                    );
                  }
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
