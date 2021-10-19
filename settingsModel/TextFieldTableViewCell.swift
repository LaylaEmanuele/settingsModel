//
//  TextFieldTableViewCell.swift
//  settingsModel
//
//  Created by Layla Emanuele on 14/10/21.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    class TextField: UITextField{
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 24, dy: 0)
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 24, dy: 0)
        }
        
        override var intrinsicContentSize: CGSize{
            return .init(width: 0, height: 44)
        }
        
    }
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nome"
        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        textField.frame = bounds
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension ViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UDM.shared.defaults?.setValue(textField.text , forKey: "text")
        textField.resignFirstResponder()
        
        return true
    }
    
}

class UDM{
    static let shared = UDM()
    let defaults = UserDefaults(suiteName: "teste")
    
    func getName() -> String{
        return ""
    }
    
    
}
