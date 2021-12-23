import { Loader } from '@googlemaps/js-api-loader';

const loader = new Loader({
  apiKey: "YOUR_API_KEY",
  version: "weekly",
  libraries: ["places"]
});

const mapOptions = {
  center: {
    lat: 40.749933,
    lng: -73.98633
  },
  zoom: 13,
  mapTypeControl: false
};

// Promise
loader
  .load()
  .then((google) => {
    new google.maps.Map(document.getElementById("map"), mapOptions);
  })
  .catch(e => {
    // do something
  });
  
