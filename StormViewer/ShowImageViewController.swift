//
//  ShowImageViewController.swift
//  StormViewer
//
//  Created by Shaikat on 17/5/18.
//  Copyright © 2018 Shaikat. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {

    var selectedImage : String?
    @IBOutlet weak var showImageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set title for this view controller
        title = selectedImage
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage{
            showImageView.image = UIImage(named: imageToLoad)
        }
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
