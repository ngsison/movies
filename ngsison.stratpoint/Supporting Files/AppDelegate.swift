import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let splitViewController =  UISplitViewController()
        
        let detailViewController = MovieDetailViewController()
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        
        let masterViewController = MoviesViewController()
        masterViewController.delegate = detailViewController
        
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)
        
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splitViewController
    
        window?.makeKeyAndVisible()
        
        return true
    }


    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            return UIInterfaceOrientationMask.portrait
        }
        
        return UIInterfaceOrientationMask.all
    }
}

