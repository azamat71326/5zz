//
//  ViewController.swift
//  TableView
//
//  Created by Азамат Кубаев on 24.12.2023.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelSurname: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
//    var name = ""
//    var surname = ""
//    var imagename = ""
//    
    
    var person = Person()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelName.text = person.name
        labelSurname.text = person.surname
        imageview.image = UIImage(named: person.imagename)
        
    }


}

