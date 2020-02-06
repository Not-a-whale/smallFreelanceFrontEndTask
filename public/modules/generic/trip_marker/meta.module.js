class TripStatusMarkerCtrl {
  constructor() {
    this.status = 'NA';
    this.class = 'primary';
    this.statusText = 'status unknown'
    this.icon = ''

    this.statuses = {
      'en route': {
        icon: 'circle-arrow-left',
        class: 'primary'
      },
      'pick: check in': {
        icon: 'pick-outline',
        class: 'primary'
      },
      'pick: check out': {
        icon: 'pick-solid',
        class: 'primary'
      },
      'drop: check in': {
        icon: 'drop-outline',
        class: 'primary'
      },
      'drop: check out': {
        icon: 'drop-solid',
        class: 'primary'
      },
      'delayed': {
        icon: 'circle-exclamation',
        class: 'warn'
      },
      'delivered': {
        icon: 'circle-checkmark',
        class: 'success'
      },
      'empty': {
        icon: 'circle-solid',
        class: 'empty'
      }
    }
  }

  SetClass() {
    if (this.status in this.statuses) {
      let status = this.statuses[this.status];
      this.class = status.class;
    } else {
      this.status = 'unknown';
      this.class = 'warn';
    }
  }

  $onInit() {
    this.SetClass();
  }
}

app.component('tripStatusMarker', {
  templateUrl: 'modules/generic/trip_marker/meta.template.html',
  controller: TripStatusMarkerCtrl,
  bindings: {
    status: '<?'
  }
});