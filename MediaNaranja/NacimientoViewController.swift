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
    
    var fechaNacimiento = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nacimientoDatePicker.setDate(fechaNacimiento, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func fechaCambiada(sender: UIDatePicker) {
        if !esValida(sender.date){
            print("Fecha no válida!")
        }
        self.fechaNacimiento = sender.date
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
