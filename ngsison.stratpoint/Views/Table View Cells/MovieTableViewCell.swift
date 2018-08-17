import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    
    // MARK: - Properties
    static let identifier = "movieTableViewCell"
    
    internal lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    internal lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    internal lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    internal lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleToFill
        imageView.clipsToBounds = true
        return imageView
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
        backgroundImage.loadImage(from: URL(string: urlString)!)
    }
    
    
    
    // MARK: - Setup Views
    func setupViews() {
        setupContainer()
        setupBackgroundImage()
        setupYearLabel()
        setupTitleLabel()
    }
    
    private func setupContainer() {
        self.addSubview(container)
        container.anchor(top: self.topAnchor, equalTo: 0)
        container.anchor(left: self.leftAnchor, equalTo: 0)
        container.anchor(bottom: self.bottomAnchor, equalTo: 0)
        container.anchor(right: self.rightAnchor, equalTo: 0)
    }
    
    private func setupBackgroundImage() {
        container.addSubview(backgroundImage)
        backgroundImage.anchor(top: container.topAnchor, equalTo: 0)
        backgroundImage.anchor(left: container.leftAnchor, equalTo: 0)
        backgroundImage.anchor(bottom: container.bottomAnchor, equalTo: 0)
        backgroundImage.anchor(right: container.rightAnchor, equalTo: 0)
    }
    
    private func setupYearLabel() {
        container.addSubview(yearLabel)
        yearLabel.anchor(left: container.leftAnchor, equalTo: 15)
        yearLabel.anchor(right: container.rightAnchor, equalTo: -15)
        yearLabel.anchor(bottom: container.bottomAnchor, equalTo: -15)
        yearLabel.anchor(height: 20)
    }
    
    private func setupTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.anchor(left: container.leftAnchor, equalTo: 15)
        titleLabel.anchor(right: container.rightAnchor, equalTo: -15)
        titleLabel.anchor(bottom: yearLabel.topAnchor, equalTo: 0)
        titleLabel.anchor(height: 20)
    }
}













