//
//  ViewController.swift
//  Exam
//
//  Created by luka xrikuli on 26.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Firstlbl: UILabel!
    @IBOutlet weak var SecondLbl: UILabel!
    @IBOutlet weak var MailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var PngImage: UIImageView!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SignInPushed(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseMakeViewController") as! ChooseMakeViewController
        
        if MailField.text == "" && PasswordField.text == ""{
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }
    
}
    
struct GlobalVariables{
    static var ChoosenCars = [Car]()
}


