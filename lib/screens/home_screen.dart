import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget{
 const HomeScreen({super.key});
 @override State<HomeScreen> createState()=>_Hs();
}

class _Hs extends State<HomeScreen>{
 String? selectedType;
 List<String> get types=>[
   'Semua',...pokemonData.map((p)=>p.type.split(' / ')[0]).toSet().toList()..sort()
 ];
 List<Pokemon> get filteredPokemon{
   if(selectedType==null||selectedType=='Semua')return pokemonData;
   return pokemonData.where((p)=>p.type.contains(selectedType!)).toList();
 }

 @override Widget build(BuildContext c){
   return Scaffold(
     appBar:AppBar(
       title:const Text('Pokémon Dex',style:TextStyle(fontWeight:FontWeight.bold,fontSize:24)),
       elevation:8,shadowColor:Colors.black54,
       actions:[IconButton(icon:Icon(context.watch<ThemeProvider>().isDark?Icons.light_mode:Icons.dark_mode),onPressed:(){context.read<ThemeProvider>().toggleTheme();})],
       backgroundColor:Colors.red[700],
     ),
     body:Column(children:[
       SizedBox(height:70,child:ListView(
         scrollDirection:Axis.horizontal,padding:const EdgeInsets.symmetric(horizontal:12,vertical:8),
         children:types.map((t)=>Padding(
           padding:const EdgeInsets.symmetric(horizontal:4),
           child:FilterChip(
             label:Text(t,style:const TextStyle(fontWeight:FontWeight.w500)),
             selected:selectedType==t,onSelected:(v){setState((){selectedType=v?t:null;});},
             backgroundColor:Colors.grey[300],selectedColor:Colors.red[200],elevation:2,
           ),
         )).toList(),
       )),
       Expanded(child:filteredPokemon.isEmpty?Center(child:Text('Tidak ada Pokémon',style:Theme.of(c).textTheme.titleMedium)):ListView.builder(
         padding:const EdgeInsets.symmetric(vertical:8,horizontal:8),itemCount:filteredPokemon.length,
         itemBuilder:(cx,i){final p=filteredPokemon[i];return Card(
           margin:const EdgeInsets.symmetric(horizontal:8,vertical:6),elevation:6,shadowColor:Colors.black26,
           shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
           child:ListTile(
             contentPadding:const EdgeInsets.all(12),
             leading:Container(width:60,height:60,
               decoration:BoxDecoration(color:Colors.grey[200],borderRadius:BorderRadius.circular(12),
               boxShadow:[BoxShadow(color:Colors.black12,blurRadius:4,offset:const Offset(2,2))]),
               child:ClipRRect(borderRadius:BorderRadius.circular(12),
                 child:Image.asset(p.assetPath,fit:BoxFit.cover,
                   errorBuilder:(cx,e,s)=>Center(child:Text(p.emoji,style:const TextStyle(fontSize:28))),),
               ),
             ),
             title:Text(p.name,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:16)),
             subtitle:Wrap(spacing:4,children:[...p.type.split(' / ').map((t)=>Chip(label:Text(t,style:const TextStyle(fontSize:10,fontWeight:FontWeight.w600,color:Colors.white)),backgroundColor:_getTypeColor(t),padding:const EdgeInsets.symmetric(horizontal:8,vertical:2),materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,elevation:2,))]),
             trailing:const Icon(Icons.arrow_forward_ios,size:16),
             onTap:(){Navigator.push(cx,MaterialPageRoute(builder:(cx)=>DetailScreen(pokemon:p)));},
           ),
         );},
       )),
     ]),
   );
 }
 Color _getTypeColor(String t){
   switch(t.toLowerCase()){
     case 'grass':return Colors.green[400]!;
     case 'poison':return Colors.purple[400]!;
     case 'fire':return Colors.red[400]!;
     case 'water':return Colors.blue[400]!;
     case 'bug':return Colors.lime[400]!;
     case 'normal':return Colors.grey[500]!;
     case 'electric':return Colors.amber[400]!;
     case 'ground':return Colors.orange[400]!;
     case 'flying':return Colors.blue[300]!;
     case 'rock':return Colors.grey[600]!;
     case 'ice':return Colors.cyan[300]!;
     case 'dragon':return Colors.indigo[400]!;
     case 'psychic':return Colors.pink[400]!;
     case 'fighting':return Colors.orange[600]!;
     case 'ghost':return Colors.purple[500]!;
     case 'steel':return Colors.grey[400]!;
     case 'fairy':return Colors.pink[300]!;
     default:return Colors.grey[500]!;
   }
 }
}

