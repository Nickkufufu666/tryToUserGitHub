//
//  ViewController.swift
//  ExerciseForSwift
//
//  Created by kufufu on 16/8/16.
//  Copyright © 2016年 kufufu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var midLabel: UILabel?
    var array: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        midLabel = UILabel.init(frame: CGRectMake(10, 90, 140, 20))
//        let slider = UISlider.init(frame: CGRectMake(10, 50, 355, 30))
//        
//        slider.continuous = true
//        slider.maximumTrackImageForState(.Highlighted)
//        slider.addTarget(self, action: #selector(ViewController.moveTheSlider(_:)), forControlEvents: .ValueChanged)
//        
//        self.view.addSubview(midLabel!)
//        self.view.addSubview(slider)
        
        //布局
        let collectionViewFlowLayout = UICollectionViewFlowLayout.init()
        //布局方向: 垂直流布局
        collectionViewFlowLayout.scrollDirection = .Horizontal
        //每个item的大小
        collectionViewFlowLayout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width / 3 - 20, 50)
        //创建一个collectionView是根据上面的layout来布局的
        let colletctionView = UICollectionView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), collectionViewLayout: collectionViewFlowLayout)
        colletctionView.delegate = self
        colletctionView.dataSource = self
        //注册item类型 这里使用系统的类型
        colletctionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
//        colletctionView.allowsSelection = true
        colletctionView.multipleTouchEnabled = true
        colletctionView.allowsMultipleSelection = true
        self.view.addSubview(colletctionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.init(colorLiteralRed: Float(arc4random()%255) / 255.0, green: Float(arc4random()%255) / 255.0, blue: Float(arc4random()%255) / 255.0, alpha: 1)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        array = collectionView.indexPathsForSelectedItems()
        for a in array! {
            print(a)
        }
    }
    
    func moveTheSlider(sender: UISlider) -> Void {
        midLabel!.text = String(format: "%.2f", sender.value)
        print(sender.value)
    }
}

