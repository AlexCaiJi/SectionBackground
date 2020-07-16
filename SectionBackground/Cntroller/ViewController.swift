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
    private var imgs = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594826745546&di=5d0ba3afc75910304c18dd40e3f269c2&imgtype=0&src=http%3A%2F%2F01.minipic.eastday.com%2F20170104%2F20170104151754_edeffcf48cbe18f87d4f4c1c6c381c7b_1.jpeg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594826745545&di=7774eec88ed2ebeeb42f499676185e69&imgtype=0&src=http%3A%2F%2F00.minipic.eastday.com%2F20161210%2F20161210143050_7096c2f7d732d7afb7f0c4c6a357595d_10.jpeg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594826745545&di=7076816ab7426036ee956539f80d553e&imgtype=0&src=http%3A%2F%2F00.minipic.eastday.com%2F20161216%2F20161216093731_399df0a518f7932d349ba3bb0a8ab3da_1.jpeg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594826745534&di=d5a9518a114bbacc618bd7dd83a9ba6b&imgtype=0&src=http%3A%2F%2F01.minipic.eastday.com%2F20161212%2F20161212144027_cded4c83f17c47604eb2be0530bb43ba_7.jpeg"]
    
    
    private var background_imgs = ["https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1039784932,1678053317&fm=26&gp=0.jpg","https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1665068531,1355511799&fm=26&gp=0.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594827505308&di=2b14600c668905c55c8c9fa744c917d6&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fe%2F59ae7117358a6.jpg%3Fdown"]
    
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
            return 15
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
                
                cell.imgView.kf.setImage(with: URL(string: "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4231721538,2399882538&fm=26&gp=0.jpg"))
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
