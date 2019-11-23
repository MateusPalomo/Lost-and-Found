import 'package:flutter/material.dart';
import 'package:lost_and_found/widgets/custom_drawer.dart';

class UseTermPage extends StatefulWidget {
  static const String routeName = '/useterm';
  @override
  _UseTermPageState createState() => _UseTermPageState();
}

class _UseTermPageState extends State<UseTermPage> {
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
      title: Text('Termos de uso'),
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
              'LICENÇA\n\nCopyright 2019 Mateus Palomo Cunha\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
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
        'Termos de uso do projeto',
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
          'assets/img/flutter.png',
          height: 200,
        ),
      ],
    );
  }
}
