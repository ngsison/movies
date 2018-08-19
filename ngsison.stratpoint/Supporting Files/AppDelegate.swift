import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let detailViewController = MovieDetailViewController()
        
        let masterViewController = MoviesViewController()
        masterViewController.delegate = detailViewController
        
        let splitViewController =  UISplitViewController()
        splitViewController.viewControllers = [masterViewController, detailViewController]
        
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

