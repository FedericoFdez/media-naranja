//
//  EnamoramientoViewController.swift
//  MediaNaranja
//
//  Created by Federico Fernández on 10/11/15.
//  Copyright © 2015 Federico Fernández. All rights reserved.
//

import UIKit

class EnamoramientoViewController: UIViewController {

    var fechaEnamoramiento : String = ""
    @IBOutlet weak var enamoramientoDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        if fechaEnamoramiento != "" {
            let df = NSDateFormatter()
            df.dateFormat = "dd MM yyyy"
            let date = df.dateFromString(self.fechaEnamoramiento)
            if let unwrappedDate = date {
                enamoramientoDatePicker.setDate(unwrappedDate, animated: true)
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
        self.fechaEnamoramiento = strDate

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
