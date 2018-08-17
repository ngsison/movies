import UIKit

class MovieDetailViewController: UIViewController {
    
    
    
    // MARK: - Properties
    var movie: Movie?
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadBackgroundImage()
    }
    
    
    
    // MARK: - Events
    
    
    
    // MARK: - Functions
    private func loadBackgroundImage() {
        if let movie = self.movie {
            guard let slug = movie.slug else { return }
            
            let urlString = URLHelper.getBackDropImageURL(for: slug)
            backgroundImage.loadImage(from: URL(string: urlString)!)
        }
    }
    
    
    // MARK: - Setup Views
    private func setupViews() {
        if let title = movie?.title { self.title = title }
        self.view.backgroundColor = UIColor.white
        
        setupBackgroundImage()
    }
    
    private func setupBackgroundImage() {
        self.view.addSubview(backgroundImage)
        backgroundImage.anchor(top: self.view.topAnchor, equalTo: 0)
        backgroundImage.anchor(left: self.view.leftAnchor, equalTo: 0)
        backgroundImage.anchor(right: self.view.rightAnchor, equalTo: 0)
        backgroundImage.anchor(height: 220)
    }
}
