//
//  ViewController.swift
//  PregameApp
//
//  Created by Jonny Chow on 11/3/19.
//  Copyright © 2019 Jonny Chow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    class AlcoholBrand {
        var name: String
        var price: Double
        var vol: Double
        init(name: String, price: Double, vol: Double) {
            self.name = name
            self.price = price
            self.vol = vol
        }
    }
    
    let alc_list = [AlcoholBrand(name: "Ciroc", price: 40, vol: 0.5), AlcoholBrand(name: "Absolut", price: 30, vol: 0.5)]
    var sliderValue = 10
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(alc_list.count)
    }


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var vodkaButtonColor: UIButton!
    @IBOutlet weak var beerButtonColor: UIButton!
    @IBOutlet weak var wineButtonColor: UIButton!

    @IBAction func beerButton(_ sender: Any) {
        if vodkaButtonColor.backgroundColor == UIColor.white {
            vodkaButtonColor.backgroundColor = UIColor.red
            
        }
        else {
            vodkaButtonColor.backgroundColor = UIColor.white
        }
        
    }
    @IBAction func vodkaButton(_ sender: Any) {
        
        if beerButtonColor.backgroundColor == UIColor.white {
            beerButtonColor.backgroundColor = UIColor.red
        }
        else {
            beerButtonColor.backgroundColor = UIColor.white
        }
    }
    @IBAction func wineButton(_ sender: Any) {
        if wineButtonColor.backgroundColor == UIColor.white {
            wineButtonColor.backgroundColor = UIColor.red
        }
        else {
            wineButtonColor.backgroundColor = UIColor.white
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.myImage.image = UIImage(named: alc_list[indexPath.row].name + ".jpeg")
        cell.alcLabel.text = alc_list[indexPath.row].name
        cell.alcPrice.text = "$" + String(alc_list[indexPath.row].price)
        cell.alcVol.text = String(alc_list[indexPath.row].vol) + "L"

        return(cell)
    }
    

    @IBOutlet var shotsLabel: UILabel!
    @IBOutlet var budgetAmount: UITextField!
    @IBOutlet var peopleAmount: UITextField!
    @IBOutlet var shotsCount: UILabel!
    @IBAction func slider(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        if sliderValue > 15 {
            shotsLabel.text = String(sliderValue) + " Shots: Black out"
        }
        else if sliderValue > 10 {
            shotsLabel.text = String(sliderValue) + " Shots: Party mode"
        }
        else if sliderValue > 6 {
            shotsLabel.text = String(sliderValue) + " Shots: Get lit"
        }
        else if sliderValue > 3 {
            shotsLabel.text = String(sliderValue) + " Shots: Chill drink"
        }
        else if sliderValue > 0 {
            shotsLabel.text = String(sliderValue) + " Shots: One shot wonder"
        }
    }
    @IBOutlet weak var pregameButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        budgetAmount.delegate = self
        peopleAmount.delegate = self
        pregameButton.layer.cornerRadius = 10
        vodkaButtonColor.layer.cornerRadius = 10

    }
    @IBAction func pregame(_ sender: Any) {
        let peopleInt: Int? = Int(peopleAmount.text!)
        let totalShots = peopleInt! * sliderValue
        tableView.isHidden = false
        shotsCount.text = "Total Shots: \(totalShots)"
    }
    

    

}
extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
