import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interface_corda/data/data.dart';
import 'package:interface_corda/screens/menu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _userController = new TextEditingController();
  final _passwordController = new TextEditingController();

  String valueHost;
  String valuePort;

  acesso() {
    print("outra tela");
    host = valueHost;
    port = valuePort;
    print(host);
    print(port);

      Future makeRequest() async {
    var url = "http://$host:$port/sharedmachineweb/api/logins/";

     http.post(Uri.encodeFull(url),
        headers: {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        body: jsonEncode(
          {
          "email": "${_userController.text}",
	        "senha": "${_passwordController.text}"
          }
        ));
        print(_userController.text);
        print(_userController.text);
  }

    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
                decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Colors.white, Colors.blue.shade900, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                  tileMode: TileMode.mirror),
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.08)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Image.asset(
                              'assets/images/bradesco_logo_lado.png',
                              height: 30,
                            ),
                          )),
                          Divider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                          Text(
                            'Acesso ID Máquina' + '\n' + 'Compartilhada',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                child: Padding(
                                    padding: const EdgeInsets.all(02),
                                    child: new PhysicalModel(
                                      color: Colors.white,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 0,
                                      child: TextFormField(
                                        initialValue: '10.42.0.251',
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "   Error";
                                          } else {
                                            valueHost = value;
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: " Host",
                                          hintStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          fillColor: Colors.green,
                                        ),
                                      ),
                                    )),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.all(02),
                                    child: new PhysicalModel(
                                      color: Colors.white,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 0,
                                      child: TextFormField(
                                        
                                        initialValue: '8080',
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "   Error";
                                          } else {
                                            valuePort = value;
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: " Port",
                                          hintStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          fillColor: Colors.green,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Flexible(
                                flex: 3,
                                child: Padding(
                                    padding: const EdgeInsets.all(02),
                                    child: new PhysicalModel(
                                      color: Colors.white,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextFormField(
                                          controller: _userController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "   Error";
                                            }
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: " Username "+" \"user@bradesco.com.br\"",
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                            fillColor: Colors.green,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Flexible(
                                flex: 3,
                                child: Padding(
                                    padding: const EdgeInsets.all(02),
                                    child: new PhysicalModel(
                                      color: Colors.white,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextFormField(
                                          maxLength: 5,
                                          controller: _passwordController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "   Error";
                                            }
                                          },
                                          obscureText: true,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: " Password "+" \"12345\"",
                                
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                            fillColor: Colors.green,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Colors.red,
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      print("validou");
                                      acesso();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
