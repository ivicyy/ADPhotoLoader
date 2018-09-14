//
//  ViewController.swift
//  ADPhotoLoaderDemo
//
//  Created by 李家斌 on 2018/9/14.
//  Copyright © 2018年 李家斌. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    // 网络图片
    let imagesWeb = NSArray(array: [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536569709794&di=942c0f04efb9dfdf7fcddef23d37dce6&imgtype=0&src=http%3A%2F%2Fbangimg1.dahe.cn%2Fforum%2Fpw%2FMon_1112%2F445_517996_04e69d1be28b439.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536138710020&di=ff98e17de2ab7c3088182b4a227f8dac&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1408%2F28%2Fc1%2F37950569_1409156831122_800x800.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536138767193&di=5be964c456d7abbd7d4ea68bb112c49d&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1606%2F30%2Fc3%2F23589301_1467290861869_800x800.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536733512&di=691993f345083ac8bb79ab19ce71a50b&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1601%2F31%2Fc0%2F18075531_1454249261384_800x800.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536138810236&di=0b993858f7bd97cd8bc7284c7db7a064&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1606%2F30%2Fc2%2F23579206_1467279001712_800x800.jpg"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.backgroundColor = .clear
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.bounces = true
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: 0, height: self.view.frame.width * CGFloat(self.imagesWeb.count))
        
        for i in 0 ..< imagesWeb.count {
            let url = imagesWeb[i] as! String
            
            ADPhotoLoader.share.loadImage(url: url, complete: {[weak self](data: Data?, url: String) in
                if data != nil {
                    let imgView = UIImageView(frame: CGRect(x: 0, y: CGFloat(i) * (self?.view.frame.width)!, width: (self?.view.frame.width)!, height: (self?.view.frame.width)!))
                    imgView.image = UIImage(data: data!)
                    
                    self?.scrollView.addSubview(imgView)
                }
            })
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    
}

