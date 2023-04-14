import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game/provider/invetario.dart';
import 'package:provider/provider.dart';

import '../my_game.dart';

class InventaryBase extends StatelessWidget {

  static String id='Inventario';
 final MyGame game;
  const InventaryBase(this.game,{super.key});

  @override
  Widget build(BuildContext context) {
    final sized=MediaQuery.of(context).size;

    final provider=context.watch<GameProvider>();

  
    return Column(
      children:[ 
        Container(
          height: sized.height*0.15,
          width: sized.width,
          color: Colors.brown,
          child: ElevatedButton(onPressed: (){
game.overlays.remove("Inventario");
game.overlays.add("ButtonController");

          }, child: Text("Salir")),
        ),
        
        Expanded(
        child: GridView.builder(
          
          itemCount: provider.getMedicina.length,
          padding: EdgeInsets.symmetric(horizontal: sized.width*0.15,vertical: sized.height*0.05) ,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, i) {
              return (!provider.movComponent)?
          
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Draggable<bool>(
                  onDragStarted: (){
                    provider.movComponent=true;
                  },
                        onDragCompleted: () {
                    provider.movComponent=false;

                        },
                        onDraggableCanceled: (a, b) {
                    provider.movComponent=false;


                       
                        },
                        data: false,
                       
                        feedback: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                          
                          child: SizedBox(
                            
                            width:(((sized.width-((sized.width*0.15)*2))/8)-10), height: (((sized.height-((sized.height*0.05)*2))/4)-10),
                            

                             child:(provider.getMedicina[i]!=null)?
                             
                           RawImage(image:provider.getMedicina[i].image  )
                            
                             :null,
                             
                             )),
                        child:  Container(
                            
                          
                             color: Colors.blueAccent,

                             child:(provider.getMedicina[i]!=null)?
                             
                            RawImage( image:provider.getMedicina[i].image   )
                             
                             :null,
                             
                             )
                      ),
              ):
              
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
          
                child: DragTarget<bool>(
                  
                    onAccept: (data) {
              
              
                    },
                    builder: (_, __, ___) =>
                      Container(
                            
            
                             color: Colors.blueAccent,

                             child:(provider.getMedicina[i]!=null)?
                             
                            RawImage( image:provider.getMedicina[i].image   )
                             
                             :null,
                         
                             
                             )),
              );
            }),
      ),]
    );
  }
}
