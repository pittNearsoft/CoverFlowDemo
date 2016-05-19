//
//  ViewController.swift
//  CoverFlow
//
//  Created by projas on 5/18/16.
//  Copyright © 2016 projas. All rights reserved.
//

import UIKit

enum Action: Int {
    case Playing
    case Paused
}

class CoverFlowViewController: UIViewController {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var coverFlowCollection: UICollectionView!
    var imageList = [String]()
    var artistList = [String]()
    var buttonAction = Action.Paused
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        coverFlowCollection.delegate = self
        coverFlowCollection.dataSource = self
        
        let nibName = UINib(nibName: CoverFlowCell.reuseIdentifier(), bundle:nil)
        coverFlowCollection.registerNib(nibName, forCellWithReuseIdentifier: CoverFlowCell.reuseIdentifier())
        
        imageList = [
            "aerosmith.jpg",
            "beyonce.jpg",
            "eminem.jpg",
            "santana.jpg",
            "pitbull.jpg",
            "queen.jpg",
            "rammstein.jpg",
            "rihanna.jpg",
            "rollingstones.jpg",
            "sonataArtica.jpg"
        ]
        
        artistList = [
            "Aerosmith",
            "Beyonce",
            "Eminem",
            "Santana",
            "Pitbull",
            "Queen",
            "Rammstein",
            "Rihanna",
            "Rolling Stones",
            "Sonata Artica"
        ]
        
        //Add a gradient background to superview
        let bgLayer: CAGradientLayer = BackgroundLayer.blueGradient()
        bgLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(bgLayer, atIndex: 0)
        
        //Make coverFlowCollection with transparent background
        self.coverFlowCollection.backgroundColor = UIColor.clearColor()
        self.coverFlowCollection.backgroundView = UIView.init(frame: CGRectZero)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopPlayAction(sender: AnyObject) {
        if buttonAction == .Paused {
            buttonAction = .Playing
            playButton.setTitle("❚❚", forState: .Normal)
        }else{
            buttonAction = .Paused
            playButton.setTitle("►", forState: .Normal)
        }
    }

}

extension CoverFlowViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imageList.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = coverFlowCollection.dequeueReusableCellWithReuseIdentifier(CoverFlowCell.reuseIdentifier(), forIndexPath: indexPath) as! CoverFlowCell
        cell.imageCover.image = UIImage(named: imageList[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentIndex = Int(self.coverFlowCollection.contentOffset.x / self.coverFlowCollection.frame.size.width)
        artistLabel.text = artistList[currentIndex]
    }
    
}


extension CoverFlowViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 375, height: 290)
    }

}

