//
//  ExTodo.swift
//  TicketSchedule
//
//  Created by Takaki Otsu on 2019/03/26.
//  Copyright © 2019 Takaki Otsu. All rights reserved.
//

import UIKit

//MARK: - TableView Conf
extension TodoVC: UITableViewDelegate, UITableViewDataSource {
    // section count
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // cell count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    // cell contents
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //set cell informations
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableCell") as! TodoTableCell
        cell.content.text = self.contents[indexPath.row].value
        return cell
    }
    
    // delete method
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let iDAO = ItemDAO()
            iDAO.deleteByCode(id: contents[indexPath.row].id)
            tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //tap to the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - cellContentField
extension TodoVC: UITextFieldDelegate{
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.cellAddBtn.isEnabled = !(cellContentField.text?.isEmpty ?? true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // close the keyboard
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - keyboard hide options
extension TodoVC{
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.textInputViewBottom.constant == additionalSafeAreaInsets.bottom {
            self.textInputViewBottom.constant -= keyboardFrame.height

        }
        
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.textInputViewBottom.constant != additionalSafeAreaInsets.bottom {
            self.textInputViewBottom.constant = additionalSafeAreaInsets.bottom
        }
    }
}

