import RealmSwift
import UIKit

class Item: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var value: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(value: String){
        self.init()
        self.value = value
    }
    
    public func toString() -> String{
        return "item[id:\(self.id), value:\(self.value)]"
    }
}
