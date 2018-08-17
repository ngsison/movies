import UIKit

class MovieDetailViewController: UIViewController {
    
    
    
    // MARK: - Properties
    var movie: Movie?
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadBackgroundImage()
        loadCoverImage()
    }
    
    
    
    // MARK: - Events
    
    
    
    // MARK: - Functions
    private func loadBackgroundImage() {
        if let movie = self.movie {
            guard let slug = movie.slug else { return }
            let urlString = URLHelper.getBackDropImageURL(for: slug)
            backgroundImageView.loadImage(from: URL(string: urlString)!)
        }
    }
    
    private func loadCoverImage() {
        if let movie = self.movie {
            guard let slug = movie.slug else { return }
            let urlString = URLHelper.getCoverImageURL(for: slug)
            coverImageView.loadImage(from: URL(string: urlString)!)
        }
    }
    
    
    
    // MARK: - Setup Views
    private func setupViews() {
        if let title = movie?.title { self.title = title }
        self.view.backgroundColor = UIColor.white
        
        setupBackgroundImage()
        setupCoverImage()
        setupYearAndRating()
    }
    
    private func setupBackgroundImage() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.anchor(top: self.view.topAnchor, equalTo: 0)
        backgroundImageView.anchor(left: self.view.leftAnchor, equalTo: 0)
        backgroundImageView.anchor(right: self.view.rightAnchor, equalTo: 0)
        backgroundImageView.anchor(height: 220)
    }
    
    private func setupCoverImage() {
        backgroundImageView.addSubview(coverImageView)
        coverImageView.anchor(left: backgroundImageView.leftAnchor, equalTo: 15)
        coverImageView.anchor(bottom: backgroundImageView.bottomAnchor, equalTo: -15)
        coverImageView.anchor(width: 110)
        coverImageView.anchor(height: 165)
    }
    
    private func setupYearAndRating() {
        if let movie = self.movie {
            guard let year = movie.year, let rating = movie.rating else { return }
            yearLabel.text = "Year: \(year)"
            ratingLabel.text = "Rating: \(rating.doubleValue)"
        }
        
        let stackView = UIStackView()
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.addArrangedSubview(yearLabel)
        stackView.addArrangedSubview(ratingLabel)
        
        stackView.addSubview(yearLabel)
        stackView.addSubview(ratingLabel)
        backgroundImageView.addSubview(stackView)
        
        stackView.anchor(left: coverImageView.rightAnchor, equalTo: 15)
        stackView.anchor(right: backgroundImageView.rightAnchor, equalTo: -15)
        stackView.anchor(bottom: backgroundImageView.bottomAnchor, equalTo: -15)
        stackView.anchor(height: 20)
    }
}
