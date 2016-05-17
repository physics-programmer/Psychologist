//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Salim Mimouni on 16/05/2016.
//  Copyright © 2016 Salim Mimouni. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate
{
    
    override var happiness:Int {
        
        didSet {
            //diagnosticHistory.append(happiness)
            diagnosticHistory += [happiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory : [Int] {
        
        get { return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []}
        set { defaults.setObject(newValue, forKey: History.DefaultsKey) }
    }
    
    private struct History {
        
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                        
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

    
}
