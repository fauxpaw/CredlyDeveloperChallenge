# CredlyDeveloperChallenge

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

1. Setup a basic tableview with hardcoded data
2. Next, create an API object to perform a network fetch using a codable data encapsulation to familiarize myself with the data structures from the endpoint.
  Notes: I could have just added in the networking code directly into the view controller but I chose to create and utilize an object especially for this occassion. In my opinion the best practice is to draw a hard line between networking code and view code. An additional benefit is the scalability that comes with using an object or structure that can be responsibile for all, or even a subset of the network traffic. This proved useful when it came time to implement the requirement for utilizing SwiftyJSON. I was able to just create another static method to fulfil the requirement and leave the original implementation in place.
3. Add cocoapods and specify the dependencies for Alamofire and SwiftyJSON.
4. 

