//
//  EnamoramientoViewController.swift
//  MediaNaranja
//
//  Created by Federico Fernández on 10/11/15.
//  Copyright © 2015 Federico Fernández. All rights reserved.
//

import UIKit

class EnamoramientoViewController: UIViewController {

    @IBOutlet weak var enamoramientoDatePicker: UIDatePicker!
    
    var fechaEnamoramiento = NSDate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enamoramientoDatePicker.setDate(fechaEnamoramiento, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fechaCambiada(sender: UIDatePicker) {
        if !esValida(sender.date){
            print("Fecha no válida!")
        }
        self.fechaEnamoramiento = sender.date

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func esValida(fecha: NSDate) -> Bool {
        let hoy = NSDate()
        if fecha.laterDate(hoy) == fecha {
            return false
        }
        return true
    }

}
