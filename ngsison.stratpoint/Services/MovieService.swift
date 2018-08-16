import Foundation


class MovieService {
    
//    static func getMovies(onSuccess: @escaping () -> ()) {
//        
//        let urlString = URLHelper.getMoviesURL()
//        let url = URL(string: urlString)!
//        
//        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//            if error != nil {
//                print(error!)
//                return
//            }
//            
//            do {
//                let json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers)) as! [String:AnyObject]
//                let jsonCategories = json["categories"] as! [[String: AnyObject]]
//                
////                //var categories = [AppCategory]()
////
////                for jsonCategory in jsonCategories {
////                    let category = AppCategory()
////                    category.name = jsonCategory["name"] as? String
////                    category.type = jsonCategory["type"] as? String
////
////                    category.apps = [App]()
////                    for dict in jsonCategory["apps"] as! [[String: AnyObject]] {
////                        let app = App()
////                        app.id = dict["Id"] as? NSNumber
////                        app.name = dict["Name"] as? String
////                        app.category = dict["Category"] as? String
////                        app.price = dict["Price"] as? NSNumber
////                        app.imageName = dict["ImageName"] as? String
////
////                        category.apps?.append(app)
////                    }
////
////                    //categories.append(category)
//                }
//                
//                DispatchQueue.main.async(execute: {
//                    onSuccess()
//                })
//                
//            } catch {}
//        }.resume()
    }
    
}
