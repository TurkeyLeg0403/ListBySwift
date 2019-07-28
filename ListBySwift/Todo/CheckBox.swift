import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "checkmark_on")! as UIImage
    let uncheckedImage = UIImage(named: "checkmark_off")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            } else {
                self.setImage(checkedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = true
        
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
