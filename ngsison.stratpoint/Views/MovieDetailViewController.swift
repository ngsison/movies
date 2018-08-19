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
    
    private lazy var yearAndRatingContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = UIStackViewDistribution.fillEqually
        return stackView
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var overviewTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = UIColor.black
        textView.textColor = UIColor.white
        textView.textAlignment = NSTextAlignment.justified
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    
    // MARK: - Functions
    private func setupUI() {
        setupViews()
        loadBackgroundImage()
        loadCoverImage()
    }
    
    private func loadBackgroundImage() {
        guard
            let movie = self.movie,
            let slug = movie.slug
        else { return }
        
        let urlString = URLHelper.getBackDropImageURL(for: slug)
        backgroundImageView.loadImage(from: URL(string: urlString)!)
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
        guard
            let movie = self.movie,
            let title = movie.title
        else { return }
        
        self.title = title
        self.view.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.isTranslucent = false
        
        setupBackgroundImage()
        setupCoverImage()
        setupYearAndRatingContainer()
        setupTitle()
        setupOverView()
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
    
    private func setupYearAndRatingContainer() {
        guard
            let movie = self.movie,
            let year = movie.year,
            let rating = movie.rating
        else { return }
        
        yearLabel.text = "Year: \(year)"
        ratingLabel.text = "Rating: \(rating.doubleValue)"
        
        yearAndRatingContainer.addArrangedSubview(yearLabel)
        yearAndRatingContainer.addArrangedSubview(ratingLabel)
        backgroundImageView.addSubview(yearAndRatingContainer)
        
        yearAndRatingContainer.anchor(left: coverImageView.rightAnchor, equalTo: 15)
        yearAndRatingContainer.anchor(right: backgroundImageView.rightAnchor, equalTo: -15)
        yearAndRatingContainer.anchor(bottom: backgroundImageView.bottomAnchor, equalTo: -15)
        yearAndRatingContainer.anchor(height: 20)
    }
    
    private func setupTitle() {
        guard
            let movie = self.movie,
            let title = movie.title
        else { return }
        
        titleLabel.text = title
        
        backgroundImageView.addSubview(titleLabel)
        titleLabel.anchor(left: coverImageView.rightAnchor, equalTo: 15)
        titleLabel.anchor(right: backgroundImageView.rightAnchor, equalTo: -15)
        titleLabel.anchor(bottom: yearAndRatingContainer.topAnchor, equalTo: 0)
        titleLabel.anchor(height: 20)
    }
    
    private func setupOverView() {
        guard
            let movie = self.movie,
            let overview = movie.overview
            else { return }
        
        overviewTextView.text = overview
        
        self.view.addSubview(overviewTextView)
        overviewTextView.anchor(top: backgroundImageView.bottomAnchor, equalTo: 15)
        overviewTextView.anchor(left: self.view.leftAnchor, equalTo: 15)
        overviewTextView.anchor(bottom: self.view.bottomAnchor, equalTo: -15)
        overviewTextView.anchor(right: self.view.rightAnchor, equalTo: -15)
    }
}



// MARK: - Extension: MoviesViewControllerDelegate
extension MovieDetailViewController: MoviesViewControllerDelegate {
    
    func didSelectMovie(_ movie: Movie) {
        self.movie = movie
        setupUI()
    }
    
}
