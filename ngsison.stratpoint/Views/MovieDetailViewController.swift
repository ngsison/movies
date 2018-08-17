import UIKit

class MovieDetailViewController: UIViewController {
    
    
    
    // MARK: - Properties
    var movie: Movie?
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    
    // MARK: - Events
    
    
    
    // MARK: - Functions
    
    
    
    // MARK: - Setup Views
    func setupViews() {
        if let title = movie?.title {
            self.title = title
        }
        self.view.backgroundColor = UIColor.white
    }
}
