import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    
    // MARK: - Properties
    static let identifier = "movieTableViewCell"
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    
    
    // MARK: - Overrides
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    
    // MARK: - Functions
    func setup(_ movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year != nil ? "\(movie.year!)" : ""
        
        guard let slug = movie.slug else { return }
        let urlString = URLHelper.getBackDropImageURL(for: slug)
        backgroundImageView.loadImage(from: URL(string: urlString)!)
    }
    
    
    
    // MARK: - Setup Views
    private func setupViews() {
        setupBackgroundImage()
        setupYearLabel()
        setupTitleLabel()
    }
    
    private func setupBackgroundImage() {
        self.addSubview(backgroundImageView)
        backgroundImageView.anchor(top: self.topAnchor, equalTo: 0)
        backgroundImageView.anchor(left: self.leftAnchor, equalTo: 0)
        backgroundImageView.anchor(bottom: self.bottomAnchor, equalTo: 0)
        backgroundImageView.anchor(right: self.rightAnchor, equalTo: 0)
    }
    
    private func setupYearLabel() {
        self.addSubview(yearLabel)
        yearLabel.anchor(left: self.leftAnchor, equalTo: 15)
        yearLabel.anchor(right: self.rightAnchor, equalTo: -15)
        yearLabel.anchor(bottom: self.bottomAnchor, equalTo: -15)
        yearLabel.anchor(height: 20)
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.anchor(left: self.leftAnchor, equalTo: 15)
        titleLabel.anchor(right: self.rightAnchor, equalTo: -15)
        titleLabel.anchor(bottom: yearLabel.topAnchor, equalTo: 0)
        titleLabel.anchor(height: 20)
    }
}













