
function updateMap(map, center){
    fetch('/update_events/?lat=' + center.lat.toString() + '&lng=' + center.lng.toString() )
      .then(res => res.json())
      .then(response => {

        markers.forEach((marker)=>{
          marker.setMap(null)
        })

        var icon = {
          url: "https://cdn.rawgit.com/micaelsbno/wot_app/017bf8aa/app/assets/images/marker.svg",
          anchor: new google.maps.Point(25,50),
          scaledSize: new google.maps.Size(30,30)
        }

        markers = []
        infoWindows = []
        contents = []
        markerClusters = []

        response.forEach((picture, idx)=>{

          var position = {lat: picture.place.latitude , lng: picture.place.longitude}

          var time = new Date(picture.time.start_time)
          contents.push(
            "\
            <div id='content' class='content'>" + 
            "<div style=\"background-image: url('" + picture.event.image_url + "')\" class='map-image'></div> \
            <h3 class='info-window__title'>" + picture.event.name + "</h3> \
            <div class='info-window__place-row'> \
              <h4 class='info-window__place'>" + picture.place.name + "</h4> \
              <h4 class='info-window__time'>" + time.toDateString() + '(' + time.getHours() + ':' + time.getMinutes() + '' + time.getSeconds() + " h)</h4> \
            </div> \
            <p class='info-window__place>" + picture.place.name + "</p></div> \
            <p class='info-window__small'>" + picture.event.description.substr(0, 100) + "...</p> \
            <a class='info-window__link' href='/events/" + picture.event.id + "'> More info </a> \
            ")

          infoWindows.push(
              new google.maps.InfoWindow({
              content: contents[idx]
            })
          )

          markers.push(
            new google.maps.Marker({
            position: position,
            map: map,
            icon: icon,
            title: picture.event.name,
            place: picture.place.name
            })
          )

          markers[idx].addListener('click', function() {  
            infoWindows[idx].open(map, markers[idx])
            
          })

        })

        markerClusters.push(
          new MarkerClusterer(map, markers,{imagePath: 'https://raw.githubusercontent.com/micaelsbno/outdoor_museum/master/app/assets/images/clusterers/m'})
        )
      }
    )
}