//
//  NewItemViewController.swift
//  RealmKakeioboSample
//
//  Created by Owner on 2022/12/16.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    let realm = try! Realm()

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let item = ShoppingItem()
        item.title = titleTextField.text ?? ""
        item.price = Int(priceTextField.text ?? "") ?? 0
        item.isMarked = markSwitch.isOn
        item.category = category
        createItem(item: item)
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! ItemViewController
        previousVC.reloadTableView()
        
        self.dismiss(animated: true)
    }

    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
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
