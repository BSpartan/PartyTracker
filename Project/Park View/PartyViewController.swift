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
    
    func setPartyProperties() {
        self.partyTitle.text = "Testnaam"
        self.partyLocation.text = "Eindhoven"
        self.partyGenre.text = "Hardstyle"
        self.partyArtistName.text = "Naam1  Naam1  Naam3  Naam4  Naam5  Naam6  Naam7"
        self.partyTime.text = "06-07-2015 12:00 - 00:00"
        self.partyAge.text = "16+"
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
