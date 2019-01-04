//
//  ViewController.swift
//  Planet
//
//  Created by Aruna Yarra on 04/01/19.
//  Copyright © 2019 Aruna Yarra. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var planetsList = [Planet]()
    
    @IBOutlet weak var planetsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Planets"
        getPlanetDataFromDB()
        CommonFunctions.showActivityIndicatorInView(view: self.view, backgroundColor: UIColor.black)
        let apiManager = APIManager()
        apiManager.getDataWith(urlString: "https://swapi.co/api/planets") { (result) in
            switch result {
            case .Success(let data):
                DataHelper().addPlanetsDataToDB(array: data)
                DispatchQueue.main.async {
                    CommonFunctions.removeActivityIndicatorInView()
                    self.getPlanetDataFromDB()
                }
            case .Error(let message):
                DispatchQueue.main.async {
                    CommonFunctions.removeActivityIndicatorInView()
                    print("Error", message)
                }
            }
        }
    }
    
    func getPlanetDataFromDB() {
        planetsList = PlanetModule.sharedInstance.getAllRecordsOfEntityWithPredicate(entityName: "Planet", predicate: nil) as! [Planet]
        planetsTableView.reloadData()
    }
    //MARK: Tableview delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetsList.count;
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = planetsList[indexPath.row].name
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    //MARK: Tableview delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

