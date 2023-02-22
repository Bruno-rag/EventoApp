import 'package:flutter/material.dart';

class GerenciarPresenca extends StatefulWidget {
  const GerenciarPresenca({super.key});

  @override
  State<GerenciarPresenca> createState() => _GerenciarPresencaState();
}

class _GerenciarPresencaState extends State<GerenciarPresenca> {
  bool _CheckCarla = false;
  bool _CheckJoao = false;
  bool _CheckMaria = false;
  bool _CheckThanos = false;
  bool _CheckMonkey = false;
  bool _CheckIchigo = false;
  bool _CheckKakashi = false;
  bool _CheckLoki = false;
  bool _CheckKang = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
              child: Text(
                'Lista de Participantes',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
          Container(
            child: CheckboxListTile(
              title: Text('Joao Carlos'),
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

          Container(
            child: CheckboxListTile(
              title: Text('Maria Antonieta'),
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

          Container(

            child: CheckboxListTile(
              title: Text('Thanos Inevitável'),
              secondary: Icon(Icons.account_box),
              value: _CheckThanos,
              onChanged: (value) {
                setState(
                  () => _CheckThanos = value!,
                );
              },
              checkColor: Colors.black,
            ),
          ),
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
          Container(
            child: CheckboxListTile(
              title: Text('Ichigo Kurosaki '),
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

          Container(
            child: CheckboxListTile(
              title: Text('Kakashi Hatake '),
              secondary: Icon(Icons.account_box),
              value: _CheckKakashi,
              onChanged: (value) {
                setState(
                  () => _CheckKakashi = value!,
                );
              },
              activeColor: Color.fromARGB(255, 12, 143, 56),
              checkColor: Colors.black,
            ),
          ),

          Container(
            child: CheckboxListTile(
              title: Text('Loki Laufeyson '),
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

          Container(
            child: CheckboxListTile(
              title: Text('kang o conquistador '),
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
