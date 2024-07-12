<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    
    <link rel="stylesheet" href="css/ur.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"> 

  </head>
  <body onload="getLocation()">
  <form class="form" action="request-service1.jsp" method="post">
    <b style="color: white;">Current Latitude:</b>
    <input class="user-input" type="text" name="lat" id="lat" placeholder="Latitude" readonly>
    <b style="color: white;">Current Longitude:</b>
    <input class="user-input" type="text" name="lon" id="lon" placeholder="Longitude" readonly>
    <input class="btn" type="submit" name="" value="SEARCH NEARY BY">
  </form>

  <script>
    var x = document.getElementById("lat")
    var y = document.getElementById("lon")

    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition)
      } else {
        x.innerHTML = "Geolocation is not supported by this browser."
      }
    }
    
    function showPosition(position) {
      x.value = position.coords.latitude 
      y.value = position.coords.longitude
    }
    </script>
</body>
</html>