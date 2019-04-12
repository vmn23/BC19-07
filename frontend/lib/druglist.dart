  library bc19_07.globals;
  
  import './druginfo.dart';

  List<DrugSimple> allDrugs = [
    DrugSimple(
        drugName: 'Advil',
        imageUrl: 'asdfsadf',
        rating: 4.3,
        tags: ["bleh", "more bleh"],
        reviews: ["This drug sucks horribly, I died when I took it", "This is the best drug"],
        desc: ["This drug includes Acetomenophin", "More desc"],
    ),
    DrugSimple(
        drugName: 'Advil1', imageUrl: 'asdfsadf', rating: 4.1, tags: ["hello"]),
    DrugSimple(
        drugName: 'Advil2', imageUrl: 'asdfsadf', rating: 3.3, tags: ["headache"]),
    DrugSimple(
        drugName: 'Advil3',
        imageUrl: 'asdfsadf',
        rating: 1.3,
        tags: ["alkdjf"]),
    DrugSimple(
        drugName: 'Advil4',
        imageUrl: 'asdfsadf',
        rating: 2.3,
        tags: ["stomach"]),
  ];