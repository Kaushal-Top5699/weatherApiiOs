//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Kaushal Topinkatti B on 16/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lableCityName: UILabel!
    @IBOutlet weak var lableRegion: UILabel!
    @IBOutlet weak var lableCountry: UILabel!
    @IBOutlet weak var lableTemp: UILabel!
    
    @IBOutlet weak var lableWindSpeed: UILabel!
    @IBOutlet weak var lableHumidity: UILabel!
    @IBOutlet weak var lableCloudCover: UILabel!
    @IBOutlet weak var lableVisibility: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var lableSky: UILabel!
    @IBOutlet weak var btnGetDataOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnGetData(_ sender: Any) {
        
        let url = URL(string: "http://api.weatherstack.com/current?access_key=b04e7e3ac2dcd44be72b7f44e23df644&query=Belgaum")
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            
            if error != nil {
                
                let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                if data != nil {
                    
                    do {
                        
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            
                            
                            if let location = jsonResponse["location"] as? [String:Any] {
                                
                                if let city = location["name"] as? String {
                                    self.lableCityName.text = city
                                }
                                
                                if let region = location["region"] as? String {
                                    self.lableRegion.text = region
                                }
                                
                                if let country = location["country"] as? String {
                                    self.lableCountry.text = country
                                }
                            }
                            
                            if let currentData = jsonResponse["current"] as? [String:Any] {
                                
                                if let dayOrNight = currentData["is_day"] as? String {
                                    //change the backgrounds accordingly

                                    if dayOrNight == "no" {
                                        
                                        //Background color set to dark
                                        if let humidity = currentData["humidity"] as? Int {
                                            
                                            if humidity > 88 {
                                                
                                                //Raining
                                                //self.backgroundView.backgroundColor = UIColor.systemIndigo
                                                
                                                self.backgroundView.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1019607843, blue: 0.1490196078, alpha: 1)
                                                self.weatherImage.image = UIImage(named: "rainy")
                                                self.lableSky.text = "Rainy"
                                                self.view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.2156862745, blue: 0.3215686275, alpha: 1)
                                                self.btnGetDataOutlet.tintColor = UIColor.white
                                                self.btnGetDataOutlet.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1019607843, blue: 0.1490196078, alpha: 1)
                                                
                                            } else if humidity > 80 && humidity < 88 {
                                                //Cloudy
                                                self.backgroundView.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1019607843, blue: 0.1490196078, alpha: 1)
                                                self.weatherImage.image = UIImage(named: "cloudy")
                                                self.lableSky.text = "Cloudy"
                                                self.view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.2156862745, blue: 0.3215686275, alpha: 1)
                                                self.btnGetDataOutlet.tintColor = UIColor.white
                                                self.btnGetDataOutlet.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1019607843, blue: 0.1490196078, alpha: 1)
                                                
                                            } else {
                                                //Sunny
                                                self.backgroundView.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1019607843, blue: 0.1490196078, alpha: 1)
                                                self.weatherImage.image = UIImage(named: "clearNight")
                                                self.lableSky.text = "Clear Sky"
                                                self.view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.2156862745, blue: 0.3215686275, alpha: 1)
                                                self.btnGetDataOutlet.tintColor = UIColor.white
                                                self.btnGetDataOutlet.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1019607843, blue: 0.1490196078, alpha: 1)
                                            }
                                            self.lableHumidity.text = "Humidity: \(humidity)"
                                        }
                                        
                                    } else {
                                        
                                        //Background color as previously define
                                        if let humidity = currentData["humidity"] as? Int {
                                            
                                            if humidity > 90 {
                                                
                                                //Raining
                                                //self.backgroundView.backgroundColor = UIColor.systemIndigo
                                                
                                                self.backgroundView.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.4862745098, blue: 0.7254901961, alpha: 1)
                                                self.weatherImage.image = UIImage(named: "rainy")
                                                self.lableSky.text = "Rainy"
                                                self.view.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.5607843137, blue: 0.7803921569, alpha: 1)
                                                self.btnGetDataOutlet.tintColor = UIColor.white
                                                self.btnGetDataOutlet.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.4862745098, blue: 0.7254901961, alpha: 1)
                                                
                                            } else if humidity > 80 && humidity < 90 {
                                                //Cloudy
                                                self.backgroundView.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.6, blue: 0.7058823529, alpha: 1)
                                                self.weatherImage.image = UIImage(named: "cloudy")
                                                self.lableSky.text = "Cloudy"
                                                self.view.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7529411765, blue: 0.8784313725, alpha: 1)
                                                self.btnGetDataOutlet.tintColor = UIColor.white
                                                self.btnGetDataOutlet.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.6, blue: 0.7058823529, alpha: 1)
                                                
                                            } else {
                                                //Sunny
                                                self.backgroundView.backgroundColor = #colorLiteral(red: 1, green: 0.6823529412, blue: 0.2588235294, alpha: 1)
                                                self.weatherImage.image = UIImage(named: "suny")
                                                self.lableSky.text = "Sunny"
                                                self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8156862745, blue: 0.5647058824, alpha: 1)
                                                self.btnGetDataOutlet.tintColor = UIColor.white
                                                self.btnGetDataOutlet.backgroundColor = #colorLiteral(red: 1, green: 0.6823529412, blue: 0.2588235294, alpha: 1)
                                            }
                                            self.lableHumidity.text = "Humidity: \(humidity)"
                                        }
                                        
                                    }
                                    
                                }
                                
                                if let temp = currentData["temperature"] as? Int {
                                    self.lableTemp.text = "\(temp) C"
                                }
                                
                                if let winSpeed = currentData["wind_speed"] as? Int {
                                    self.lableWindSpeed.text = "Wind Speed: \(winSpeed) km/hr"
                                }
                                
                                
                                
                                if let cloudCover = currentData["cloudcover"] as? Int {
                                    self.lableCloudCover.text = "Cloud Cover: \(cloudCover)"
                                }
                                
                                if let visi = currentData["visibility"] as? Int {
                                    self.lableVisibility.text = "Visibility: \(visi) km"
                                }
                            }
                        
                        }
                        
                    } catch {
                        print("ERROR!!")
                    }
                    
                }
                
            }
            
        }
        task.resume()
    }

}

