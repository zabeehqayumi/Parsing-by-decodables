//
//  ViewController.swift
//  Parsing by decodables
//
//  Created by Zabeehullah Qayumi on 9/21/18.
//  Copyright © 2018 Zabeehullah Qayumi. All rights reserved.
//

import UIKit

struct Course : Decodable {
    let id: Int
    let name : String
    let link : String
    let imageUrl : String
    
    
//    init (json : [String : Any]){
//        
//        id = json["id"] as? Int ?? 1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//        
//        
//    }
}


class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // perhaps check the error
            //check response status 200 OK
            
            
            guard let data = data else {return}
            
//
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            do{
                
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course.name)
                
                
                
                
                // tradition way of swift 2 and 3
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else {return}
//                let course = Course(json: json)
//                print(course.name)
//
                
            }catch{
                print("Error serializing json : \(error.localizedDescription)")
            }
            
            
        
            
         
        }.resume()

    }


}

