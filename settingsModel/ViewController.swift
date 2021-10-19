//
//  ViewController.swift
//  settingsModel
//
//  Created by Layla Emanuele on 14/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var data = [("Identificação", ["Nome de usuário", "Email"]),
                ("Privacidade", ["Mudar senha", "Conta privada"]),
                ("Definições", ["Selecionar linguagem", "Dark mode"]),
                ("", ["Desconectar"])]
    
    let CellIdentifier = "TableViewCell", HeaderViewIdentifier = "TableViewHeaderView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "text")
        
        //        TextFieldTableViewCell.textField.delegate = self
        //
        //        if let value = UDM.shared.defaults?.value(forKey: "text") as? String {
        //
        //        }
        //
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as UITableViewCell
        let settingsInSection = data[indexPath.section].1
        cell.textLabel?.text = settingsInSection[indexPath.row]
        let cellTF = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! TextFieldTableViewCell
        
        switch indexPath.section {
        case 0:
            if(indexPath.row == 0){
                
                return cellTF
            }else{
                cellTF.textField.placeholder = "Email"
                return cellTF
            }
            //
        case 1:
            if(indexPath.row == 1){
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
                switchView.tag = indexPath.row // for detect which row switch Changed
                //            switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
                cell.accessoryView = switchView
            }
            break
            
        case 2:
            if(indexPath.row == 1){
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
                switchView.tag = indexPath.row // for detect which row switch Changed
                //            switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
                cell.accessoryView = switchView
            }
            break
            
        default:
            print("error in found a section or a row")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderViewIdentifier)!
        header.textLabel!.text = data[section].0
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
}

