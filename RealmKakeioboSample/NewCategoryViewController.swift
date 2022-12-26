
import UIKit
import RealmSwift

class NewCategoryViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet var categoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let category = Category()
        category.title = categoryTextField.text ?? ""
        createCategory(category: category)
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! CategoryViewController
        previousVC.reloadTableView()
        
        self.dismiss(animated: true)
    }
    
    func readCategories() -> [Category] {
        return Array(realm.objects(Category.self))
    }
    
    func createCategory(category: Category) {
        try! realm.write {
            realm.add(category)
        }
    }
    
}
