import 'package:flutter/material.dart';

class HomologarInscricao extends StatefulWidget {
  const HomologarInscricao({super.key});

  @override
  State<HomologarInscricao> createState() => _HomologarInscricaoState();
}

class _HomologarInscricaoState extends State<HomologarInscricao> {
  bool _CheckCarla = false;
  bool _CheckJoao = false;
  bool _CheckMaria = false;
  bool _CheckThanos = false;
  bool _CheckMonkey = false;
  bool _CheckIchigo = false;
  bool _CheckKakashi = false;
  bool _CheckLoki = false;
  bool _CheckKang = false;
  bool _CheckClint = false;
  bool _CheckJon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView(
        padding: EdgeInsets.all(
           20,
        ),
        children: [
          Container(
            child: Center(
              child: Text(
                'Homologar Inscrição',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            child: CheckboxListTile(
              title: Text('Carla Andrade'),
              secondary: Icon(Icons.account_box),
              value: _CheckCarla,
              onChanged: (value) {
                setState(
                  () => _CheckCarla = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(
            child: CheckboxListTile(
              title: Text('Joao Figueiredo'),
              secondary: Icon(Icons.account_box),
              value: _CheckJoao,
              onChanged: (value) {
                setState(
                  () => _CheckJoao = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(
            child: CheckboxListTile(
              title: Text('Maria das Neves'),
              secondary: Icon(Icons.account_box),
              value: _CheckMaria,
              onChanged: (value) {
                setState(
                  () => _CheckMaria = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(

            child: CheckboxListTile(
              title: Text('Thanos Ineviatavel'),
              secondary: Icon(Icons.account_box),
              value: _CheckThanos,
              onChanged: (value) {
                setState(
                  () => _CheckThanos = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(
            child: CheckboxListTile(
              title: Text('Monkey D. Luffy'),
              secondary: Icon(Icons.account_box),
              value: _CheckMonkey,
              onChanged: (value) {
                setState(
                  () => _CheckMonkey = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(

            child: CheckboxListTile(
              title: Text('Ichigo Kurosaki'),
              secondary: Icon(Icons.account_box),
              value: _CheckIchigo,
              onChanged: (value) {
                setState(
                  () => _CheckIchigo = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(
            child: CheckboxListTile(
              title: Text('Loki Laufeyson'),
              secondary: Icon(Icons.account_box),
              value: _CheckLoki,
              onChanged: (value) {
                setState(
                  () => _CheckLoki = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(
            child: CheckboxListTile(
              title: Text('Kang, o Conquistador'),
              secondary: Icon(Icons.account_box),
              value: _CheckKang,
              onChanged: (value) {
                setState(
                  () => _CheckKang = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(
            child: CheckboxListTile(
              title: Text('Jon Bernthal'),
              secondary: Icon(Icons.account_box),
              value: _CheckJon,
              onChanged: (value) {
                setState(
                  () => _CheckJon = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          Divider(),
          Container(
            child: CheckboxListTile(
              title: Text('Clint Barton'),
              secondary: Icon(Icons.account_box),
              value: _CheckClint,
              onChanged: (value) {
                setState(
                  () => _CheckClint = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text(
                'Confirmar'
            ),
          )

        ],
      ),
    );
  }
}
