//
//  NacimientoViewController.swift
//  MediaNaranja
//
//  Created by Federico Fernández on 10/11/15.
//  Copyright © 2015 Federico Fernández. All rights reserved.
//

import UIKit

class NacimientoViewController: UIViewController {
    
    @IBOutlet weak var nacimientoDatePicker: UIDatePicker!
    
    var fechaNacimiento : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if fechaNacimiento != "" {
          let df = NSDateFormatter()
            df.dateFormat = "dd MM yyyy"
            let date = df.dateFromString(self.fechaNacimiento)
            if let unwrappedDate = date {
                nacimientoDatePicker.setDate(unwrappedDate, animated: true)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func fechaCambiada(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        let strDate = dateFormatter.stringFromDate(sender.date)
        self.fechaNacimiento = strDate

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
