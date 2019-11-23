import 'package:flutter/material.dart';
import 'package:lost_and_found/widgets/custom_drawer.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = '/about';
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: _buildAppBar(),
      drawer: CustomDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Sobre o Projeto'),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _texto(),
        _image(),
        _draggable(),
      ],
    );
  }

  Widget _draggable() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.2,
        maxChildSize: 0.6,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Text(
              'LOST & FOUND PROJECT\n\nProjeto desenvolvido em Flutter utilizando a extensão do Firebase como banco de dados. O projeto tem como sua principal caracteristica, a, disponibilidade para o usuário poder publicar ou encontrar determinado objeto perdido. O App permite o usuário adicionar dados do objeto como: nome, característica, foto, data e o local encontrado.',
              style: TextStyle(
                fontFamily: "WorkSansSemiBold",
                fontSize: 19.0,
              ),
            ),
          );
        });
  }

  Widget _texto() {
    return Container(
      child: Text(
        'Sobre o Projeto',
        style: TextStyle(
          fontFamily: "WorkSansSemiBold",
          fontSize: 19.0,
        ),
      ),
      height: 30,
      alignment: AlignmentDirectional.bottomCenter,
    );
  }
  Widget _image() {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 20, left: 60,top: 300)),
        Image.asset(
          'assets/img/found.png',
          color: Colors.black,
          height: 220,
        ),
      ],
    );
  }
}
