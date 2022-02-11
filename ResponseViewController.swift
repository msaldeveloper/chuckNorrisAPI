//
//  ResponseViewController.swift
//  testApp
//
//  Created by Mario Saldana on 09/02/22.
//

import UIKit

class ResponseViewController: UIViewController{
        
    var image : UIImageView?
    var fraseLabel : UILabel?
    var prase2 : String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUi()
        view.backgroundColor = UIColor.random
        
    }
    
    func initUi(){
        
        image = UIImageView()
        image?.image = UIImage(named: "")
        let urlImage = "https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png"
        if let url = NSURL(string: urlImage) {
            print(type(of: url), url)
            if let data = NSData(contentsOf: url as URL) {
                self.image?.image = UIImage(data: data as Data)
                self.image?.layer.cornerRadius = 10
                self.image?.layer.masksToBounds = true
          }
        }
        view.addSubview(image!)
        image?.addAnchorsAndSize(width: nil, height: 200, left: 35, top: 150, right: 35, bottom: nil)
        
        fraseLabel = UILabel()
        fraseLabel?.text = prase2
        fraseLabel?.numberOfLines = 0
        fraseLabel?.sizeToFit()
        fraseLabel?.font = UIFont.textFont2
        fraseLabel?.backgroundColor = .clear
        fraseLabel?.textAlignment = .center
        view.addSubview(fraseLabel!)
        fraseLabel?.addAnchorsAndSize(width: nil, height: 140, left: 10, top: 15, right: 10, bottom: nil, withAnchor: .top, relativeToView: image)
    }
    
}
extension ResponseViewController: ChuckViewDelegate {
    func recivePhrase(_ message: String) {
        self.fraseLabel?.text = message
    }
}


