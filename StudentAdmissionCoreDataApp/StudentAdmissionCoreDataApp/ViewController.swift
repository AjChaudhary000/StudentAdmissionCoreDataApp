//
//  ViewController.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        
        activity.color = .blue
        return activity
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myActivityIndicatorView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        myActivityIndicatorView.frame = CGRect(x: view.width / 2 - 20, y: view.height / 2 - 20, width:  40, height: 40)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkAuth()
        
    }
    
    
    @objc func checkAuth(){
        if let token = UserDefaults.standard.string(forKey: "LoginTokenKey"),
            let id  = UserDefaults.standard.string(forKey: "id"), let s_type  = UserDefaults.standard.string(forKey: "s_type"){
            print("\(token) ,name :- \(id)")
           
            if s_type == "Admin" {
                let vc = AdminHomeVC()
                let nv = UINavigationController(rootViewController: vc)
                nv.modalPresentationStyle = .fullScreen
                nv.setNavigationBarHidden(true, animated: true)
                present(nv,animated: true)
            }else if s_type == "User" {
                let vc = UserHomeVC()
                let nv = UINavigationController(rootViewController: vc)
                nv.modalPresentationStyle = .fullScreen
                nv.setNavigationBarHidden(true, animated: false)
                present(nv,animated: false)
            }
        }else{
            let vc = LoginVC()
            let nv = UINavigationController(rootViewController: vc)
            nv.modalPresentationStyle = .fullScreen
            nv.setNavigationBarHidden(true, animated: false)
            present(nv,animated: false)
        }
    }


}

