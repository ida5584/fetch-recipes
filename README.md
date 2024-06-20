The Fetch Recipe app is a SwiftUI-based application that allows users to browse through various desserts fetched from an API. Users can select a dessert to view its details, including ingredients and instructions.

Features
Browse Desserts: Scroll through a list of desserts fetched from the remote API.
View Dessert Details: Tap on any dessert to view detailed information including ingredients and cooking instructions.
Error Handling: Display error messages if there are issues fetching data from the API.
Loading State: Show a loading indicator while data is being fetched.
Image Handling: Utilize AsyncImage for displaying dessert images asynchronously.
Technologies Used
SwiftUI: Utilized for building the user interface.
Combine Framework: Used for asynchronous programming and data fetching.
NavigationView: Provides navigation functionality for moving between views.
ViewModel: Implemented using @StateObject for managing the data flow and state.

Installation
To run the Fetch Recipe app locally on your machine, follow these steps:

Clone the repository:
Run this in bash:
git clone https://github.com/ida5584/fetch-recipes
cd fetch-recipes
Open in Xcode:

Run the project:
Select a simulator (e.g., iPhone 15 Pro) as the build target.
Press Cmd + R or click the play button in Xcode to build and run the app.

Usage:
Upon launching the app, the user is presented with a list of desserts.
If desserts load successfully, each item displays an image and the name of the dessert.
Tap on a dessert item to view its details, including ingredients and instructions.
If there's an error loading desserts, an error message is displayed.
While data is being fetched, a loading indicator appears.

Credits
API Used: 
https://themealdb.com/api.php
