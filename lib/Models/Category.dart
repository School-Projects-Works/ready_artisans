class Categories{
  final String? name;
  final String? image;
  final String? description;

  Categories({this.name, this.image, this.description});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    name: json['name'],
    image: json['image'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'description': description,
  };

 static List<Categories>dummyData=[
    Categories(
      name: 'Building & Construction',
      image: 'https://majuba.edu.za/wp-content/uploads/2018/12/majuba-civil-4.jpg',
      description: 'Any building or construction related services',
    ),
   Categories(
     name: 'Cleaning & Laundry',
     image: 'https://cf.ltkcdn.net/cleaning/images/std/257114-800x515r1-how-properly-do-laundry.webp',
      description: 'Any cleaning or laundry related services',
   ),
   Categories(
     name: 'Electrical & Electronics',
     image: 'https://www.iit.edu.ng/storage/Pictures%20/Programmes/Electrotechncis%201.png',
      description: 'Any electrical or electronics related services',
   ),
   Categories(
     name: 'Mechanics & Auto',
     image: 'https://res.cloudinary.com/hkf2ycaep/image/fetch/d_project-placeholder.png,f_auto,fl_lossy/https://d23vk1trp0fmbf.cloudfront.net/projects/44b55e8a-e7c8-404c-be4e-caf1c97c5d5b/project-image',
      description: 'Any mechanics or auto related services',
   ),
   Categories(
     name: 'Plumbing & Water',
     image: 'https://media.istockphoto.com/id/665043432/photo/plumber-repairing-a-sink.jpg?s=612x612&w=0&k=20&c=rRfckKtMkg8Xn49oUPOzdafqC8r9ObOfelstMbjgsfQ=',
      description: 'Any plumbing or water related services',
   ),
   Categories(
     name: 'Woodwork & Carpentry',
      image: 'https://www.familyhandyman.com/wp-content/uploads/2022/10/GettyImages-1391067760.jpg?resize=700,467',
        description: 'Any woodwork or carpentry related services',
   ),
   Categories(
     name: 'Painting & Decoration',
     image: 'https://tradesmencosts.co.uk/wp-content/uploads/2020/05/painter-decorator-working.jpg',
      description: 'Any painting or decoration related services',
   ),
    Categories(
      name: 'Gardening & Landscaping',
      image: 'https://www.neponset.org/wp-content/uploads/2019/01/black-man-garden_landscape-1024x683.jpg',
        description: 'Any gardening or landscaping related services',
    ),
    Categories(
      name: 'Furniture & Fixtures',
      image: 'https://www.ghanaskills.org/sites/default/files/inline-images/Rwanda-DED-Dirk-Gebhardt-147%20Furniture%20Work.jpg',
        description: 'Any furniture or fixtures related services',
    ),
   Categories(
     name: 'Fashion & Beauty',
     image: 'https://ghanainsider.com/wp-content/uploads/2020/04/1578510803_maxresdefault.webp',
      description: 'Any fashion or beauty related services',
   ),

 ];
}