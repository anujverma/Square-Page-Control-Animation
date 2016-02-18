//
//  ViewController.swift
//  Page Control Animation
//
//  Created by Anuj Verma on 1/24/16.
//  Copyright © 2016 Anuj Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [UIImage] = []
    var images2: [UIImage] = []

    var counter = 0
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        mainScrollView.delegate = self
        
        mainScrollView.contentSize.width = 750
        
        animateImage1()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        for i in 0...209 {
            
            let imageString = "AppointmentsAnimation_01_\(i)"
            let uiImage: UIImage! = UIImage(named: imageString)
            print(uiImage)
            images.append(uiImage)
            
        }

        
        for n in 0...269{
            let imageString = "AppointmentsAnimation_02_\(n)"
            let uiImage: UIImage! = UIImage(named: imageString)
            print(uiImage)
            images2.append(uiImage)
        }
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(mainScrollView.contentOffset.x)
    }

    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        if mainScrollView.contentOffset.x < 150 {
            print("Content offset inbetween 0 and 150")
            mainScrollView.contentOffset.x = 0
        }
    }
    

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        //Get the current page based on scroll offset
        var page:Int = Int(round(mainScrollView.contentOffset.x / 320))
        pageControl.currentPage = page
        
        
        if mainScrollView.contentOffset.x / 375 == 0 {
            animateImage1()
        } else if mainScrollView.contentOffset.x / 375 == 1 {
            animateImage2()
        }

    }
    
    
    func animateImage1() {
        
        for i in 0...209 {
            
            let imageString = "AppointmentsAnimation_01_\(i)"
            let uiImage: UIImage! = UIImage(named: imageString)
            print(uiImage)
            images.append(uiImage)
            
        }
        
        image1.animationImages = images
        image1.animationDuration = 0
        image1.animationRepeatCount = 1
        image1.startAnimating()
        image1.image = UIImage(named: "AppointmentsAnimation_01_209.png")
    }
    
    func animateImage2() {
        
        for n in 0...269 {
            let imageString = "AppointmentsAnimation_02_\(n)"
            let uiImage2: UIImage! = UIImage(named: imageString)
            print(uiImage2)
            images2.append(uiImage2)
        }
        
        image2.animationImages = images2
        image2.animationDuration = 0
        image2.animationRepeatCount = 1
        image2.startAnimating()
        
    }
    
    
}

