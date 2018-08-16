import UIKit

class MoviesViewController: UIViewController {

    // MARK: - Properties
    var movies = [Movie]()
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getMovies()
    }
    
    
    
    // MARK: - Network
    func getMovies() {
        MovieService.getMovies { (movies) in
            self.movies = movies
        }
    }
}



// MARK: - Extension: SetupViews
extension MoviesViewController {
    
    func setupViews() {
        self.title = "Movies"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
}
