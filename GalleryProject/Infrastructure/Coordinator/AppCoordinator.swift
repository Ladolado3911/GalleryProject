import UIKit

protocol AppCoordinatorProtocol: AnyObject{
    init(window: UIWindow?, navigationController: UINavigationController?)
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol{
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(window: UIWindow?, navigationController: UINavigationController?){
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainTabBar.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

