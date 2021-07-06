import UIKit

class BaseViewController: UIViewController, Storyboarded, CoordinatorDelegate{
    var coordinator: AppCoordinatorProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
}
