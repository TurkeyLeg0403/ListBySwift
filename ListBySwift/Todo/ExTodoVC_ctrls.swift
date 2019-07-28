import UIKit

//MARK: - controllers to view
extension TodoVC {
    func addCellContent() {
        // add contents
        let content = self.cellContentField.text!
        
        // regist ItemDB
        let iDAO = ItemDAO()
        iDAO.addItem(item: Item(value: content), isUpdated: .all)
        self.contents = iDAO.findAll()
        self.todoTable.reloadData()
        // reset items
        self.cellContentField.text = ""
        self.cellAddBtn.isEnabled = false
    }
}
