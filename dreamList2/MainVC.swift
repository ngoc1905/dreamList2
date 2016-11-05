//
//  ViewController.swift
//  dreamList2
//
//  Created by Ngoc Duong Phan on 11/5/16.
//  Copyright © 2016 Ngoc Duong Phan. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    
    let cellID = "Cell";
    
    var controller : NSFetchedResultsController<Item>!   ;
    
    @IBAction func segmentPassed(_ sender: AnyObject) {
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
        
        
//        generateTestData()
        attemptFetch()
           }
    
    
    func attemptFetch() {
     
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest();
        let dataSort = NSSortDescriptor(key: "created", ascending: false);
        fetchRequest.sortDescriptors = [dataSort];
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil);
        
        
        controller.delegate = self;
        self.controller = controller;
        
        do {
        try controller.performFetch()
        } catch {
        let error = error as NSError
            print(error);
        }
    
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates();
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath) {
        
        let item = controller.object(at: indexPath as IndexPath);
        cell.configureCell(item: item);
    
        }
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade);
            }
            break
        case .delete :
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade);
            }
            break
        case .move :
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade);
            }
            if let indexPath = newIndexPath {
            tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath);
                
                configureCell(cell: cell as! ItemCell, indexPath: indexPath as NSIndexPath);
                //update data
            
            }
            break
              }
    }
    
    func generateTestData(){
        let item = Item(context: context);
        item.price = 18000;
        item.title = "Omo"
        item.details = "Clean clothes"
      
        
        do {
    try context.save()
        } catch {
        
        }
    }


}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let section = controller.sections {
        return section.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section];
            return sectionInfo.numberOfObjects
        }
        
        return 0 ;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ItemCell;
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath);
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }


}

