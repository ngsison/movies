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
        return label
    }()
    
    internal lazy var yearLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    // MARK: - Functions
    func setup(_ movie: Movie) {
        titleLabel.text = movie.title
        
        if let year = movie.year {
            yearLabel.text = "\(year)"
        }
    }
    
    
    
    // MARK: - Overrides
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: - Extension - SetupViews
extension MovieTableViewCell {
    
    func setupViews() {
        setupContainer()
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

    private func setupYearLabel() {
        container.addSubview(yearLabel)
        yearLabel.anchor(left: container.leftAnchor, equalTo: 10)
        yearLabel.anchor(right: container.rightAnchor, equalTo: -10)
        yearLabel.anchor(bottom: container.bottomAnchor, equalTo: -10)
        yearLabel.anchor(height: 20)
    }
    
    private func setupTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.anchor(left: container.leftAnchor, equalTo: 10)
        titleLabel.anchor(right: container.rightAnchor, equalTo: -10)
        titleLabel.anchor(bottom: yearLabel.topAnchor, equalTo: 0)
        titleLabel.anchor(height: 20)
    }

}















