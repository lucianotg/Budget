import UIKit
import LinkKit

var greeting = "Hello, playground"

    var semaphore = DispatchSemaphore (value: 0)

     let parameters = "{\n  " +
    "\"client_id\": \"5d66e3438fd6470012c1d2d8\",\n  " +
    "\"secret\": \"4b622998672dd38a712884d3ef5eb4\",\n  " +
    "\"client_name\": \"TakeGive\",\n  " +
    "\"country_codes\": [\n    \"US\"\n  ],\n  " +
    "\"language\": \"en\",\n  " +
    "\"user\": {\n    \"client_user_id\": \"user_id\"\n  },\n  " +
    "\"products\": [\n    \"auth\"\n  ]\n}"

     let postData = parameters.data(using: .utf8)

    print(parameters)


     var request = URLRequest(url: URL(string: "https://development.plaid.com/link/token/create")!,timeoutInterval: Double.infinity)
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")

     request.httpMethod = "POST"
     request.httpBody = postData

     let task = URLSession.shared.dataTask(with: request) { data, response, error in
       guard let data = data else {
         print(String(describing: error))
         return
       }
         print(String(data: data, encoding: .utf8)!)
         

         //PlaidUtils.addPlaidLinkToken(metadata: data)
       semaphore.signal()
     }

     task.resume()
     semaphore.wait()

