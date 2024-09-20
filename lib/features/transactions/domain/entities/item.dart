import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  const Item({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}
