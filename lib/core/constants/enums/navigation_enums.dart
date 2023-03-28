enum NavigationEnums {
  onBoardView('/'),
  singUpView('/signUpView'),
  loginView('/loginView'),
  homeView('/homeView');

  final String routeName;
  const NavigationEnums(this.routeName);
}
