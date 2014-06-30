//
//  DetailViewController.h
//  Malometer
//
//  Created by Pablo González Thuillier on 30/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DismissProtocol.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id myAgent;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *assessmentLabel;
@property (weak, nonatomic) IBOutlet UIStepper *destructionPowerStepper;
@property (weak, nonatomic) IBOutlet UIStepper *motivationStepper;
@property (weak, nonatomic) IBOutlet UILabel *destructionPowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *motivationLabel;

@property (nonatomic,strong) id<DismissProtocol> delegate;

@end
