//
//  ViewController.swift
//  RealmKakeioboSample
//
//  Created by Owner on 2022/12/05.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!

    let realm = try! Realm()
    var items: [ShoppingItem] = []
    var selectedCategory: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        items = readItems()
        print(items)
        self.navigationItem.title = selectedCategory.title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
    
        return cell
    }
    
    func readItems() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self).filter("category == %@", selectedCategory!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewItemView" {
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectedCategory
        }
    }
    
    func reloadTableView() {
        items = readItems()
        tableView.reloadData()
    }
    
}

