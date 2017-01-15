//
//  ImageViewController.swift
//  TopSchools
//
//  Created by Younoussa Ousmane Abdou on 1/15/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    // Variables/Constants/Computed Properties
    
    var imageURL: URL? {
        didSet {
            
            image = nil
            
            if view.window != nil {
                
                fetchImage()
            }
        }
    }
    
    // Outlets
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            
            scrollView?.contentSize = imageView.frame.size
            scrollView?.minimumZoomScale = 0.3
            scrollView?.maximumZoomScale = 1.5
            scrollView?.delegate = self
        }
    }
    
    @IBOutlet private var spinner: UIActivityIndicatorView!
    
    // Actions
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            
            return imageView.image
        }
        set {
            
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
    }
    
    // Functions
    
    private func fetchImage() {
        
        if let url = imageURL {
            
            spinner?.startAnimating()
            
            DispatchQueue.global(qos: .userInitiated).async {
                let contentURL = NSData(contentsOf: url)
                
                DispatchQueue.main.async {
                    if url == self.imageURL {
                        
                        if let imageData = contentURL {
                            
                            self.image = UIImage(data: imageData as Data)
                        } else {
                            
                            self.spinner?.stopAnimating()
                        }
                    }
                    
                }
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if image == nil {
            
            fetchImage()
        }
    }
}
