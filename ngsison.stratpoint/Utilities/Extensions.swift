import UIKit



// MARK: - UIColor
extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}



// MARK: - UIImage
extension UIImageView {
    
    public func loadImage(from url: URL) {
        self.image = nil
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                self.image = image
            })
        }.resume()
    }
    
}



// MARK: - UIView
extension UIView {
    
    private func prepareToUseConstraint() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func anchor(top: NSLayoutYAxisAnchor, equalTo constant: CGFloat) {
        self.prepareToUseConstraint()
        self.topAnchor.constraint(equalTo: top, constant: constant).isActive = true
    }
    
    func anchor(bottom: NSLayoutYAxisAnchor, equalTo constant: CGFloat) {
        self.prepareToUseConstraint()
        self.bottomAnchor.constraint(equalTo: bottom, constant: constant).isActive = true
    }
    
    func anchor(left: NSLayoutXAxisAnchor, equalTo constant: CGFloat) {
        self.prepareToUseConstraint()
        self.leftAnchor.constraint(equalTo: left, constant: constant).isActive = true
    }
    
    func anchor(right: NSLayoutXAxisAnchor, equalTo constant: CGFloat) {
        self.prepareToUseConstraint()
        self.rightAnchor.constraint(equalTo: right, constant: constant).isActive = true
    }
    
    func anchor(height: CGFloat) {
        self.prepareToUseConstraint()
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func anchor(width: CGFloat) {
        self.prepareToUseConstraint()
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func anchor(centerX: NSLayoutXAxisAnchor) {
        self.prepareToUseConstraint()
        self.centerXAnchor.constraint(equalTo: centerX).isActive = true
    }
    
    func anchor(centerY: NSLayoutYAxisAnchor) {
        self.prepareToUseConstraint()
        self.centerYAnchor.constraint(equalTo: centerY).isActive = true
    }
}
