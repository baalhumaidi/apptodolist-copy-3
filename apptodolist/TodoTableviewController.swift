//
//  ViewController.swift
//  apptodolist
//
//  Created by admin on 18/12/2021.
//

import UIKit
import CoreData

class TodoTableviewController: UITableViewController {
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    // we call this function like normal: saveContext()
    // again, keep in mind that you can call it whatever you want, it doesn't have to be saveContext

    var todoobjects = [TodoList]()
   // var todorecords = [TodoList]() //[ title, tododesc , duedate, checkmark]
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoobjects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print (indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleCell", for: indexPath) as! SingleCell
        cell.todotitle?.text = todoobjects[indexPath.row].title
      
        cell.tododesc?.text = todoobjects[indexPath.row].tododesc
//        print(indexPath.row)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        cell.duedate?.text = formatter.string(from : todoobjects[indexPath.row].duedate!)
        
        // problem with deleting this   ******************
//        if let date = todoobjects[indexPath.row].duedate! {
//            cell.duedate?.text = formatter.string(from: date )}
        
        
        if todoobjects[indexPath.row].checkmark == true {
                       cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                  
        }
        else{
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        return cell
    }
    
    
    @IBAction func addingnewtask(_ sender: UIBarButtonItem) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ToAddViewController") as! ToAddViewController
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
        fetchdata()
  
    }
//
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        context.delete(todoobjects[indexPath.row])

        saveContext()
      //  tableView.reloadData()


    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoobjects[indexPath.row].checkmark = !todoobjects[indexPath.row].checkmark

        
        if     !todoobjects[indexPath.row].checkmark
        {  tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            print (todoobjects[indexPath.row].checkmark)
        }

        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            print (todoobjects[indexPath.row].checkmark)
        }
        saveContext()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    
    }
}

extension TodoTableviewController : adddelegate {
 
    
    func toupdatetable() {
       fetchdata()
        tableView.reloadData()
        
    }
    
    
}

//MARK: CoreData

extension TodoTableviewController {
    func fetchdata (){
     //   let array = [Todo]()
    
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "TodoList")
        do {
            todoobjects = try context.fetch(request) as! [TodoList]

        }catch
        {
            print (error.localizedDescription)
        }
    }
    
}
