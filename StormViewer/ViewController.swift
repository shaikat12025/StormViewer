//
//  ViewController.swift
//  StormViewer
//
//  Created by Shaikat on 17/5/18.
//  Copyright © 2018 Shaikat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pictures = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set title for this view controller
        title = "Storm Viewer"
        
        //listing image with file manager
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        //print(items)
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        print(pictures)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        
       // cell.textLabel?.text = ""
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //try loading the show image view controller and typecasting it to be ShowImageViewController
        let vc  = storyboard?.instantiateViewController(withIdentifier: "ShowImageViewController") as? ShowImageViewController
        //set selected image property (pass the data to the showImageViewController)
            vc?.selectedImage = pictures[indexPath.row]
        
        navigationController?.pushViewController(vc!, animated: true)
        
        
        
        
    }


}

