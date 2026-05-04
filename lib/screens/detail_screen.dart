import 'package:flutter/material.dart';
import '../models/pokemon.dart';
class DetailScreen extends StatelessWidget{
 final Pokemon pokemon;
 const DetailScreen({super.key,required this.pokemon});
 @override Widget build(BuildContext c){
   final p=pokemon;
   return Scaffold(
    appBar:AppBar(title:Text(p.name),backgroundColor:Colors.red[700]),
    body:SingleChildScrollView(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Center(child:Container(padding:const EdgeInsets.all(16),decoration:BoxDecoration(color:Colors.grey[100],borderRadius:BorderRadius.circular(12)),child:Image.asset(p.assetPath,width:120,height:120,fit:BoxFit.contain,errorBuilder:(c,e,s)=>Text(p.emoji,style:const TextStyle(fontSize:80),),),),),
      const SizedBox(height:20),
      _s('Informasi Dasar',[_i('Nama',p.name),_i('Tipe',p.type),_i('ID','#${p.id}')]),
      const SizedBox(height:16),
      _s('Ability & Weakness',[_i('Ability',p.ability),_i('Weakness',p.weakness)]),
      const SizedBox(height:16),
      _stats(),
      const SizedBox(height:16),
      _s('Deskripsi',[Text(p.description,style:const TextStyle(fontSize:14,height:1.6))]),
      const SizedBox(height:16),
      _s('Role dalam Tim',[Text(p.role,style:const TextStyle(fontSize:14,fontWeight:FontWeight.w500))]),
      const SizedBox(height:16),
      if(p.evolution.isNotEmpty && !(p.evolution.toLowerCase().contains('final') && p.name!='Charizard'))_s('Evolusi',[_i('Evolusi',p.evolution)]),
      const SizedBox(height:16),
      _s('Partner Cocok',[Wrap(spacing:8,runSpacing:8,children:[...p.partners.map((x)=>Chip(label:Text(x),backgroundColor:Colors.blue[100]))],)]),
    ]),),
   );
 }
 Widget _s(String t,List<Widget> children)=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t,style:const TextStyle(fontSize:16,fontWeight:FontWeight.bold)),const SizedBox(height:8),...children]);
 Widget _i(String k,String v)=>Padding(padding:const EdgeInsets.symmetric(vertical:4),child:Row(crossAxisAlignment:CrossAxisAlignment.start,children:[SizedBox(width:100,child:Text(k,style:const TextStyle(fontWeight:FontWeight.w500))),Expanded(child:Text(v))]));
 Widget _stats()=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('Stats',style:TextStyle(fontSize:16,fontWeight:FontWeight.bold)),const SizedBox(height:8),...pokemon.stats.entries.map((e)=>Padding(padding:const EdgeInsets.symmetric(vertical:4),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text(e.key),Text(e.value.toString(),style:const TextStyle(fontWeight:FontWeight.bold))],)))]);
}
