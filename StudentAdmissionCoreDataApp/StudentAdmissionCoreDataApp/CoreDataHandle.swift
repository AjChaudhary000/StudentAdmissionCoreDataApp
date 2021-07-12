//
//  CoreDataHandle.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import UIKit
import Foundation
import CoreData
class CoreDataHandle {
    static let shared = CoreDataHandle()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext : NSManagedObjectContext?
    private init (){
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    func save (){
        appDelegate.saveContext()
    }
    func stud_insert(s_type:String,s_name:String,password:String,mobileno:Int,address:String, completion: @escaping () -> Void)  {
        let stud = STUDENT(context: managedObjectContext!)
        stud.s_type = s_type
        stud.s_name = s_name
        stud.password = password
        stud.mobile_no = Int64(mobileno)
        stud.address = address
        
        save()
        completion()
    }
    func stud_update(stud: STUDENT,s_type:String,s_name:String,password:String,mobileno:Int,address:String, completion: @escaping () -> Void)  {
        
        stud.s_type = s_type
        stud.s_name = s_name
        stud.password = password
        stud.mobile_no = Int64(mobileno)
        stud.address = address
        
        save()
        completion()
    }
    func stud_delete(stud:STUDENT, completion: @escaping () -> Void)  {
        
        managedObjectContext?.delete(stud)
        
        save()
        completion()
    }
    func stud_fatch()->[STUDENT]{
        let fatchRequest:NSFetchRequest<STUDENT> = STUDENT.fetchRequest()
        do{
            let studarray = try managedObjectContext?.fetch(fatchRequest)
            return studarray!
            
        }catch{
            print(error)
            return [STUDENT]()
        }
    }
    
    func notice_insert(n_name:String,n_detail:String, completion: @escaping () -> Void)  {
        let not = NOTICE(context: managedObjectContext!)
        not.nname = n_name
        not.ndetail = n_detail
        
        
        save()
        completion()
    }
    func notice_update(not:NOTICE,n_name:String,n_detail:String, completion: @escaping () -> Void)  {
        
        not.nname = n_name
        not.ndetail = n_detail
        
        save()
        completion()
    }
    func notice_delete(not:NOTICE, completion: @escaping () -> Void)  {
        
        managedObjectContext?.delete(not)
        
        save()
        completion()
    }
    func notice_fatch()->[NOTICE]{
        let fatchRequest:NSFetchRequest<NOTICE> = NOTICE.fetchRequest()
        do{
            let notarray = try managedObjectContext?.fetch(fatchRequest)
            return notarray!
            
        }catch{
            print(error)
            return [NOTICE]()
        }
    }
    
}
