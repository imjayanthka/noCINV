//
//  ViewController.swift
//  HealthApp
//
//  Created by Jayanth Kanugo on 6/6/16.
//  Copyright © 2016 Jayanth Kanugo. All rights reserved.
//

import UIKit
import ResearchKit
import SwiftHTTP

class ViewController: UIViewController {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var surveyButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func surveyTapped(sender : AnyObject) {
        
        
        if surveyButton.titleLabel?.text == "Survey" {
            let taskViewController = ORKTaskViewController(task: SurveyTask, taskRunUUID: nil)
            taskViewController.delegate = self
            presentViewController(taskViewController, animated: true, completion: nil)
        } else {
            resultLabel.enabled = false
            resultLabel.text = ""
            headingLabel.text = ""
            surveyButton.setTitle("Survey", forState: .Normal)
        
        }
    }
}


extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        taskViewController.currentStepViewController?.cancelButtonItem?.enabled = true
        
        if(reason == ORKTaskViewControllerFinishReason.Completed){
            var resultCollection = [String: String]()
            if let results = taskViewController.result.results {
                for result in results {
                    if let stepResult = result as? ORKStepResult{
                        let sresult =  stepResult.firstResult
                        if let choiceResult = sresult as? ORKChoiceQuestionResult {
                            if choiceResult.choiceAnswers![0] is String {
                                resultCollection["\(choiceResult.identifier)"] = choiceResult.choiceAnswers![0] as! String
                            } else {
                                resultCollection["\(choiceResult.identifier)"] = choiceResult.choiceAnswers![0].stringValue
                            }
                        } else if let numAnswerResult = sresult as? ORKNumericQuestionResult {
                            resultCollection["\(numAnswerResult.identifier)"] = numAnswerResult.numericAnswer?.stringValue
                        } else if let questionAnsResult = sresult as? ORKQuestionResult {
                            resultCollection["\(questionAnsResult.identifier)"] = questionAnsResult.answer?.stringValue
                        }
                    }
                }
            }
            print(resultCollection)
            let acuteResult: Bool
            let delayedResult: Bool
            switch resultCollection["chemotherapy_emetogenecity"] {
            case "1"?:
                headingLabel.text = "LEC"
                acuteResult = acuteLEC(resultCollection)
                delayedResult = delayLEC(resultCollection)
            case "2"?:
                headingLabel.text = "MEC"
                acuteResult = acuteMEC(resultCollection)
                delayedResult = delayedMEC(resultCollection)
            case "3"?:
                headingLabel.text = "HEC"
                acuteResult = acuteHEC(resultCollection)
                delayedResult = delayHEC(resultCollection)
            default:
                acuteResult = false
                delayedResult = false
            }
            if acuteResult {
                resultLabel.text = "Acute: High Risk Of CINV"
                resultCollection["cinv_outcome_acute"] = "1"
            } else {
                resultLabel.text = "Acute: CINV -Ve"
                resultCollection["cinv_outcome_acute"] = "0"
            }
            surveyButton.setTitle("Back", forState: .Normal)
            if delayedResult {
                resultLabel.text = resultLabel.text! + "\nDelayed: High Risk Of CINV"
                resultCollection["cinv_outcome_delayed"] = "1"
            } else {
                resultLabel.text = resultLabel.text! + "\nDelayed: CINV -Ve"
                resultCollection["cinv_outcome_delayed"] = "0"
            }
            let httpPost = HttpPost()
            if (httpPost.postFunc(createXmlString(resultCollection))) {
                print("Cool")
            } else {
                print("Not Cool")
            }
        }
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

