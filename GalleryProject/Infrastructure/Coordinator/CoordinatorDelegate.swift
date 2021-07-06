import UIKit

protocol CoordinatorDelegate: UIViewController {
    var coordinator: AppCoordinatorProtocol? { get set }
}
