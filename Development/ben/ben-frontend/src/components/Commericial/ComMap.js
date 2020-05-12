import React from 'react'
//AIzaSyA5JuARyi-veD6zuy1-JmJ4f2wjbWH--ZM
class ComMap extends React.Component{
    mapInit(){
    var map = new google.maps.Map(
    document.getElementById('map'), {zoom: 4, center: uluru});}

render(){
    return(
        <div>
             <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5JuARyi-veD6zuy1-JmJ4f2wjbWH--ZM&callback=initMap"
  type="text/javascript"></script>
  <div id="map" style={{height: "400px",  /* The height is 400 pixels */
        width: "100%"}}></div>
        </div>
    )
}
}