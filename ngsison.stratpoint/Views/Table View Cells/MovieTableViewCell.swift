import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    
    // MARK: - Properties
    static let identifier = "movieTableViewCell"
    
    internal lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    internal lazy var myLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    // MARK: - Functions
    func setup(_ movie: Movie) {
        myLabel.text = movie.title
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
        setupLabel()
    }
    
    private func setupContainer() {
        self.addSubview(container)
        container.anchor(top: self.topAnchor, equalTo: 0)
        container.anchor(left: self.leftAnchor, equalTo: 0)
        container.anchor(bottom: self.bottomAnchor, equalTo: 0)
        container.anchor(right: self.rightAnchor, equalTo: 0)
    }
    
    private func setupLabel() {
        container.addSubview(myLabel)
        myLabel.anchor(top: container.topAnchor, equalTo: 5)
        myLabel.anchor(left: container.leftAnchor, equalTo: 5)
        myLabel.anchor(bottom: container.bottomAnchor, equalTo: 5)
        myLabel.anchor(right: container.rightAnchor, equalTo: 5)
    }
}















