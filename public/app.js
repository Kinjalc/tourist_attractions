$(document).ready(function() {
  $('.login_user').hide();
  $('.register').hide();
  var name = "welcome " + localStorage.name;
  $("#welcome").html(name);


  $.ajax({
    type: 'GET',
    url: "https://salty-fortress-4270.herokuapp.com/cities"
  }).done(function(response) {
    response.forEach(function(city) {
      var cityHeader = "<option value ='" + city.id + "'>" + city.name + "</option>"
      $("#cities_dropdown").append(cityHeader)
    });
  });

  $("#cities_dropdown").on("change", function(e) {
    var cityId = $(this).val();
    $("#categoryResults").hide();
    $("#attractions_radius").hide();
    var cityId = $(this).val();
    $.ajax({
      type: 'GET',
      url: "https://salty-fortress-4270.herokuapp.com/cities/" + cityId
    }).done(function(city) {
      $(".selected_city").attr('id', city.id)
      var cityContent = "<h3><b>" + city.name + ", " + city.state + ", " + city.country + "</b>" + "</h3></br><h5>" + city.description + "</p>"
      $("#city_description").html(cityContent)
    });
    $.ajax({
      type: 'GET',
      url: "https://salty-fortress-4270.herokuapp.com/cities/" + cityId + "/tourist_attractions"
    }).done(function(response) {
      response.forEach(function(attraction) {
        var attractionDropdown = "<option value=0 >Select your city</option>"
        response.forEach(function(attraction) {
          var attractionHeader = "<option value ='" + attraction.id + "'>" + attraction.name + "</option>"
          attractionDropdown += attractionHeader;
        });
        $("#attractions_dropdown").html(attractionDropdown)
      });
    });
    $(".categories_button").on("click", function(e) {
      $("#categoryResults").show();
      var cityId = $(".selected_city").attr('id');
      var categoryName = ($(this)).attr('id');
      $.ajax({
        type: 'GET',
        url: "https://salty-fortress-4270.herokuapp.com/cities/" + cityId + "/tourist_attractions"
      }).done(function(response) {
        if (categoryName === "get_all") {
          var attractionsContent = "<h4>All tourist attractions</h4>";
          response.forEach(function(attraction) {
            var attractions = "<div class='container'><div class='attraction_wrapper' data-id = '" + attraction.id + "' ><h5><b>" + attraction.name + "</b></h5></div><div class='attraction_description' data-id='" + attraction.id + "' >" + attraction.description + "</br><form class='post mtop1 mbottom1'><input type='text' class='comments'data-val='" + attraction.id + "' value='' placeholder='put your comments here'>ratings:<input type='text' class='rating' data-val='" + attraction.id + "' value=''>/5<button type='button' class='post_submit' data-attraction = '" + attraction.id + "'>submit</button></form><button type='button' class='get_comments' data-attrid='" + attraction.id + "'>Show Reviews</button><div class ='show_reviews' id='show_reviews_" + attraction.id + "'></div></div></div>"
            attractionsContent += attractions;
          });
        } else {
          var attractionsContent = "<h4>" + categoryName + "</h4>";
          response.forEach(function(attraction) {
            if (attraction.category.includes(categoryName)) {
              var attractions = "<div class='container'><div class='attraction_wrapper' data-id = '" + attraction.id + "' ><h5><b>" + attraction.name + "</b></h5></div><div class='attraction_description' data-id='" + attraction.id + "' >" + attraction.description + "</br><form class='post mtop1 mbottom1'><input type='text' class='comments'data-val='" + attraction.id + "' value='' placeholder='put your comments here'>ratings:<input type='text' class='rating' data-val='" + attraction.id + "' value=''>/5<button type='button' class='post_submit' data-attraction = '" + attraction.id + "'>submit</button></form><button type='button' class='get_comments' data-attrid='" + attraction.id + "'>Show Reviews</button><div class ='show_reviews' id='show_reviews_" + attraction.id + "'></div></div></div>"
              attractionsContent += attractions;
            };
          });
        };
        $("#categoryResults").html(attractionsContent);
        showCityDescription();
        attachHandlerSubmitReview();
        $(".attraction_description").hide();
        attachHandlerGetReviews();
      });
    });
    $("#attractions_dropdown").on("change", function(e) {
      var attractionsId = $(this).val();
      $.ajax({
        type: 'GET',
        url: "https://salty-fortress-4270.herokuapp.com/cities/tourist_attractions/nearby_attractions/" + attractionsId
      }).done(function(response) {
        $("#attractions_radius").show();
        $("#attractions_radius").html('');
        response.filter(function(attr) {
          return attr.id.toString() !== attractionsId;
        }).forEach(function(attraction) {
          var attractionRadius = "<h5><b>" + attraction.name + "</b></h5>"
          $("#attractions_radius").append(attractionRadius)
        });
      });
    });
  });




  function attachHandlerSubmitReview() {
    $(".post_submit").on("click", function(e) {
      var attractionIdReview = $($(this)).data('attraction');
      var rating = $(".rating[data-val='" + attractionIdReview + "']").val();
      if (rating <= 5) {
        var review = {
          comments: $(".comments[data-val='" + attractionIdReview + "']").val(),
          rating: $(".rating[data-val='" + attractionIdReview + "']").val(),
          tourist_attraction_id: attractionIdReview,
          user_id: localStorage.userId
        };
        //make an ajax request
        $.ajax({
          type: 'POST',
          url: "http://localhost:3000/reviews/" + attractionIdReview,
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
        alert("please enter a valid rating from 0 to 5")
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
          var attrReview = "<div id ='each_review'><p>" +
            review.user_name + ":'" + review.comments + "'  rating:" + review.rating + "</p></div>"
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

      var name = "welcome " + data['name'];
      $("#welcome").html(name);
      console.log(data);
    }).fail(function(jqxhr, textStatus, errorThrown) {
      alert("login failed!")
      $("#welcome").html(data.textStatus);
      console.log(textStatus);
      console.log(errorThrown);
    });
  });


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
      var name = "welcome " + data['name'];
      $("#welcome").html(name);
    }).fail(function(jqxhr, textStatus, errorThrown) {
      console.log(textStatus);
      console.log(errorThrown);
    });
  });
  //To hide and show the login and register fields
  $("#login_button").on("click", function() {
    $('.register').hide();
    $(".login_user").toggle();
  });

  $("#register_button").on("click", function() {
    $('.login_user').hide();
    $(".register").toggle()
  });
});
