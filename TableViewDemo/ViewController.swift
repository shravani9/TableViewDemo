//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Shravani on 03/02/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ContentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fruits = ["apple","cherry","kiwi","lemon","mango","strawberry","watermelon","apple","cherry","kiwi","lemon","mango","strawberry","watermelon"]
        let fruitDescription = ["Red","Red","Green","Yellow","Yellow","Red","Red","Red","Red","Green","Yellow","Yellow","Red","Red"]
        var yPosition = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 5

        
        for i in 0...13 {
            // creating subviews
            let subView = ReusableView(frame: CGRect(x: 0, y: Int(yPosition), width: Int(UIScreen.main.bounds.width), height: 100))
            subView.backgroundColor = (i % 2 == 0) ? UIColor.red : UIColor.gray
            yPosition = yPosition + 100
            subView.nameLabel.text = fruits[i].capitalized
            subView.fruitImage.image = UIImage(named: fruits[i])
            subView.descriptionLabel.text = "\(fruits[i]) is \(fruitDescription[i]) in colour".capitalized
            ContentView.addSubview(subView)
            subView.tag = i
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
            leftSwipe.direction = .left
            tap.delegate = self
            subView.addGestureRecognizer(tap)
            subView.addGestureRecognizer(leftSwipe)
            print("999999999",yPosition)
        }
    }
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        // The alpha value of the cell changes on tap
        gestureRecognizer.view?.alpha = gestureRecognizer.view?.alpha == 1 ? 0.5 : 1
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .left
        {
            // Handling the view when user swipes left.
            let alert = UIAlertController(title: "Warning", message: "Would you like to delete the fruit?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                  switch action.style{
                  case .default:
                        print("default")
                  case .cancel:
                        print("cancel")
                  case .destructive:
                    if let viewWithTag = self.view.viewWithTag(sender.view!.tag){
                        viewWithTag.removeFromSuperview()
                    }
                    sender.view?.removeFromSuperview()
            }}))
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }

    }
}

