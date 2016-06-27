//
//  AlgoFunctions.swift
//  HealthApp
//
//  Created by Jayanth Kanugo on 6/21/16.
//  Copyright © 2016 Jayanth Kanugo. All rights reserved.
//

import Foundation


func delayedMEC(data: [String: String]) -> Bool{
    if data["dehydration"] == "0" {
        //Yes
        if data["anxiety"] == "0" {
            //yes
            return true
        } else {
            switch data["number_of_prior_chemo"] {
            case "0"?:
                //n(38.0/5.0)
                return false
            case "1"?:
                return true
            case "2"?:
                //y(9.0/2.0)
                return true
            case "3"?:
                //y(4.0)
                return true
            case "4"?:
                //n(0.0)
                return true
            default:
                return false
            }
        }
    } else {
        if data["anxiety"] == "0" {
            //yes
            if data["prior_cinv"] == "1" {
                //yes
                switch data["stage_of_cancer"] {
                case "1"?:
                    switch data["number_of_prior_chemo"] {
                    case "0"?:
                        //n(38.0/5.0)
                        return true
                    case "1"?:
                        return false
                    case "2"?:
                        //y(9.0/2.0)
                        return false
                    case "3"?:
                        //y(4.0)
                        return false
                    case "4"?:
                        //n(0.0)
                        return false
                    default:
                        return false
                    }
                case "2"?:
                    if data["sex"] == "0" {
                        return true
                    } else {
                        return false
                    }
                case "3"?:
                    return false
                case "4"?:
                    return false
                default:
                    return false
                }
            } else {
                //no
                if data["current_smoker"] == "1" {
                    return false
                } else {
                    if data["alcohol_consumption"] == "0" {
                        return true
                    } else {
                        return false
                    }
                }
            }
        } else {
            return false
        }
    }
}


func acuteMEC(data: [String: String]) -> Bool{
    if data["anxiety"] == "0" {
        if data["dehydration"] == "0" {
            //y(340/11)
            return true
        } else {
            if data["prior_cinv"] == "1" {
                //y(88.0/18.0)
                return true
            } else {
                switch data["number_of_prior_chemo"] {
                case "0"?:
                    //n(38.0/5.0)
                    return false
                case "1"?:
                    if data["alcohol_consumption"] == "1" {
                        //n(7.0)
                        return false
                    } else {
                        if data["current_smoker"] == "1" {
                            //y(3.0)
                            return true
                        } else {
                            //n(3.0)
                            return false
                        }
                    }
                case "2"?:
                    //y(9.0/2.0)
                    return true
                case "3"?:
                    //y(4.0)
                    return true
                case "4"?:
                    //n(0.0)
                    return false
                default:
                    return false
                }
            }
        }
    } else {
        if data["prior_cinv"] == "1" {
            if data["dehydration"] == "0" {
                if data["current_smoker"] == "0" {
                    //y(38/4)
                    return true
                } else {
                    if data["alcohol_consumption"] == "0" {
                        //y(22/8)
                        return true
                    } else {
                        //n(17/3)
                        return false
                    }
                }
            } else {
                //n(139/24)
                return false
            }
        } else {
            //n(304/13)
            return false
        }
    }
}

func acuteLEC(data: [String: String]) -> Bool {
    if data["prior_cinv"] == "1" {
        //yes
        if data["current_smoker"] == "0" {
            //y(38/4)
            return true
        } else {
            //no
            if data["anxiety"] == "0" {
                //yes dehyd
                if data["dehydration"] == "0" {
                    //yes
                    return true
                } else {
                    //no
                    switch data["number_of_prior_chemo"] {
                    case "0"?:
                        return false
                    case "1"?:
                        return false
                    case "2"?:
                        return true
                    case "3"?:
                        return true
                    case "4"?:
                        return false
                    default:
                        return false
                    }
                }
            } else {
                //no age
                if Int(data["age"]!) > 69 {
                    return true
                } else {
                    return false
                }
            }
        }
    } else {
        //no
        if data["current_smoker"] == "0" {
            //yes dehydration
            if data["dehydration"] == "0" {
                //yes
                return true
            } else {
                if data["anxiety"] == "0" {
                    switch data["number_of_prior_chemo"] {
                    case "0"?:
                        return false
                    case "1"?:
                        switch data["stage_of_cancer"] {
                        case "1"?:
                            return false
                        case "2"?:
                            return true
                        case "3"?:
                            return true
                        case "4"?:
                            return true
                        default:
                            return false
                        }
                    case "2"?:
                        return true
                    case "3"?:
                        return false
                    case "4"?:
                        return true
                    default:
                        return false
                    }
                } else {
                    return false
                }
            }
        } else {
            //no
            return false
        }
    }
}


func delayLEC(data: [String: String]) -> Bool {
    switch data["number_of_prior_chemo"] {
    case "0"?:
        if data["prior_cinv"] == "1" {
            //yes smoker
            if data["current_smoker"] == "0" {
                //yes bmi
                if Int(data["bmi"]!) > 36 {
                    if data["dehydration"] == "0" {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return true
                }
            } else {
                //no anxiety
                if data["anxiety"] == "0" {
                    if data["alcohol_consumption"] == "0" {
                        return true
                    } else {
                        if data["sex"] == "0" {
                            return false
                        } else {
                            return true
                        }
                    }
                } else {
                    return false
                }
            }
        } else {
            //no dehyd
            if data["dehydration"] == "0"{
                if data["alcohol_consumption"] == "0" {
                    if data["sex"] == "0" {
                        //Male
                        return false
                    } else {
                        return true
                    }
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    case "1"?:
        if data["dehydration"] == "0"{
            //yes
            return true
        } else {
            if data["current_smoker"] == "0" {
                if Int(data["bmi"]!) > 36 {
                    return true
                } else {
                    if data["anxiety"] == "0"{
                        return true
                    } else {
                        return false
                    }
                }
            } else {
                return false
            }
        }
    case "2"?:
        return true
    case "3"?:
        return true
    case "4"?:
        return true
    default:
        return false
    }
}


func acuteHEC(data: [String: String]) -> Bool {
    if data["dehydration"] == "0" {
        if data["anxiety"] == "0" {
            return true
        } else {
            if data["prior_cinv"] == "1" {
                return true
            } else {
                if data["current_smoker"] == "0" {
                    if Int(data["bmi"]!) > 28 {
                        return false
                    } else {
                        return true
                    }
                } else {
                    return false
                }
            }
        }
    } else {
        if data["prior_cinv"] == "1" {
            if data["anxiety"] == "0" {
                if data["current_smoker"] == "0" {
                    return true
                } else {
                    switch data["number_of_prior_chemo"] {
                    case "0"?:
                        return false
                    case "1"?:
                        if Int(data["bmi"]!) > 30 {
                            return false
                        } else {
                            return true
                        }
                    case "2"?:
                        return true
                    case "3"?:
                        return false
                    case "4"?:
                        return true
                    default:
                        return false
                    }
                }
            } else {
                return false
            }
        } else {
            return false
        }
    }
}


func delayHEC(data: [String: String]) -> Bool {
    if data["dehydration"] == "0" {
        switch data["number_of_comorbidities"] {
        case "1"?:
            if data["current_smoker"] == "0" {
                //anx
                if data["anxiety"] == "0" {
                    if data["prior_cinv"] == "1" {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            } else {
                //stage
                switch data["stage_of_cancer"] {
                case "1"?:
                    return false
                case "2"?:
                    return true
                case "3"?:
                    if data["alcohol_consumption"] == "0" {
                        return true
                    } else {
                        return false
                    }
                case "4"?:
                    return true
                default:
                    return false
                }
            }
        case "2"?:
            if data["anxiety"] == "0" {
                return true
            } else {
                if data["current_smoker"] == "0" {
                    return false
                } else {
                    switch data["stage_of_cancer"] {
                    case "1"?:
                        if data["alcohol_consumption"] == "0" {
                            return true
                        } else {
                            return false
                        }
                    case "2"?:
                        return false
                    case "3"?:
                        if data["prior_cinv"] == "1" {
                            return false
                        } else {
                            if data["sex"] == "0" {
                                if Int(data["age"]!) > 55 {
                                    return false
                                } else {
                                    return true
                                }
                            } else {
                                return true
                            }
                        }
                    case "4"?:
                        return false
                    default:
                        return false
                    }
                }
            }
        case "3"?:
            if data["current_smoker"] == "0" {
                return true
            } else {
                switch data["race"] {
                case "0"?:
                    return false
                case "1"?:
                    return false
                case "2"?:
                    return true
                case "3"?:
                    return false
                default:
                    return false
                }
            }
        case "4"?:
            return true
        default:
            return false
        }
    } else {
        switch data["number_of_comorbidities"] {
        case "1"?:
            return false
        case "2"?:
            if data["anxiety"] == "0" {
                if data["current_smoker"] == "0" {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        case "3"?:
            return false
        case "4"?:
            return true
        default:
            return false
        }
    }
}


