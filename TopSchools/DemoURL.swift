//
//  DemoURL.swift
//  TopSchools
//
//  Created by Younoussa Ousmane Abdou on 1/15/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

struct DemoURL {
    
    static let StanforURL = "https://static1.squarespace.com/static/574bf85e3c44d8bd12ba29d6/t/57fd5aeae58c628485b8edea/1476221677355/stanford.jpg?format=1500w"

    static let TopSchoolsURL = [
    
        "Stanford": "https://static1.squarespace.com/static/574bf85e3c44d8bd12ba29d6/t/57fd5aeae58c628485b8edea/1476221677355/stanford.jpg?format=1500w",
        "MIT": "http://i.huffpost.com/gen/2736712/images/o-MIT-facebook.jpg",
        "Harvard": "http://i4.mirror.co.uk/incoming/article9193776.ece/ALTERNATES/s1200/Harvard-University.jpg"
    ]
    
    static func GetToSchoolsURL(imageName: String?) -> URL? {
        
        if let urlString = TopSchoolsURL[imageName ?? ""] {
            
            return NSURL(string: urlString) as URL?
        } else {
            
            return nil
        }
    }
    
}
