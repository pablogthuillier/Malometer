//
//  DetailViewController.m
//  Malometer
//
//  Created by Pablo González Thuillier on 30/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "AgentEditViewController.h"

@interface AgentEditViewController ()



- (void)configureView;
@end

@implementation AgentEditViewController

NSArray *destructionPowerValues;
NSArray *motivationValues;
NSArray *assessmentValues;

static NSString *nameAttribute = @"name";
static NSString *destructionPowerAttribute = @"destructionPower";
static NSString *motivationAttribute = @"motivation";


#pragma mark - Managing the detail item

- (void)setMyAgent:(id)newDetailItem
{
    if (_myAgent != newDetailItem) {
        _myAgent = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.myAgent) {
        destructionPowerValues = @[@"Flower Power",@"RockStar",@"Death Metal",@"Satanic",@"Antichrist"];
        self.destructionPowerLabel.text = [destructionPowerValues objectAtIndex:0];
        
        motivationValues = @[@"Carbonita",@"Pesimist",@"Bruce Lee",@"Energy Drink",@"Hodor"];
        self.motivationLabel.text = [motivationValues objectAtIndex:0];
        
        assessmentValues = @[@"Do it yourself",@"Assassin",@"Choose him",@"WTF",@"God"];
        self.assessmentLabel.text = [assessmentValues objectAtIndex:0];


    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)cancelDetails:(id)sender {
    [self.delegate detailsViewController:self modifiedData:NO];
}
- (IBAction)saveDetails:(id)sender {
    [self changeNameAgent];
    [self.delegate detailsViewController:self modifiedData:YES];
    
    
}

- (void)changeNameAgent {
    NSString *name = self.nameField.text;
    [self.myAgent setValue:name forKey:nameAttribute];
    
}
- (IBAction)changeDestructionPower:(id)sender {
    
    UIStepper *stepper = (UIStepper *)sender;
    NSNumber *destructionPower = [NSNumber numberWithDouble:stepper.value];
    
    [self.myAgent setValue:destructionPower forKey:destructionPowerAttribute];
    
    [self updateDestructionPowerLabel];
    [self updateAssessmentLabel];
}

- (IBAction)changeMotivation:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    NSNumber *motivation = [NSNumber numberWithDouble:stepper.value];
    
    [self.myAgent setValue:motivation forKey:motivationAttribute];
    [self updateMotivationLabel];
    [self updateAssessmentLabel];
}

- (int)calculateAssessment {
    NSNumber *destructionPower = [self.myAgent valueForKey:destructionPowerAttribute];
    NSNumber *motivation = [self.myAgent valueForKey:motivationAttribute];
    
    return ([destructionPower intValue] + [motivation intValue]) / 2;
}

- (void)updateDestructionPowerLabel {
    NSNumber *destructionPower = [self.myAgent valueForKey:destructionPowerAttribute];
    NSString *destructionText = [destructionPowerValues objectAtIndex:[destructionPower intValue]];
    self.destructionPowerLabel.text = [NSString stringWithFormat:@"%@",destructionText];
}

- (void)updateMotivationLabel {
    NSNumber *motivation = [self.myAgent valueForKey:motivationAttribute];
    NSString *motivationText = [motivationValues objectAtIndex:[motivation intValue]];
    self.motivationLabel.text = [NSString stringWithFormat:@"%@",motivationText];
}

- (void)updateAssessmentLabel {
    int assessment = [self calculateAssessment];
    NSString *assessmentText = [assessmentValues objectAtIndex:assessment];
    self.assessmentLabel.text = [NSString stringWithFormat:@"%@",assessmentText];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
