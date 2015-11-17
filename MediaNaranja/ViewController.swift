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
    
    var vistaGorda = false // hacer una excepción en la validación
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        validarFechas()
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
        }
    }
    
    // MARK: Fecha de enamoramiento - unwind
    
    @IBAction func enamoramientoSeleccionado(segue: UIStoryboardSegue) {
        
        if let vc = segue.sourceViewController as? EnamoramientoViewController {
            calEnamoramiento = vc.fechaEnamoramiento
            fechaEnamoramiento.text = parseDate(calEnamoramiento)
        }
    }
    
    // Funciones auxiliares
    
    func validarFechas() {
        if fechaNacimiento.text != "" && fechaEnamoramiento.text != ""{
            if calNacimiento.earlierDate(calEnamoramiento)==calEnamoramiento{ //nacimiento>enamoramiento
                // Crear un UIAlertController:
                let alert1 = UIAlertController(title: "La has liado",
                    message: "Pero, ¿cómo te vas a haber enamorado a esa edad... ¡si no habías nacido!",
                    preferredStyle: UIAlertControllerStyle.Alert)
                // Añadir una Action al Alert Controller:
                alert1.addAction(
                    UIAlertAction(title: "Quiero ser sincero",
                        style: UIAlertActionStyle.Default,
                        handler: {(alert :UIAlertAction!) in
                            self.fechaEnamoramiento.text = ""
                    }))
                // Presentar el Alert Controller:
                presentViewController(alert1, animated: true, completion: nil)
                return
            }
            if Int(calEnamoramiento.timeIntervalSinceDate(calNacimiento)) <= EDAD_PROHIBIDA*24*3600*365 { //enamoramiento<15 años
                // Crear un UIAlertController:
                let alert2 = UIAlertController(title: "¡Demasiado joven para enamorarte! ",
                    message: "Dicen que antes de los 15 no puedes conocer al amor de tu vida. Pero claro, siempre hay excepciones...",
                    preferredStyle: UIAlertControllerStyle.Alert)
                
                // Añadir una Action al Alert Controller:
                alert2.addAction(
                    UIAlertAction(title: "Me has pillado",
                        style: UIAlertActionStyle.Default,
                        handler: {(alert :UIAlertAction!) in
                            self.fechaEnamoramiento.text = ""
                            self.fechaMuerte.text=""
                    }))
                
                // Añadir una Action al Alert Controller:
                alert2.addAction(
                    UIAlertAction(title: "Fue un flechazo",
                        style: UIAlertActionStyle.Default,
                        handler: {(alert :UIAlertAction!) in
                            self.escribirMuerte()
                    }))
                // Presentar el Alert Controller:
                presentViewController(alert2, animated: true, completion: nil)
            }
            self.escribirMuerte()
        }
    }
    
    func escribirMuerte() {
        let calendario = NSCalendar.currentCalendar()
        let calMuerte = calendario.dateByAddingUnit(
            [.Second],
            value: Int(calEnamoramiento.timeIntervalSinceDate(calNacimiento)),
            toDate: calEnamoramiento,
            options: [])!
        fechaMuerte.text = "Mueres el día...\n"+parseDate(calMuerte)
    }
    
    func parseDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMMM 'de' yyyy"
        dateFormatter.locale = NSLocale(localeIdentifier: "es-ES")
        return dateFormatter.stringFromDate(date)
        
    }


}

