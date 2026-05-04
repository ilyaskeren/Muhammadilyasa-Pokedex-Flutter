import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget{
 const MyApp({super.key});
 @override Widget build(BuildContext c)=>MaterialApp(
    title:'Muhammad Ilyasa - 9D | Pokémon Dex',
    debugShowCheckedModeBanner:false,
    theme:ThemeData(useMaterial3:true,colorScheme:ColorScheme.fromSeed(seedColor:Colors.red)),
    home:const HomeScreen(),
 );
}
