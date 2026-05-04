import 'package:flutter/material.dart';
import '../models/pokemon.dart';
class DetailScreen extends StatelessWidget{
 final Pokemon pokemon;
 const DetailScreen({super.key,required this.pokemon});
 @override Widget build(BuildContext c){
   final p=pokemon;
   return Scaffold(
    appBar:AppBar(title:Text(p.name,style:const TextStyle(fontWeight:FontWeight.bold)),backgroundColor:Colors.red[700],elevation:8,shadowColor:Colors.black54),
    body:SingleChildScrollView(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Center(child:Card(elevation:8,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),child:Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:Colors.grey[100],borderRadius:BorderRadius.circular(16)),child:Image.asset(p.assetPath,width:140,height:140,fit:BoxFit.contain,errorBuilder:(c,e,s)=>Text(p.emoji,style:const TextStyle(fontSize:90)),),),),),
      const SizedBox(height:24),
      _buildCard('Informasi Dasar',[_i('Nama',p.name),_i('Tipe',p.type),_i('ID','#${p.id}')]),
      const SizedBox(height:16),
      _buildCard('Ability & Weakness',[_i('Ability',p.ability),_i('Weakness',p.weakness)]),
      const SizedBox(height:16),
      _buildStatsCard(),
      const SizedBox(height:16),
      _buildCard('Deskripsi',[Text(p.description,style:const TextStyle(fontSize:14,height:1.6))]),
      const SizedBox(height:16),
      _buildCard('Role dalam Tim',[Text(p.role,style:const TextStyle(fontSize:14,fontWeight:FontWeight.w500))]),
      const SizedBox(height:16),
      if(p.evolution.isNotEmpty && !(p.evolution.toLowerCase().contains('final') && p.name!='Charizard'))_buildCard('Evolusi',[_i('Evolusi',p.evolution)]),
      if(p.evolution.isNotEmpty && !(p.evolution.toLowerCase().contains('final') && p.name!='Charizard'))const SizedBox(height:16),
      _buildCard('Partner Cocok',[Wrap(spacing:8,runSpacing:8,children:[...p.partners.map((x)=>Chip(label:Text(x,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w500)),backgroundColor:Colors.red[600],elevation:2))])]),
    ]),),
   );
 }
 Widget _buildCard(String t,List<Widget> ch)=>Card(elevation:4,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t,style:const TextStyle(fontSize:16,fontWeight:FontWeight.bold)),const SizedBox(height:12),...ch])));
 Widget _i(String k,String v)=>Padding(padding:const EdgeInsets.symmetric(vertical:6),child:Row(crossAxisAlignment:CrossAxisAlignment.start,children:[SizedBox(width:110,child:Text(k,style:const TextStyle(fontWeight:FontWeight.w600,fontSize:13))),Expanded(child:Text(v,style:const TextStyle(fontSize:13)))]));
 Widget _buildStatsCard()=>Card(elevation:4,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('Stats',style:TextStyle(fontSize:16,fontWeight:FontWeight.bold)),const SizedBox(height:14),...pokemon.stats.entries.map((e){final pct=e.value/200.0;return Padding(padding:const EdgeInsets.symmetric(vertical:10),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text(e.key,style:const TextStyle(fontSize:13,fontWeight:FontWeight.w600)),Text(e.value.toString(),style:const TextStyle(fontWeight:FontWeight.bold,fontSize:13,color:Colors.red))]),const SizedBox(height:8),ClipRRect(borderRadius:BorderRadius.circular(10),child:LinearProgressIndicator(value:pct,minHeight:10,backgroundColor:Colors.grey[300],valueColor:AlwaysStoppedAnimation<Color>(_getStatColor(e.value))))]));}).toList()])));
 Color _getStatColor(int v){if(v>=120)return Colors.green;if(v>=100)return Colors.blue;if(v>=80)return Colors.orange;return Colors.red;}
}
