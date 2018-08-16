import Foundation


class MovieService {
    
    static func getMovies(onSuccess: @escaping ([Movie]) -> ()) {
        
        let urlString = URLHelper.getMoviesURL()
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print(error!)
                return
            }
            
            do {
                let json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers)) as! [String:AnyObject]
                let jsonData = json["data"] as! [String: AnyObject]
                let jsonMovies = jsonData["movies"] as! [[String: AnyObject]]
                
                var movies = [Movie]()

                for jsonMovie in jsonMovies {
                    
                    let movie = Movie()
                    movie.rating = jsonMovie["rating"] as? NSNumber
                    movie.genres = jsonMovie["genres"] as? [String]
                    movie.language = jsonMovie["language"] as? String
                    movie.title = jsonMovie["title"] as? String
                    movie.url = jsonMovie["url"] as? String
                    movie.title_long = jsonMovie["title_long"] as? String
                    movie.imdb_code = jsonMovie["imdb_code"] as? String
                    movie.id = jsonMovie["id"] as? Int
                    movie.state = jsonMovie["state"] as? String
                    movie.year = jsonMovie["year"] as? Int
                    movie.runtime = jsonMovie["runtime"] as? Int
                    movie.overview = jsonMovie["overview"] as? String
                    movie.slug = jsonMovie["slug"] as? String
                    movie.mpa_rating = jsonMovie["mpa_rating"] as? String

                    movies.append(movie)
                }
                
                DispatchQueue.main.async(execute: {
                    onSuccess(movies)
                })
                
            } catch {}
        }.resume()
    }
    
}
