# CredlyDeveloperChallenge

## End Result:


https://user-images.githubusercontent.com/14851511/215410770-4ca7bfa9-00ed-457b-9860-ccf38ef0540a.mp4



## Project Requirements:
1. Create a new iOS project in Xcode using the Single View App template.

2. Add a UITableView to the main view and use it to display a list of contacts.

3. Use the following API endpoint to retrieve a list of contacts: https://jsonplaceholder.typicode.com/users

4. Each cell in the table view should display the name, email, and phone number of a contact.

5. Add a refresh control to the table view that allows the user to refresh the list of contacts by pulling down on the table.

6. Use CocoaPods to add the following libraries to the project: · Alamofire (https://cocoapods.org/pods/Alamofire) · SwiftyJSON (https://cocoapods.org/pods/SwiftyJSON)

7. Use the Alamofire library to make the API request and the SwiftyJSON library to parse the JSON response.

8. Add error handling for cases when the API request fails. 

## My Approach:

1. Setup a basic tableview with hardcoded data and the ability to refresh the data.
  Notes: First and foremost I just like to get something on the screen and begin to think about how I want to present the data.

2. Next, add cocoapods and specify the dependency for Alamofire. Then create an API object to perform a network fetch using a codable data encapsulation to familiarize myself with the data structures from the endpoint.

  Notes: A quick glance at Alamofire documentation illustrated it being just a wrapper around URLSession which seemed pretty straightforward. Thus I chose the basic implementation listed in their documentation. For the apps API, I could have just added in the networking code directly into the view controller but I chose to create and utilize an object especially for this task. In my opinion the best practice within iOS should be to draw a hard line between networking code and your viewcontroller code. An additional benefit is the scalability that comes with using an object or structure that can be responsibile for all, or even a subset of the network traffic. This proved useful when it came time to implement the requirement for utilizing SwiftyJSON. I was able to just create another static method to fulfil the requirement and leave the original implementation in place in case it was ever needed in the future.
  
3. Add the dependency for SwiftyJSON and build out a new api method for parsing the data fields with the framework.

  Notes: Here I parsed the network response and situationally created an array of app model objects that I called UserContacts. Depending on the state of network traffic we will return either the app model objects or an error to the consumer (which will then be displayed to the user via an alert). In the interest of time, I chose to explicitly handle the network status code of 200 but in a true production level application, there should be more robust coverage here. Additionally, I added in a custom error type to denote some other problematic pathways including the inability to transform the response to a Data type.
  
4. With the data flowing nicely, the UI needed some love. 

Notes: Looking at the data being displayed I realized there was no consistent format and thought that it might be a nice touch to attempt to streamline the text. For the names I opted for Apples native PersonNameComponents (https://developer.apple.com/documentation/foundation/personnamecomponents). While this data type is not perfect, it is fairly robust and especially useful when localizing your app. For the phone numbers, I do not know of any Apple provided solutions and thus took to formatting the numbers myself via string manipulation. Additionally, I wanted to add some color and felt it appropriate to leverage some colors from Credly website.

5. With the app models growing in scope to include more complex formating and computed variables, the time had come to add some unit tests.

Notes: With the limited time I had left, I chose to prioritize testing the formating methods (and found I was not handling two digit contry codes properly!) but more coverage here is needed as well as test coverage for json parsing and potentially mocking network calls.

