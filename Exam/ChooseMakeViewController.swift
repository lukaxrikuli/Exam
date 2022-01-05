//
//  ChooseMakeViewController.swift
//  Exam
//
//  Created by luka xrikuli on 26.12.21.
//

import UIKit

class ChooseMakeViewController: UIViewController {

    
    @IBOutlet weak var CarsTableview: UITableView!
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    @IBOutlet weak var ProductCountLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var BasketImage: UIImageView!
    @IBOutlet weak var BasketView: UIView!
    @IBOutlet weak var GoToBasket: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        activityindicator.startAnimating()
        activityindicator.hidesWhenStopped = true
        loadData(completion: { [weak self] in
            DispatchQueue.main.async {
                self?.CarsTableview.reloadData()
                self?.activityindicator.stopAnimating()
            }
        })
    }
    
    @IBAction func GoInBasket(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentPageViewController") as! PaymentPageViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    func initTableView() {
        CarsTableview.delegate = self
        CarsTableview.dataSource = self
        
        let cellNib = UINib(nibName: "carMarkCell", bundle: nil)
        CarsTableview.register(cellNib, forCellReuseIdentifier: "carMarkCell")
    }
    
    var carList = [Car]()
    var makeList = [String]()
    
    func loadData(completion: @escaping () -> ())  {
        guard let url = URL(string: "https://private-anon-a41c950c16-carsapi1.apiary-mock.com/cars?fbclid=IwAR0wRAgw30gahMQTh1CZxZQf2lwSpp2VJRwsvDRDaxf_HGhMydrovMhgZV4") else {
            print("Invalid URL")
            return
        }
        
        let urlReq = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlReq, completionHandler: { data, response, requestError in
                
            guard data != nil else {
                return
            }
            do {
                let decodedResponse = try JSONDecoder().decode([Car].self, from: data!)
                self.carList = decodedResponse as [Car]
                self.makeList = Array(Set(self.carList.map{$0.make}))
                completion()
            }
            catch {
                print(error)
            }
        })
        
        dataTask.resume()
        
    }
    
    
}

/*enum BrandLogo: String {
    case kia =  "kia"
    case ford =  "ford"
    case audi = "audi"
    case mercedesBenz = "mercedes-benz"
    case fiat = "fiat"
}*/

struct Response : Codable{
    var r : [Car]
}

struct Car : Codable {
    var year : Int
    var id : Int
    var horsepower : Int
    var make : String
    var model : String
    var price : Double
    var img_url : String
    init()
    {
        year = 0
        id = 0
        horsepower = 0
        make = ""
        model = ""
        price = 0
        img_url = ""
    }
    
}
    
extension ChooseMakeViewController : UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return makeList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = CarsTableview.dequeueReusableCell(withIdentifier: "carMarkCell", for: indexPath) as! carMarkCell
    cell.cardMarkLabel.text = self.makeList[indexPath.row]
    cell.selectionStyle = .none
    let defaultImage = UIImage(named: "Logo")
    cell.CardBrandImageView.image = UIImage(named: self.makeList[indexPath.row]) ?? defaultImage
    return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BrandsViewController") as! BrandsViewController
        var cars: [Car] = []
        let brand = makeList[indexPath.row]
        for car in carList {
            if car.make == brand {
                cars.append(car)
            }
        }
        vc.cars = cars
        vc.title = brand
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


