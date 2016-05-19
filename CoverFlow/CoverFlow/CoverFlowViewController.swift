//
//  ViewController.swift
//  CoverFlow
//
//  Created by projas on 5/18/16.
//  Copyright © 2016 projas. All rights reserved.
//

import UIKit


class CoverFlowViewController: UIViewController {

    @IBOutlet weak var coverFlowCollection: UICollectionView!
    var imageList = [String]()
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


}


extension CoverFlowViewController: UICollectionViewDelegate{
    
    
}

extension CoverFlowViewController: UICollectionViewDataSource{
    
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
    
}


//extension CoverFlowViewController: UICollectionViewDelegateFlowLayout{
//
//
////    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
////        return UIEdgeInsetsMake(0,0,0,0)  // top, left, bottom, right
////    }
////    
////    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
////        return 100.0
////    }
////
////    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
////        return 100.0
////    }
//
//}

