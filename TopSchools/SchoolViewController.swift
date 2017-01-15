//
//  ScoolViewController.swift
//  TopSchools
//
//  Created by Younoussa Ousmane Abdou on 1/15/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class SchoolViewController: UIViewController, UISplitViewControllerDelegate {
    
    @IBAction private func showImage(sender: UIButton) {
        if let imageVC = splitViewController?.viewControllers.last as? ImageViewController {
            
            let imageName = sender.currentTitle
            imageVC.imageURL = DemoURL.GetToSchoolsURL(imageName: imageName)
            imageVC.navigationItem.title = imageName
        } else {
            
            performSegue(withIdentifier: MyStoryBoard.storyBoardSegue, sender: sender)
        }
    }
    
    private struct MyStoryBoard {
        
        static let storyBoardSegue = "Show Image"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == MyStoryBoard.storyBoardSegue {
            if let ImageVC = segue.destination.contentVC as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                
                ImageVC.imageURL = DemoURL.GetToSchoolsURL(imageName: imageName)
                ImageVC.navigationItem.title = imageName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        if primaryViewController.contentVC == self {
            
            if let imageVC = secondaryViewController.contentVC as? ImageViewController {
                
                if imageVC.imageURL == nil {
                    
                    return true
                }
            }
        }
        
        return false
    }
}

extension UIViewController {
    
    var contentVC: UIViewController {
        
        if let navCon = self as? UINavigationController {
            
            return navCon.visibleViewController ?? self
        } else {
            
            return self
        }
    }
}
