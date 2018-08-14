import UIKit

class MoviesViewController: UIViewController {

    // MARK: - Properties
    
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    
    // MARK: - Network

}



// MARK: - Extension: SetupViews
extension MoviesViewController {
    
    func setupViews() {
        self.title = "Movies"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
}
