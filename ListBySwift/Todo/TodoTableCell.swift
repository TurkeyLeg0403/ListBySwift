//
//  TodoTableCell.swift
//  TicketSchedule
//
//  Created by Takaki Otsu on 2019/03/26.
//  Copyright © 2019 Takaki Otsu. All rights reserved.
//

import UIKit

class TodoTableCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var checkBox: CheckBox!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func checkBox(_ sender: CheckBox!) {
//        print("checkBox isChecked:  \(sender.isChecked)")
        // get isChecked from Btn instance
        self.isChecked = sender.isChecked
    }
}
