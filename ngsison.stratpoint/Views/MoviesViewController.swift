import UIKit

class MoviesViewController: UIViewController {

    // MARK: - Properties
    var movies = [Movie]()
    
    internal lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    internal lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none        
        tableView.rowHeight = 200
        
        return tableView
    }()
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getMovies()
    }
    
    
    
    // MARK: - Network
    func getMovies() {
        activityIndicator.isHidden = false
        MovieService.getMovies { (movies) in
            self.activityIndicator.isHidden = true
            self.movies = movies
            self.tableView.reloadData()
        }
    }
}



// MARK: - Extension: SetupViews
extension MoviesViewController {
    
    private func setupViews() {
        self.title = "Movies"
        self.view.backgroundColor = .red
        self.navigationController?.navigationBar.isTranslucent = false
        
        setupTableView()
        setupActivityIndicator()
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        tableView.anchor(top: self.view.topAnchor, equalTo: 0)
        tableView.anchor(left: self.view.leftAnchor, equalTo: 0)
        tableView.anchor(bottom: self.view.bottomAnchor, equalTo: 0)
        tableView.anchor(right: self.view.rightAnchor, equalTo: 0)
    }
    
    private func setupActivityIndicator() {
        self.view.addSubview(activityIndicator)
        activityIndicator.anchor(centerX: self.view.centerXAnchor)
        activityIndicator.anchor(centerY: self.view.centerYAnchor)
    }
    
}



// MARK - Extension: UITableView
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        cell.setup(movies[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}











