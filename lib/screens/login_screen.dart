import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: (){},
            child: Text(
              'Criar Conta',
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-mail'
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if (text.isEmpty || !text.contains('@')) {
                  return 'E-mail inválido';
                } 
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Senha'
              ),
              obscureText: true,
              validator: (text){
                if (text.isEmpty || text.length < 6) {
                  return 'Senha inválida';
                } 
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: (){}, 
                child: Text('Esqueci minha senha',
                textAlign: TextAlign.right
                ),
              padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              height: 40.0,
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){

                  }
                },
                child: Text("Entrar",
                style: TextStyle(fontSize: 18.0,)
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        )
      ),
    );
  }
}