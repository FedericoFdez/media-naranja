//
//  ViewController.swift
//  MediaNaranja
//
//  Created by Federico Fernández on 5/11/15.
//  Copyright © 2015 Federico Fernández. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fechaNacimiento: UILabel!
    @IBOutlet weak var fechaEnamoramiento: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Fecha de nacimiento - unwind
    
    @IBAction func nacimientoSeleccionado(segue: UIStoryboardSegue) {
        
        if let vc = segue.sourceViewController as? NacimientoViewController {
            fechaNacimiento.text = String(vc.fechaNacimiento)
        }
    }
    
    // MARK: Fecha de enamoramiento - unwind
    
    @IBAction func enamoramientoSeleccionado(segue: UIStoryboardSegue) {
        
        if let vc = segue.sourceViewController as? EnamoramientoViewController {
            fechaEnamoramiento.text = String(vc.fechaEnamoramiento)
        }
    }


}

