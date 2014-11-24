/**
 * @name Stabilitas Ventures 'Homework'
 * @version version 1
 * @author Mark Delcambre
 * @fileoverview
 * Provides the primary backend for the singlepage mapping webapp.
 * Plots markers and information requested by ajax on a google map
 */

var markerCluster;
var infowindow;
var clusterWindow;
var map;
var markers = [];
var reportIcons = {};

// Initialize the map and make the ajax request.
function init() {
  // Initialize viewing most of the world
  // set tilt to 0, because tilt is terrible.
  var mapOptions = {
    center: new google.maps.LatLng(21.6,-23),
    streetViewControl: false,
    zoom: 3,
    mapTypeId: google.maps.MapTypeId.ROAD,
  };
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  map.setTilt(0);

  //Make the AJAX request for the json alert file. Using a proxy to avoid
  //cross domain requests.
  $.ajax({
    url: 'proxy.php', // I admit I couldn't for the life of me to get jsonp to work.
    // Was attempting to use jsonp and other methods, was unable to succesfully get
    // the s3 bucket to execute the callback function for jsonp. Am not sure if this
    // was my incorrect implementation or that jsonp/CORS is not implemented within
    // the bucket.
    type:"GET",
    dataType: 'json',
    success: PlotPoints,
    error: function (data, Errtext, ErrThrown) {
      console.log(ErrThrown);
      console.log(data);
    }
  });
}


// Itterate through the list of events returned by the json request.
// Applies Marker Clusterer to the markers generated.
function PlotPoints (points) {

  markers = [];
  points.forEach(PlotMarker);

  var clusterOptions = {
    maxZoom: 14,
    gridSize: 35,
    ignoreHidden: true,
  };

  PopulateFilter();
  markerCluster = new MarkerClusterer(map, markers, clusterOptions);
  google.maps.event.addListener(markerCluster, "mouseover", ClusterInfoWindow);
  google.maps.event.addListener(markerCluster, "mouseout", function(cluster) {
    document.getElementById('clusterInfo').style.display = 'none';
  });
  google.maps.event.addListener(markerCluster, "click", function(cluster) {
    document.getElementById('clusterInfo').style.display = 'none';
  });
  ZoomWorld();
}


// Plots the actual marker with the appropriate icon and infowindow
function PlotMarker (markerData) {

  markerData.report_type = encodeURI(markerData.report_type);
  markerData.location.n = encodeURI(markerData.location.n);
  markerData.location.t = encodeURI(markerData.location.t);
  markerData.notes = encodeURI(markerData.notes);

  var icon = GetIcon(markerData.report_type);
  var latLng = new google.maps.LatLng(markerData.location.t, markerData.location.n);
  var markerOptions = {
    position: latLng,
    title: markerData.report_type,
    icon: icon
  };

  var infoContent ='<div id="infoWindown" align="center">'+
    '<h3 id="firstHeading" class="firstHeading">'+ markerData.report_type +'</h3>'+
    '<div id="bodyContent">'+
    '<p><b>'+markerData.report_type+'</b> reported at the following coordinates:<br/>'+
    markerData.location.t + ', ' + markerData.location.n + '</p>'+
    '<p><a href="' + markerData.notes +'">Additional Information</a></p></div></div>';

  // plot the marker with the information above
  var marker = new google.maps.Marker(markerOptions);
  // Adds clickevent to each marker that closes the other infowindows and opens one
  // for the clicked marker
  google.maps.event.addListener(marker, "click", function() {
      if (infowindow) infowindow.close();
      infowindow = new google.maps.InfoWindow({content: infoContent});
      infowindow.open(map, marker);
  });

  // Keeps track of all markers to be handed to MarkerClusterer
  markers.push(marker);
}


// Checks if the icon exists based on report type.
// otherwise return the default
function GetIcon(reportType) {
  if (reportIcons[reportType]) return reportIcons[reportType];

  var url = 'icons/' + reportType + '.png';
  var http = new XMLHttpRequest();
  http.open('HEAD', url, false);
  http.send();

  if (http.status === 200) {
    reportIcons[reportType] = url;
    return url;
  }
  reportIcons[reportType] = 'icons.default.png';
  return 'icons/default.png'
}

function ZoomWorld() {
  markerCluster.fitMapToMarkers();
  markerCluster.repaint(); // occasional issue with failure to redraw
}

function PopulateFilter() {
  var content = '<form name="form1" action=""><strong>Legend / Toggles</strong><br />\n';
  Object.keys(reportIcons).sort().forEach(function(reportType){
    content += '<img style="width:32px;height:37px;vertical-align:middle" src="';
    content += reportIcons[reportType] + '" alt="'+ reportType +'"/>\n';
    content += '<input type="checkbox" name="' + reportType +'" id="' + reportType;
    content += '" onclick="Markers(\''+reportType+'\')" checked="checked" /> '+reportType+'<br />\n';
  });
  content += '</form>'
  document.getElementById('filter').innerHTML = content;
}

function Markers(reportType){
  var newValue = document.getElementById(reportType).checked;
  if (infowindow) infowindow.close();
  for (var i=0;i<markers.length;i++) {
    if (markers[i].title==reportType)  {
      markers[i].setVisible(newValue);
    }
  }
  markerCluster.repaint();
}

function ClusterInfoWindow(cluster) {
  var typeCounts = {};
  cluster.markers_.forEach(function(marker){
    if (!typeCounts[marker.title]) typeCounts[marker.title] = 0;
    typeCounts[marker.title] += 1;
  });
  var content = '<strong>Cluster Info</strong><br />';
  Object.keys(typeCounts).sort().forEach(function(reportType) {
    content += '<img style="width:32px;height:37px;vertical-align:middle" src="';
    content += reportIcons[reportType] + '" alt="'+ reportType +'"/>\n';
    content += ' ' + reportType + ':  '+ typeCounts[reportType] + '<br />\n';
  });
  document.getElementById('clusterInfo').innerHTML = content;
  document.getElementById('clusterInfo').style.display = 'block';
}




google.maps.event.addDomListener(window, 'load', init);
