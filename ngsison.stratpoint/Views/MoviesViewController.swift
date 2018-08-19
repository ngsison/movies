import UIKit



// MARK: - Protocols
protocol MoviesViewControllerDelegate {
    func didSelectMovie(_ movie: Movie)
}



class MoviesViewController: UIViewController {

    // MARK: - Properties
    var delegate: MoviesViewControllerDelegate?
    var movies = [Movie]()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none        
        tableView.rowHeight = 250
        
        return tableView
    }()
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getMovies()
    }

    
    
    // MARK: - Events
    private func showMovieDetail(_ movie: Movie) {
        delegate?.didSelectMovie(movie)
        
        if
            let detailViewController = delegate as? MovieDetailViewController,
            let detailNavigationController = detailViewController.navigationController
        {
            self.splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
    
    
    
    // MARK: - Setup Views
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
    
    
    
    // MARK: - Network
    private func getMovies() {
        activityIndicator.startAnimating()
        
        // Note: Added a delay here just to show that there's an ActivityIndicator. LOL
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            MovieService.getMovies { (movies) in
                self.activityIndicator.stopAnimating()
                self.movies = movies
                self.tableView.reloadData()
                
                if movies.count > 0 {
                    self.delegate?.didSelectMovie(movies.first!)
                }
            }
        }
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
        showMovieDetail(movies[indexPath.row])
    }
}











