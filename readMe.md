App: travel app with rails framework and JavaScript & html front
User stories:
1) An app which gives me a list of tourist cities with tourist attractions
2) Each city should give a list of tourist attractions
3) App should be able to sort attractions based on categories or interests.

Description: The app gives you a list of cities to choose from and gives you a list of travel attractions in that particular city. You can filter the travel attractions based on your interests/ listed categories. Each travel attraction also has a list of reviews to read / post.

Details: The single page app is built using rails framework and database used is Postgres. There are 4 models generated - city, tourist_attraction, review, user.

Each city has many tourist attractions associated and each tourist attraction has many reviews.

The routes used for city and tourist_attraction are standard ones listed in resources which render based on their respective :id . Tourist_attraction also has a class method defined which finds all tourist locations within 2 mile radius of a particular attraction. This method uses the geokit gem.

In the front end , HTML, bootstrap and app.CSS files are used for styling. JavaScript used is in the file app.js.
Most of the JavaScript functions use ajax to 'get' or  'post' data to connect to the server side and render data . The data rendered is then filtered based on requirements using different methods.
