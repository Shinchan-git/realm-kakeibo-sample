//
//  Shopping.swift
//  RealmKakeioboSample
//
//  Created by Owner on 2022/12/05.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
    @Persisted var category: Category?
}
