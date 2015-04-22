//
//  PartyViewController.swift
//  Park View
//
//  Created by Fhict on 13/04/15.
//  Copyright (c) 2015 Chris Wagner. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {

    @IBOutlet weak var partyTitle: UILabel!
    @IBOutlet weak var partyLocation: UILabel!
    @IBOutlet weak var partyName: UILabel!
    @IBOutlet weak var partyGenre: UILabel!
    @IBOutlet weak var partyArtistName: UILabel!
    @IBOutlet weak var partyTime: UILabel!
    @IBOutlet weak var partyAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPartyProperties(title : NSString, location : NSString, partyTitle : NSString, partyGenre : NSString, partyArtist : NSString, partyTime : NSString, partyAge  : Int) {
        self.partyTitle.text = title
        self.partyName.text = partyTitle
        self.partyLocation.text = location
        self.partyGenre.text = partyGenre
        self.partyArtistName.text = partyArtist
        self.partyTime.text = partyTime
        self.partyAge.text = String(partyAge) + "+"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
