class RendomData {
  final String gender;
  final String title;
  final String first;
  final String last;
  final String city;
  final String country;
  final int age;
  final String image;
  final String email;

  RendomData({
    required this.gender,
    required this.title,
    required this.first,
    required this.last,
    required this.city,
    required this.country,
    required this.age,
    required this.image,
    required this.email,
  });

  factory RendomData.fromMap ({required Map data}){
    return RendomData(
      email: data['results'][0]['email'],
      gender: data['results'][0]['gender'],
      title: data['results'][0]['name']['title'],
      first: data['results'][0]['name']['first'],
      last: data['results'][0]['name']['last'],
      city: data['results'][0]['location']['city'],
      country: data['results'][0]['location']['country'],
      age: data['results'][0]['dob']['age'],
      image: data["results"][0]["picture"]["large"],
    );
  }
}