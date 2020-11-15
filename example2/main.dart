import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'greeklish_generator.dart';

void main() {
	print('Input the file you want to convert:', end=' ')
	var path = input();
	new File(path)
		.openRead()
		.transform(utf8.decoder)
		.transform(new LineSplitter())
		.forEach((l) => print(GreeklishGenerator.generate(l)));
}
