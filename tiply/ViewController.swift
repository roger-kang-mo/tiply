//
//  ViewController.swift
//  tiply
//
//  Created by Roger Kang Mo on 11/26/15.
//  Copyright © 2015 manservant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tipPercentages = [0.15, 0.20, 0.25]
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!

    func updateTotal() {
        let selectedTipPercentage = tipPercentages[tipSegment.selectedSegmentIndex]
        let amt = (billField.text! as NSString).doubleValue
        let tipAmt = selectedTipPercentage * amt
        let total = tipAmt + amt
        
        tipLabel.text = String(format: "$%.2f", tipAmt)
        totalLabel.text = String(format: "$%.2f", total)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text =  "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTipPercentageChange(sender: AnyObject) {
        updateTotal()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTotal()
    }

    @IBAction func onScreenTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

