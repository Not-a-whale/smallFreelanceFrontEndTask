class UICardDetailSmallCtrl {
  constructor() {

    this.address = {
      "City": "CONSEQUATUR. LABO",
      "AddrId": 766602425,
      "Notes": "Reprehenderit et iste et. Impedit sit illo laudantium corrupti. Quas maxime dolore id odio facilis.",
      "Zip": "16584-9731",
      "Street1": "CUM DOLOR MINIMA HARUM TENETUR ENIM LABORE EA ILLUM.",
      "GpsLat": 7045.03,
      "State": "AK",
      "Country": "United States",
      "GpsLng": 8103.42,
      "Street2": "FACERE EST VOLUPTATIBUS.",
      "Street3": "PERFERENDIS ET BLANDITIIS."
    };
  }

  HasGroup() {
    return this.group != undefined && this.group != '';
  }
  HasAddress() {
    return this.address != undefined && !angular.equals(this.address, {});
  }
  CanChat(){
    return this.chatLink != undefined && !angular.equals(this.chatLink, {});
  }
}

app.component('uiCardDetailSmall', {
  templateUrl: 'modules/ui/card/detail/small/template.html',
  controller: UICardDetailSmallCtrl,
  bindings: {
    name: '<?',
    role: '<?',
    group: '<?',
    phone: '<?',
    email: '<?', //
    address: '<?',
    profileLink: '<?', // url to profile
    chatLink: '<?' // idk what this would be yet
  }
});