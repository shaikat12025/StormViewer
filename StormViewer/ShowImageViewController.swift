//
//  ShowImageViewController.swift
//  StormViewer
//
//  Created by Shaikat on 17/5/18.
//  Copyright © 2018 Shaikat. All rights reserved.
//

import UIKit
import Social

class ShowImageViewController: UIViewController {

    var selectedImage : String?
    @IBOutlet weak var showImageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage{
            showImageView.image = UIImage(named: imageToLoad)
        }
        
        //set title for this view controller
        title = selectedImage
        
        //add navigation bar button item to add social media
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    // in swift 4, selectror is not deprecated. But the implicit @objc is deprecated.

    //Which means, that in such a case, you just need to add @objc in the func declaration
    
    
    @objc func shareTapped() {
        
        let vc = UIActivityViewController(activityItems: [showImageView.image!], applicationActivities: nil)
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem

        present(vc, animated: true)
        
//        //if you want to add facebook kit (If you want twitter you just need to change forServiceType to twitter)
//        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook){
//            vc.setInitialText("Hi, I am shaikat. Look at this great picture")
//            vc.add(showImageView.image!)
//            vc.add(URL(string:"http:/www.photolib.noaa.gov/nssl"))
//            present(vc, animated: true)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //hide the status bar when the view will appear
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // don't hide the status bar when the view will disappear calles
        
        navigationController?.hidesBarsOnTap = false
    }

}
