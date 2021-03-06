$(document).ready(function() {

  var map;
  var position;
  var markersArray = [];
  // var url = "https://salty-fortress-4270.herokuapp.com/cities"
  var url = "/cities/";

  function initialize() {
    var mapOptions = {
      center: {
        lat: 41.8369,
        lng: -87.6847
      },
      zoom: 12
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  };


  function marker(map, pos, name, main) {
    var contentString = '<div id="content">' +
      '<p id="firstHeading">' + name + '</p>' + '</div>'
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    var marker = new google.maps.Marker({
      position: pos,
      map: map
    });
    markersArray.push(marker);

    google.maps.event.addListener(marker, 'mouseover', function() {
      infowindow.open(map, marker)
    });

    if (main === "main") {
      infowindow.open(map, marker)
    }
    map.panTo(pos);
  }

  function removeMarkers() {
    while (markersArray[0]) {
      markersArray.pop().setMap(null);
    }
  };

  google.maps.event.addDomListener(window, 'load', initialize);

  //Gets the list of cities from database
  $.ajax({
    type: 'GET',
    url: url
  }).done(function(response) {
    response.forEach(function(city) {
      var cityHeader = "<option value ='" + city.id + "'>" + city.name + "</option>"
      $("#cities_dropdown").append(cityHeader)
    });
  });

  //if user clicks catergories btn without selecting a city
  $(".categories_button").on('click', function(e) {
    if ($("#cities_dropdown").val() === "0") {
      alert("Please select a city!")
    }
  });

  function sortAttraction(response, category) {
    const categoryName = category.charAt(0).toUpperCase();
    var attractionsContent="";
    response.forEach(function(attraction) {
      if (attraction.category.includes(category)) {
        var attractions = attractionTemplate(attraction);
        attractionsContent += attractions;
      };
      return;
    });
    return attractionsContent;
  }

  function attractionTemplate(attraction){
    position = new google.maps.LatLng(attraction.latitude, attraction.longitude);
    marker(map, position, attraction.name, "none");
    var avgReview = attraction.reviews_average || "Write the first review";
    return ("<div class='attraction_wrapper'  data-id = '" +
      attraction.id + "' ><div class='row'><div class='col-md-7 eachAttrHeader'><a href='#' >"
      + attraction.name + "</a></div><div class='col-md-4 eachAttrRating'> Rating: "
      + avgReview + "</div></div></div><div class='attraction_description ' data-id='"
      + attraction.id + "' >" + attraction.description
      + "</br><form class='post mtop1 mbottom1'><textarea rows='4' class='form-control comments' data-val='"
      + attraction.id + "' value='' placeholder='Enter your review'></textarea>Ratings:<input type='text' class='rating' data-val='"
      + attraction.id + "' value=''>/5<button type='button' class='btn btn-primary post_submit' data-attraction = '"
      + attraction.id + "'>submit</button></form><button type='button' class='btn btn-primary text-center get_comments' id='show_reviews_button' data-attrid='"
      + attraction.id + "'>Show Reviews</button><div class =' show_reviews' id='show_reviews_" + attraction.id + "'></div></div></div>"
    )      
  }

  //select the city from the dropdown
  $("#cities_dropdown").on("change", function(e) {
    var cityId = $(this).val();
    $("#categoryResults").hide();
    $("#attractions_radius").hide();
    //To store the response from request to get all tourist attractions from the city
    //Instead of making multiple calls, the attractions can be filtered in the frontend
    var allAttractions;
    //get the selected city details
    $.ajax({
      type: 'GET',
      url: url + cityId
    }).done(function(city) {
      $(".selected_city").attr('id', city.id)
      var cityContent = "<h3><b>" + city.name + ", " + city.state + ", " + city.country + "</b>" + "</h3></br><h5>" + city.description + "</p>"
      $("#city_description").html(cityContent)
    });
    //get all the attractions for the selected city in the attractions dropdown
    $.ajax({
      type: 'GET',
      url: url + cityId + "/tourist_attractions"
    }).done(function(response) {
      var attractionDropdown = "<option value=0 >Select your attraction</option>"
      response.forEach(function(attraction) {
        var attractionHeader = "<option value ='" + attraction.id + "'>" + attraction.name + "</option>"
        attractionDropdown += attractionHeader;
      });
      $("#attractions_dropdown").html(attractionDropdown)
    });

    $.ajax({
      type: 'GET',
      url: url + cityId + "/tourist_attractions"
    }).done(function(response) {
      allAttractions = response;
      console.log('inside')
      $("#categoryResults").show();
      var attractionsContent = "<h3>All attractions</h3>";
      removeMarkers();
      response.forEach(function(response){
       const attraction = attractionTemplate(response);
        return attractionsContent += attraction;
      })
      $("#categoryResults").html(attractionsContent);
      showCityDescription();
      attachHandlerSubmitReview();
      $(".attraction_description").hide();
      attachHandlerGetReviews();
    });

    //get attractions for chosen category
    $(".categories_button").on("click", function(e) {
      var categoryName = ($(this)).attr('id');
      var categoryType = $($(this)).data('type');
      $("#categoryResults").show();
      var attractionsContent = "<h3>" + categoryType + "</h3>";
      removeMarkers();
      attractionsContent = attractionsContent + sortAttraction(allAttractions, categoryName);
      $("#categoryResults").html(attractionsContent);
      showCityDescription();
      attachHandlerSubmitReview();
      $(".attraction_description").hide();
      attachHandlerGetReviews();
    });
  
    //to find the attractions in a particular radius
    $("#get_radius_attractions").on("click", function(e) {
      var radius_search = $("#radius").val();
      // var attractionsId = $(this).val();
      var attractionsId = $("#attractions_dropdown :selected").val();
      console.log(url + attractionsId + "/" + radius_search);
      if(attractionsId ) {
        console.log(attractionsId);
      }
      $.ajax({
        type: 'GET',
        url: url + "tourist_attractions/nearby_attractions/" + attractionsId + "/" + radius_search
      }).done(function(response) {
        var attractionsContent = "<h3>Radius search result</h3>";;
        removeMarkers();
        $("#categoryResults").show();
        response.forEach(function(attraction) {
          var avgReview = attraction.reviews_average || "no reviews yet";
          if (attraction.id.toString() !== attractionsId) {
            var attractions = attractionTemplate(attraction);
            attractionsContent += attractions;
          } else {
            position = new google.maps.LatLng(attraction.latitude, attraction.longitude);
            marker(map, position, attraction.name, "main");
          }
        });
        $("#categoryResults").html(attractionsContent);
        showCityDescription();
        attachHandlerSubmitReview();
        $(".attraction_description").hide();
        attachHandlerGetReviews();
      });
    });
  });

  /// attaches click handler to the submit review button
  function attachHandlerSubmitReview() {
    $(".post_submit").on("click", function(e) {
      var attractionIdReview = $($(this)).data('attraction');
      var rating = $(".rating[data-val='" + attractionIdReview + "']").val();
      if (rating <= 5 && localStorage.userId) {
        var review = {
          comments: $(".comments[data-val='" + attractionIdReview + "']").val(),
          rating: $(".rating[data-val='" + attractionIdReview + "']").val(),
          tourist_attraction_id: attractionIdReview,
          user_id: localStorage.userId
        };
        //make an ajax request to submit the review
        $.ajax({
          type: 'POST',
          url: "https://salty-fortress-4270.herokuapp.com/reviews/" + attractionIdReview,
          header: localStorage.token,
          data: {
            review: review
          }
        }).done(function() {
          alert("success!");
        }).fail(function() {
          alert("please login");
        });
      } else {
        if (rating <= 5) {
          alert("Please log in");
        } else {
          alert("Enter a valid rating between 1 to 5"); 
        }
      };
    });
  };

  function attachHandlerGetReviews() {
    $('.get_comments').on('click', function(e) {
      var touristAttrId = $($(this)).data('attrid');
      $.ajax({
        type: 'GET',
        url: "https://salty-fortress-4270.herokuapp.com/tourist_attractions/" + touristAttrId
      }).done(function(response) {
        var reviews = '';
        response.forEach(function(review) {
          var attrReview = "<div id ='each_review'><div class='row'> <div class='col-md-2'>" +
            review.user_name + ":</div> <div class='col-md-6'>'" + review.comments + "'</div><div class='col-md- 3'> Avg rating:" + review.rating + "/5</div></div></div>"
          reviews += attrReview;
        })
        $('#show_reviews_' + touristAttrId).html(reviews);
      });

    });
  };

  //attach onclick handler to show attraction description div which was added when categories button was clicked.
  function showCityDescription() {
    $(".attraction_wrapper").on("click", function() {
      var attraction_id = $(this).data('id');
      $('.attraction_description[data-id="' + attraction_id + '"]').toggle();
      return false;
    });
  };

  $('#get-token').on('click', function() {
    $.ajax('https://salty-fortress-4270.herokuapp.com/login', {
      contentType: 'application/json',
      processData: false,
      data: JSON.stringify({
        credentials: {
          email: $('#email').val(),
          password: $('#password').val()
        }
      }),
      dataType: "json",
      method: "POST"
    }).done(function(data, textStatus) {
      localStorage.setItem('token', data.token);
      localStorage.setItem('userId', data.id);
      localStorage.setItem('name', data.name);

      var name = "Welcome " + data['name'];
      alert(name);
      userSuccess(name);
      // $(".user_login").hide();

      // $("#welcome").html(name);
      hideOnCloseBtn();
      //console.log(data);
    }).fail(function(jqxhr, textStatus, errorThrown) {
      alert("User name and password does not match!");

      //console.log(textStatus);
      //console.log(errorThrown);
    });
  });

  function userSuccess(name) {
    var addLogout = "<div class='row'><div class='welcomeMsg'>" + name + "</div><button type='button' class='btn btn-info btn-md' id='logout'>Logout</button></div>"
    $(".loggedIn").html(addLogout);
    attachHandlerLogout();
  }
  //attachies handler and action to logout button
  function attachHandlerLogout() {
    $("#logout").on("click", function() {
      localStorage.removeItem('token');
      localStorage.removeItem('userId');
      localStorage.removeItem('name');
      $(".user_login").show();
      $(".loggedIn").html("");
    })

  }
  //for the login/register modal on clicking "close" if the user has been logged in do this.
  function hideOnCloseBtn() {
    $(".closebtn").on('click', function() {
      $(".user_login").hide();
    })
  }


  $('#post-token').on('click', function() {
    $.ajax({
      url: 'https://salty-fortress-4270.herokuapp.com/register',
      contentType: 'application/json',
      processData: false,
      data: JSON.stringify({
        credentials: {
          email: $('#register_email').val(),
          password: $('#register_password').val(),
          name: $("#name").val()
        }
      }),
      dataType: "json",
      method: "POST"
    }).done(function(data, textStatus, name) {
      localStorage.setItem('token', data.token);
      localStorage.setItem('userId', data.id);
      localStorage.setItem('name', data.name);
      var name = "Welcome " + data['name'];
      alert(name);
      userSuccess(name);
      // $(".user_login").hide();

      // $("#welcome").html(name);
      hideOnCloseBtn();
      console.log(data);
    }).fail(function(jqxhr, textStatus, errorThrown) {
      console.log(textStatus);
      console.log(errorThrown);
      alert(jqxhr.responseText);
    });
  });
  //To hide and show the login and register fields
  // $("#login_button").on("click", function() {
  //   $('.register').hide();
  //   $(".login_user").toggle();
  // });

  // $("#register_button").on("click", function() {
  //   $('.login_user').hide();
  //   $(".register").toggle()
  // });
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
});
