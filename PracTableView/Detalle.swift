//
//  Detalle.swift
//  PracTableView
//
//  Created by XCode on 13/11/18.
//  Copyright © 2018 XCode. All rights reserved.
//

import UIKit

class Detalle: UIViewController {

    var provincia : String = ""
    @IBOutlet var labelProvincia: UILabel!
    @IBOutlet var tvDatos: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelProvincia.text = provincia
        tvDatos.text = UserDefaults.standard.string(forKey: provincia)
        //tvDatos.layer.borderWidth = 1
        //tvDatos.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.setValue(tvDatos.text, forKey: provincia)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
