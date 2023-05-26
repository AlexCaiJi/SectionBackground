//
//  ViewController.swift
//  SectionBackground
//
//  Created by ZCAdmin on 2020/7/15.
//

import UIKit

public let KScreenW = UIScreen.main.bounds.size.width
public let KScreenH = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    static let HADERVIEW_H:CGFloat = 150
    private var imgs = ["https://img1.baidu.com/it/u=1960110688,1786190632&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=281",
                        "https://img0.baidu.com/it/u=4162443464,2854908495&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
                        "https://lmg.jj20.com/up/allimg/tp09/210H51R3313N3-0-lp.jpg"]
    
    
    private var background_imgs = ["https://img2.baidu.com/it/u=1361506290,4036378790&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
                                   "https://img0.baidu.com/it/u=1626237702,720888304&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
                                   "https://img2.baidu.com/it/u=2048195462,703560066&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333"]
    
    private lazy var layout = SectionDecorationLayout().then {
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 0
        $0.decorationDelegate = self
        $0.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    private lazy var collV = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout).then {
        $0.backgroundColor = UIColor.clear
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.COMMONEPRODUCT_CID)
        $0.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        view.addSubview($0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


}

extension ViewController {
    private func setupView() {
        collV.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}


extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SectionDecorationLayoutDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return imgs.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.COMMONEPRODUCT_CID, for: indexPath) as! ProductCell
        if indexPath.section == 0 {
            if indexPath.row < 3 {
                cell.imgView.kf.setImage(with: URL(string: imgs[indexPath.row]))
            } else {
                
                cell.imgView.kf.setImage(with: URL(string: "https://img03.sogoucdn.com/app/a/100520021/ff5eee1cac0eb94a99c92e3774d6c600"))
            }
            
        } else {
            cell.imgView.kf.setImage(with: URL(string: imgs[indexPath.row]))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let W:CGFloat =  (KScreenW - 50) / 3
        return  CGSize(width: W, height:W)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let h = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
            h.backgroundColor = .clear
            return h
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: KScreenW, height:  200)
        } else {
            return CGSize(width: KScreenW, height:  ViewController.HADERVIEW_H)
        }
        
    }
            
    
    
    
    /// SectionDecorationLayoutDelegate
    /// 是否显示单独设置 Section 背景颜色
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: SectionDecorationLayout, decorationColorForSectionAt section: Int) -> UIColor {
        switch section {
        case 0:
            return UIColor.systemPink
        case 1:
            return UIColor.init(red: 196/255.0, green: 26/255.0, blue: 187/255.0, alpha: 1)
        case 2:
            return UIColor.systemIndigo
        case 3:
            return UIColor.cyan
        case 4:
            return UIColor.lightGray
        default:
            return UIColor.systemBlue
        }
    }
    
    
    /// 是否显示 Section 背景图
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationLayout,
                        decorationImgaeDisplayedForSectionAt section: Int) -> Bool {
        return true
    }
    
    /// 获取 Section 背景图
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationLayout,
                        decorationImageForSectionAt section: Int) -> String? {
        switch section {
        case 0:
            return background_imgs[0]
        case 1:
            return nil
        case 2:
            return nil
        case 3:
            return nil
        case 4:
            return background_imgs[1]
        default:
            return background_imgs[2]
        }
    }
    
   
    /// 设置背景图的边距
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout:SectionDecorationLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    /// 获取 Section Header 宽高 (设置section背景图是否占据头的size)
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout:SectionDecorationLayout,
                        headerForSectionAt section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: KScreenW, height:  200)
        } else {
            return CGSize(width: KScreenW, height:  ViewController.HADERVIEW_H)
        }
    }
}
