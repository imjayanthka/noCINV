//
//  SurveyTask.swift
//  HealthApp
//
//  Created by Jayanth Kanugo on 6/6/16.
//  Copyright © 2016 Jayanth Kanugo. All rights reserved.
//

import ResearchKit

public var SurveyTask: ORKOrderedTask {
    var steps = [ORKStep]()
    //Study ID
    let recordNumAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer)
    let nameQuestionStepTitle = "Study ID?"
    let nameQuestionStep = ORKQuestionStep(identifier: "study_id", title: nameQuestionStepTitle, answer: recordNumAnswerFormat)
    nameQuestionStep.optional = false
    steps += [nameQuestionStep]
    
    //Age
    let ageAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer)
    ageAnswerFormat.minimum = 0
    ageAnswerFormat.maximum = 120
    let ageQuestionStepTitle = "Age"
    let ageQuestionStep = ORKQuestionStep(identifier: "age", title: ageQuestionStepTitle, answer: ageAnswerFormat)
    ageQuestionStep.text = "Please enter your age!!"
    ageQuestionStep.optional = false
    steps += [ageQuestionStep]
    
    
    //SEX
    let genderQuestionStepTitle = "Sex of the Patient"
    let textChoices = [
        ORKTextChoice(text: "Male", value: "M"),
        ORKTextChoice(text: "Female", value: "F")
    ]
    let genderAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
    let genderQuestionStep = ORKQuestionStep(identifier: "sex", title: genderQuestionStepTitle, answer: genderAnswerFormat)
    genderQuestionStep.optional = false
    steps += [genderQuestionStep]
    
    //Race
    let raceQuestionStepTitle = "Race"
    let raceChoices = [
        ORKTextChoice(text: "Asian", value: "A"),
        ORKTextChoice(text: "Hispanic", value: "H"),
        ORKTextChoice(text: "White", value: "W"),
        ORKTextChoice(text: "Afircan American", value: "B")
    ]
    let raceAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:raceChoices)
    let raceQuestionStep = ORKQuestionStep(identifier: "race", title: raceQuestionStepTitle, answer: raceAnswerFormat)
    raceQuestionStep.optional = false
    steps += [raceQuestionStep]
    
    //BMI
    let bmiAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Decimal)
    bmiAnswerFormat.minimum = 0;
    let bmiQuestionStepTitle = "Body Mass Index(BMI) during chemotherapy"
    let bmiQuestionStep = ORKQuestionStep(identifier: "bmi", title: bmiQuestionStepTitle, answer: bmiAnswerFormat)
    bmiQuestionStep.optional = false
    steps += [bmiQuestionStep]
    //Type of cancer
    let typeOfCancerQuestionStepTitle = "Type of Cancer"
    let typeOfCancerChoices = [
        ORKTextChoice(text: "Breast Cancer", value: 1),
        ORKTextChoice(text: "Lung Cancer", value: 2),
        ORKTextChoice(text: "Colorectal and Anal Cancer", value: 3),
        ORKTextChoice(text: "Genitourinary Cancer", value: 4),
        ORKTextChoice(text: "Other Solid Cancers", value: 5),
        ORKTextChoice(text: "Leukemia both Acute and Chronic", value: 6),
        ORKTextChoice(text: "Myeloma", value: 7),
        ORKTextChoice(text: "Lymphoma both Acute and Chronic", value: 8),
        ORKTextChoice(text: "Other Heme Malignancies", value: 9)
        
    ]
    let typeOfCancerAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:typeOfCancerChoices)
    let typeOfCancerQuestionStep = ORKQuestionStep(identifier: "type_of_cancer", title: typeOfCancerQuestionStepTitle, answer: typeOfCancerAnswerFormat)
    typeOfCancerQuestionStep.optional = false
    steps += [typeOfCancerQuestionStep]
    
    
    //Stage
    let stageOfCancerQuestionStepTitle = "Stage of Cancer"
    let stageOfCancerChoices = [
        ORKTextChoice(text: "Stage 1", value: 1),
        ORKTextChoice(text: "Stage 2", value: 2),
        ORKTextChoice(text: "Stage 3", value: 3),
        ORKTextChoice(text: "Stage 4", value: 4)
        
    ]
    let stageOfCancerAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:stageOfCancerChoices)
    let stageOfCancerQuestionStep = ORKQuestionStep(identifier: "stage_of_cancer", title: stageOfCancerQuestionStepTitle, answer: stageOfCancerAnswerFormat)
    stageOfCancerQuestionStep.optional = false
    steps += [stageOfCancerQuestionStep]
    
    
    //No of Comorbidities
    let noOfComorbiditiesQuestionStepTitle = "Number of Comorbidities"
    let noOfComorbiditiesChoices = [
        ORKTextChoice(text: "1", value: 1),
        ORKTextChoice(text: "2", value: 2),
        ORKTextChoice(text: "3", value: 3),
        ORKTextChoice(text: "4", value: 4)
        
    ]
    let noOfComorbiditiesAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:noOfComorbiditiesChoices)
    let noOfComorbiditiesQuestionStep = ORKQuestionStep(identifier: "number_of_comorbidities", title: noOfComorbiditiesQuestionStepTitle, answer: noOfComorbiditiesAnswerFormat)
    noOfComorbiditiesQuestionStep.optional = false
    steps += [noOfComorbiditiesQuestionStep]
    
    //Emetogenecity of Chemotherapy
    let emChemoQuestionStepTitle = "Emetogenecity of Chemotherapy"
    let emChemoChoices = [
        ORKTextChoice(text: "LEC", detailText: "Low Emetogenic Chemotherapy", value: 1, exclusive: true),
        ORKTextChoice(text: "MEC", detailText: "Medium Emetogenic Chemotherapy", value: 2, exclusive: true),
        ORKTextChoice(text: "HEC", detailText: "High Emetogenic Chemotherapy", value: 3, exclusive: true)
        
    ]
    let emChemoAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:emChemoChoices)
    let emChemoQuestionStep = ORKQuestionStep(identifier: "chemotherapy_emetogenecity", title: emChemoQuestionStepTitle, answer: emChemoAnswerFormat)
    emChemoQuestionStep.optional = false
    steps += [emChemoQuestionStep]
    
    
    //Number of Chemo
    let priorChemoAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer)
    priorChemoAnswerFormat.minimum = 0
    priorChemoAnswerFormat.maximum = 4
    let priorChemoQuestionStepTitle = "Number of Prior Chemotherapy Regimen"
    let priorChemoQuestionStep = ORKQuestionStep(identifier: "number_of_prior_chemo", title: priorChemoQuestionStepTitle, answer: priorChemoAnswerFormat)
    priorChemoQuestionStep.optional = false
    steps += [priorChemoQuestionStep]
    
    //Prior CINV
    let historyQuestionStepTitle = "History of Previous CINV"
    let historyChoices = [
        ORKTextChoice(text: "Had No CINV(Grade 2 to 4) during the last cycle of Chemo", value: 0),
        ORKTextChoice(text: "Had CINV(Grade 2 to 4) during the last cycle of Chemo", value: 1)
        
    ]
    let historyAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:historyChoices)
    let historyQuestionStep = ORKQuestionStep(identifier: "prior_cinv", title: historyQuestionStepTitle, answer: historyAnswerFormat)
    historyQuestionStep.optional = false
    steps += [historyQuestionStep]
    
    //Dehydration Step
    let dehydrationQuestionStepTitle = "Did the patient have Dehydration during Chemotherapy?"
    let dehydrationChoices = [
        ORKTextChoice(text: "Yes", value: 1),
        ORKTextChoice(text: "No", value: 0)
        
    ]
    let dehydrationAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: dehydrationChoices)
    let dehydrationQuestionStep = ORKQuestionStep(identifier: "dehydration", title: dehydrationQuestionStepTitle, answer: dehydrationAnswerFormat)
    dehydrationQuestionStep.optional = false
    steps += [dehydrationQuestionStep]
    
    
    //Anxiety
    let anxietyQuestionStepTitle = "Did the patient have Anxiety during Chemotherapy?"
    let anxietyChoices = [
        ORKTextChoice(text: "Yes", value: 1),
        ORKTextChoice(text: "No", value: 0)
        
    ]
    let anxietyAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: anxietyChoices)
    let anxietyQuestionStep = ORKQuestionStep(identifier: "anxiety", title: anxietyQuestionStepTitle, answer: anxietyAnswerFormat)
    anxietyQuestionStep.optional =  false
    steps += [anxietyQuestionStep]
    
    //Smoker
    let smokerQuestionStepTitle = "Is the Patient a Current Smoker?"
    let smokerChoices = [
        ORKTextChoice(text: "Yes", value: 1),
        ORKTextChoice(text: "No", value: 0)
        
    ]
    let smokerAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: smokerChoices)
    let smokerQuestionStep = ORKQuestionStep(identifier: "current_smoker", title: smokerQuestionStepTitle, answer: smokerAnswerFormat)
    smokerQuestionStep.optional =  false
    steps += [smokerQuestionStep]
    
    
    let alcConsumptionQuestionStepTitle = "Alcohol Consumption"
    let alcConsumptionChoices = [
        ORKTextChoice(text: "LOW(two or less drinks per week) or NO alcohol consumption habit", value: 0),
        ORKTextChoice(text: "More than two drinks", value: 1)
        
    ]
    let alcConsumptionAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: alcConsumptionChoices)
    let alcConsumptionQuestionStep = ORKQuestionStep(identifier: "alcohol_consumption", title: alcConsumptionQuestionStepTitle, answer: alcConsumptionAnswerFormat)
    alcConsumptionQuestionStep.optional = false
    steps += [alcConsumptionQuestionStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}