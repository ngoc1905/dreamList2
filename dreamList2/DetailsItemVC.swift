//
//  DetailsItemVC.swift
//  dreamList2
//
//  Created by Ngoc Duong Phan on 11/5/16.
//  Copyright © 2016 Ngoc Duong Phan. All rights reserved.
//

import UIKit
import CoreData

class DetailsItemVC: UIViewController {
    
    
    var stores = [Store]()
    
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldPrice: UITextField!
    
    @IBOutlet weak var textFieldDescr: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func btnBack(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func savePassed(_ sender: AnyObject) {
    }
    
    @IBAction func btnDelete(_ sender: AnyObject) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self;
        pickerView.delegate = self;
        
        
//        let store = Store(context: context);
//        store.name = "";
//        let store1 = Store(context: context);
//        store1.name = "Smart Dev";
//        let store2 = Store(context: context);
//        store2.name = "Axon Active";
        
        appDelegate.saveContext()
        getStore()

    }
    
    
    func getStore() {
    
        let fetchRequest : NSFetchRequest<Store> = Store.fetchRequest();
        
        do
        {
            self.stores = try context.fetch(fetchRequest);
            self.pickerView.reloadAllComponents()
        } catch{
        
        }
    
    }
}

extension DetailsItemVC: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row];
        return store.name;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }

}
