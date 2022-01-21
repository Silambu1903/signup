class ItemCheck {
  String? name = '';
  bool? isChecked = false;

  ItemCheck(this.name, this.isChecked);
}

List<ItemCheck> occupationType = [
  ItemCheck('Salaried', false),
  ItemCheck('Self Employed', false),
  ItemCheck('Retired', false),
  ItemCheck('Student', false),
  ItemCheck('House Wife', false),
  ItemCheck('Others', false),
];

List<ItemCheck> salaried = [
  ItemCheck('Proprietorship', false),
  ItemCheck('Partnership', false),
  ItemCheck('Pvt Ltd', false),
  ItemCheck('Public Ltd', false),
  ItemCheck('Public Sector', false),
  ItemCheck('Government', false),
  ItemCheck('Multinational', false),
  ItemCheck('Others', false),
];

List<ItemCheck> selfEmployed = [
  ItemCheck('Business', false),
  ItemCheck('Profession', false),
];

List<ItemCheck> business = [
  ItemCheck('Manufacturing', false),
  ItemCheck('Trading', false),
  ItemCheck('Services', false),
  ItemCheck('Retailing', false),
  ItemCheck('Agriculture', false),
  ItemCheck('Stock Broker', false),
  ItemCheck('Real Estate', false),
  ItemCheck('Others', false),
];

List<ItemCheck> profession = [
  ItemCheck('Doctor', false),
  ItemCheck('CA/CS', false),
  ItemCheck('Lawyer', false),
  ItemCheck('Architect', false),
  ItemCheck('Consultant', false),
  ItemCheck('Engineer', false),
  ItemCheck('Others', false),
];

List<ItemCheck> sourceOfFunds = [
  ItemCheck('Salaried', false),
  ItemCheck('Business Income', false),
  ItemCheck('Agriculture', false),
  ItemCheck('Investment', false),
  ItemCheck('Inheritance', false),
  ItemCheck('Rent', false),
  ItemCheck('Pension', false),
  ItemCheck('Funds From Family Members', false),
  ItemCheck('Others', false),
];
