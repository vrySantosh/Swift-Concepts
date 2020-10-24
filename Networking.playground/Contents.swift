
// == Networking ==


// for URLComponents, Label
import UIKit

var label =  UILabel()
// Construct an URL aka API by assinging its parts to URLComponents value
var components = URLComponents()
components.scheme = "https"
components.host = "api.github.com"
components.path = "/users/elSantosh"

// This returns constructed url as optional
guard let url = components.url else {
    preconditionFailure("Failed to construct the URL")
//    return
}

let task = URLSession.shared.dataTask(with: url) {
    /*
     data: will either contains the bytes of data or nil.
     response: a representaion of the response that was recieved. contains things like MIME type and encoading of the doenloaded data, and can be type casted to HTTPURLResponse.
     error: any error that encountered or nil when the operation is success.
    */
    data, response, error in
    
    print("data: \(data)")
    print("response: \(response)")
    print("error: \(error)")
    
    DispatchQueue.main.async {
        
        // == Parsing Techniques ==
        /*
         1. Json Serialisation
         2. Codable.
         3. SBJson
         */
        
        if let data = data {
            label.text = String(decoding: data, as: UTF8.self)
        } else {
            label.text = error?.localizedDescription
        }
    }
   
    

}
task.resume()


