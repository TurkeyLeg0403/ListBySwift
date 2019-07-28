//
//  TodoVC.swift
//  TicketSchedule
//
//  Created by Takaki Otsu on 2019/03/26.
//  Copyright © 2019 Takaki Otsu. All rights reserved.
//

import UIKit
import RealmSwift

class TodoVC: UIViewController {

    @IBOutlet weak var todoTable: UITableView!
    @IBOutlet weak var cellContentField: UITextField!

    @IBOutlet var cellAddBtn: UIButton!
    @IBOutlet weak var textInputView: UIView!
    @IBOutlet weak var textInputViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    var contents: Results<Item>!
    var textInputViewDefaultY = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textInputViewDefaultY = self.textInputView.frame.origin.y
        self.todoTable.delegate = self
        self.todoTable.dataSource = self
        // set identifier to todoTable
        self.todoTable.register(UINib(nibName: "TodoTableCell", bundle: nil), forCellReuseIdentifier: "TodoTableCell")
        // set action to cellContentField
        self.cellContentField.delegate = self
        self.cellContentField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                                        for: UIControl.Event.editingChanged)
        // set keyboard hide options
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //call item from DB
        let iDAO = ItemDAO()
        self.contents = iDAO.findAll()
        
    }
    
    @IBAction func cellAdd(_ sender: UIButton) {
        self.addCellContent()
        // close the keyboard
        self.cellContentField.endEditing(true)
    }
    @IBAction func cellDelete(_ sender: Any) {
    }
}
