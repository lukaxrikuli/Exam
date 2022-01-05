//
//  BrandsViewController.swift
//  Exam
//
//  Created by luka xrikuli on 30.12.21.
//

import UIKit

class BrandsViewController: UIViewController {
    @IBOutlet weak var BrandTableView: UITableView!
    @IBOutlet weak var SubmitBtn: UIButton!
    @IBOutlet weak var SortBtnFourth: UIButton!
    @IBOutlet weak var SortBtnThird: UIButton!
    @IBOutlet weak var SortBtnSecond: UIButton!
    @IBOutlet weak var SortBtnFirst: UIButton!
     
    
    var cars = [Car]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    @IBAction func SortAzBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func SortZaBtn(_ sender: UIButton) {
    }
    @IBAction func HighToLowSortBtn(_ sender: UIButton) {
    }
    @IBAction func LowToHighSortBtn(_ sender: UIButton) {
    }
    @IBAction func SubmitBtn(_ sender: UIButton) {
        for cell in BrandTableView.visibleCells as! Array<ItemCell>
        {
            let count = Int(cell.ItemsCount.text!)!
            if( count > 0)
            {
                for i in 0...count-1
                {
                    GlobalVariables.ChoosenCars.append(cell.car)
                }
            }
        }
        
        //GlobalVariables.ChoosenCars.append()
    }
    
    func initTableView() {
        BrandTableView.delegate = self
        BrandTableView.dataSource = self
        let cellNib = UINib(nibName: "ItemCell", bundle: nil)
        BrandTableView.register(cellNib, forCellReuseIdentifier: "ItemCell")
    }
}




extension BrandsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 1.5
            cell.layer.cornerRadius = 16
            let car = cars[indexPath.row]
            cell.car = car
            cell.TitleLable.text = car.model
            cell.HorsePowerLabel.text = "\(car.horsepower)"
            
            let url = URL(string: car.img_url)
            let data = try? Data(contentsOf: url!)
            if data != nil
            {
                cell.LogoImage.image = UIImage(data: data!)
            }
            return cell
        }
    
    


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    cars.count
}


}

