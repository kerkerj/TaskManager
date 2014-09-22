//
//  TaskDetailViewController.swift
//  Navigation
//
//  Created by Jerry Huang on 2014/9/22.
//  Copyright (c) 2014年 Jerry Huang. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    
    var task: Tasks? = nil
    @IBOutlet var txtDesc: UITextField!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task != nil {
            txtDesc.text = task?.desc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(sender: AnyObject) {
        
        if task != nil {
            editTask()
            println("edit")
        }else {
            createTask()
            println("create")
        }
        
        dismissViewController()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewController()
    }
    
    func dismissViewController() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func editTask() {
        task?.desc = txtDesc.text
        managedObjectContext?.save(nil)
    }
    
    func createTask() {
        let entityDescription = NSEntityDescription.entityForName("Tasks", inManagedObjectContext: managedObjectContext!)
        let task = Tasks(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        task.desc = txtDesc.text
        
        println(txtDesc.text)
        
        managedObjectContext?.save(nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
