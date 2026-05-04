import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'detail_screen.dart';
class HomeScreen extends StatefulWidget{
 const HomeScreen({super.key});
 @override State<HomeScreen> createState()=>_Hs();
}
class _Hs extends State<HomeScreen>{
 @override Widget build(BuildContext c){
   return Scaffold(
     appBar:AppBar(title:const Text('Pokémon Dex'),elevation:0,backgroundColor:Colors.red[700],),
     body:ListView.builder(
       padding:const EdgeInsets.symmetric(vertical:8),
       itemCount:pokemonData.length,
       itemBuilder:(cx,i){
         final p=pokemonData[i];
         return Card(
           margin:const EdgeInsets.symmetric(horizontal:12,vertical:8),
           child:ListTile(
             leading:Container(
               width:50,height:50,
               decoration:BoxDecoration(color:Colors.grey[200],borderRadius:BorderRadius.circular(8)),
               child:ClipRRect(
                 borderRadius:BorderRadius.circular(8),
                 child:Image.asset(p.assetPath,fit:BoxFit.cover,errorBuilder:(cx,e,s)=>Center(child:Text(p.emoji,style:const TextStyle(fontSize:28),)),),
               ),
             ),
             title:Text(p.name,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:16)),
             subtitle:Text(p.type,style:const TextStyle(fontSize:12)),
             trailing:const Icon(Icons.arrow_forward_ios,size:16),
             onTap:(){Navigator.push(cx,MaterialPageRoute(builder:(cx)=>DetailScreen(pokemon:p)));},
           ),
         );
       },
     ),
   );
 }
}
