//
//  ViewController.swift
//  apptodolist
//
//  Created by admin on 18/12/2021.
//

import UIKit
import CoreData

struct Todo{
    var todoTitle : String?
    var todoDesc : String?
    var todoDate : Date?
    var Checkmark : Bool = false
}
protocol adddelegate {
    
    func toupdatetable()
    
}

class ToAddViewController: UIViewController {
 
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    var delegate : adddelegate?
    var todoobj = Todo()
   
 
    @IBOutlet weak var todotitle: UITextField!
    
    @IBOutlet weak var tododesc: UITextField!
    
    
    @IBOutlet weak var duedate: UIDatePicker!
    
    @IBAction func changethedate(_ sender: UIDatePicker) {
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        duedatea  =  formatter.string(from: duedate.date)
    }
    
    @IBAction func savenewtodo(_ sender: UIButton) {
        if todotitle.text == "" || tododesc.text == ""
        {return }
        else
        { let todorec = TodoList(context: context)
            todorec.title = todotitle.text
            todorec.tododesc = tododesc.text
            todorec.duedate = duedate.date
            todorec.checkmark = false
            saveContext()
            
            delegate?.toupdatetable()
   
        }
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
            
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    


}
