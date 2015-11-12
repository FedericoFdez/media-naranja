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
    @IBOutlet weak var fechaMuerte: UILabel!
    
    var calNacimiento = NSDate()
    var calEnamoramiento = NSDate()
    
    let EDAD_PROHIBIDA = 15
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            switch identifier {
            case "Seleccionar Nacimiento":
                if let vc = segue.destinationViewController as? NacimientoViewController {
                    vc.fechaNacimiento = calNacimiento
                }
            case "Seleccionar Enamoramiento":
                if let vc = segue.destinationViewController as? EnamoramientoViewController {
                    vc.fechaEnamoramiento = calEnamoramiento
                }
            default:
                break
            }
        }
    }
    
    // MARK: Fecha de nacimiento - unwind
    
    @IBAction func nacimientoSeleccionado(segue: UIStoryboardSegue) {
        
        if let vc = segue.sourceViewController as? NacimientoViewController {
            calNacimiento = vc.fechaNacimiento
            fechaNacimiento.text = parseDate(calNacimiento)
            calcularMuerte()
        }
    }
    
    // MARK: Fecha de enamoramiento - unwind
    
    @IBAction func enamoramientoSeleccionado(segue: UIStoryboardSegue) {
        
        if let vc = segue.sourceViewController as? EnamoramientoViewController {
            calEnamoramiento = vc.fechaEnamoramiento
            fechaEnamoramiento.text = parseDate(calEnamoramiento)
            calcularMuerte()
        }
    }
    
    // Funciones auxiliares
    
    func validarFechas() {
        if fechaNacimiento.text != "" && fechaEnamoramiento.text != ""{
            if calNacimiento.earlierDate(calEnamoramiento)==calEnamoramiento{
                print("Pero cómo te vas a haber enamorado a esa edad... si no has nacido!")
                return
            }
            if Int(calEnamoramiento.timeIntervalSinceDate(calNacimiento)) <= EDAD_PROHIBIDA*24*3600*365 {
                print("Eres demasiado joven para enamorarte...")
                return
            }
        }
    }
    
    func calcularMuerte() {
        validarFechas()
        let calendario = NSCalendar.currentCalendar()
        let calMuerte = calendario.dateByAddingUnit(
            [.Second],
            value: Int(calEnamoramiento.timeIntervalSinceDate(calNacimiento)),
            toDate: calEnamoramiento,
            options: [])!
        fechaMuerte.text = "Mueres el día... "+parseDate(calMuerte)
    }
    
    func parseDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.locale = NSLocale(localeIdentifier: "es-ES")
        return dateFormatter.stringFromDate(date)
        
    }


}

