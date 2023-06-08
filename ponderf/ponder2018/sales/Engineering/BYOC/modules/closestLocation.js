// convert degrees to radians
const deg2Rad = deg  => deg * Math.PI / 180;

const distanceAtZoom = {
  "0" : 30,
  "1": 30,
  "2" : 30,
  "3" : 30,
  "4" : 30,
  "5" : 25,
  "6" : 10,
  "7" : 10,
  "8" : 5,
  "9" : 2,
  "10" : 1.5,
  "11" : 1,
  "12" : 0.5,
  "13" : 0.2,
  "14" : 0.1,
  "15" : 0.1,
  "16" : 0.1,
  "17" : 0.1,
  "18" : 0.1,
  "19" : 0.1,
  "20" : 0.1
}
  
  
  const getDistanceBetween = ( lat1, lon1, lat2, lon2 ) => {
    const lat1Radians = deg2Rad(lat1);
    const lat2Radians = deg2Rad(lat2);
    const lon1Radians = deg2Rad(lon1);
    const lon2Radians = deg2Rad(lon2);
    const R = 6371; // earth's mean radius in kms
    const x = (lon2Radians-lon1Radians) * Math.cos((lat1Radians+lat2Radians)/2);
    const y = (lat2Radians-lat1Radians);
    const d = Math.sqrt(x*x + y*y) * R;
    return d;
  }
  
  const closest = (zoom, latitude, longitude, locations) => {

    let minimumDif=distanceAtZoom[zoom];
    let closestIndex;
    for (let index = 0; index < locations.length; index += 1) {
        const latlng = locations[ index ].latlng;
      const dif =  getDistanceBetween(latitude, longitude, latlng[ 0 ], latlng[ 1 ]);
      if ( dif < minimumDif ) {
        closestIndex=index;
        minimumDif = dif;
      }
    }
    // return the nearest location
    const closestLocation = (locations[ closestIndex ]);
    return closestLocation;
  }

  const closestByRadius = (latitude, longitude, radius, locations) => {

    let closestIndex;
    const closestLocations = [];
  
    for (let index = 0; index < locations.length; index += 1) {
        const latlng = locations[ index ].latlng;
      const dif =  getDistanceBetween(latitude, longitude, latlng[ 0 ], latlng[ 1 ]);
      if ( dif <= radius ) {
        closestLocations.push(locations[ index ]);
      }
    }
    return closestLocations;
  }

export { closest, closestByRadius };