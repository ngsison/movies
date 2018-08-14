class URLHelper {
    
    static func getMoviesURL(_ breed: String) -> String {
        return "\(Constants.BASE_URL)list_movies_page1.json"
    }
    
    static func getCoverImageURL(for slug: String) -> String {
        return "\(Constants.BASE_URL)images/\(slug)/-cover.jpg"
    }
    
    static func getBackDropImageURL(for slug: String) -> String {
        return "\(Constants.BASE_URL)images/\(slug)/-backdrop.jpg"
    }
    
}
