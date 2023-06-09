class OnboardingModel {
  final String imageUrl;
  final String header1;
  final String header2;
  final String header3;
  final String header4;
  final String subHeader;
  final String btnText;

  OnboardingModel({
    required this.imageUrl,
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.subHeader,
    required this.btnText,
  });

  static List<OnboardingModel> onBoardingList = [
    OnboardingModel(
        imageUrl:
            'https://images.unsplash.com/photo-1532635211-8ec15f2ce05c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
        header1: 'Awesome',
        header2: 'Local ',
        header3: 'Food',
        header4: '',
        subHeader:
            'Discover delicious food from the amazing restaurants near you',
        btnText: 'Next'),
    OnboardingModel(
      imageUrl:
          'https://images.unsplash.com/photo-1526367790999-0150786686a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80',
      header1: 'Delivered',
      header2: 'At ',
      header3: 'Your ',
      header4: 'Doorstep',
      subHeader:
          'Fresh and delicious local food delivered from the restaurants to your doorstep',
      btnText: 'Next',
    ),
    OnboardingModel(
        imageUrl:
            'https://images.unsplash.com/photo-1556742521-9713bf272865?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
        header1: 'Grab The ',
        header2: 'Best ',
        header3: 'Deal ',
        header4: 'Around',
        subHeader:
            'Grab the best deals and discounts around and save on your every order',
        btnText: 'Get Started'),
  ];
}
