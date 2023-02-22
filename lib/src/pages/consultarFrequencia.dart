import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ConsultarFrequencia extends StatelessWidget {
  const ConsultarFrequencia({super.key});

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
                'Status de frequência',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //ICONE do histórico
          Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 12,
                      left: 20,
                      right: 20,
                    ),
                    //color: Colors.amber,
                    height: 210,
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image:  DecorationImage(
                          image: NetworkImage("https://media.istockphoto.com/id/974238866/pt/foto/audience-listens-to-the-lecturer-at-the-conference.jpg?s=612x612&w=0&k=20&c=ZOCjHsr2nyWVvAgjA36Kg1FaIQpvQ3oThxEf_W7JdCc="),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.24),
                            BlendMode.darken,
                          )
                      ),

                    ),
                    //descrição
                  ),

                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Presente ✔",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
