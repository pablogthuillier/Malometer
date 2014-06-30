//
//  DetailViewController.m
//  Malometer
//
//  Created by Pablo González Thuillier on 30/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "AgentEditViewController.h"
#import "Agent.h"

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
        
        assessmentValues = @[@"WTF",@"No way",@"Choose him",@"Assassin",@"God"];
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


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self addObserverForProperties];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self removeObserverForProperties];
    
}

#pragma mark - Observer

- (void)addObserverForProperties {
    [self addObserver:self forKeyPath:@"myAgent.destructionPower" options:0 context:nil];
    [self addObserver:self forKeyPath:@"myAgent.motivation" options:0 context:nil];
    [self addObserver:self forKeyPath:@"myAgent.assessment" options:0 context:nil];
}

- (void)removeObserverForProperties {
    [self removeObserver:self forKeyPath:@"myAgent.destructionPower"];
    [self removeObserver:self forKeyPath:@"myAgent.motivation"];
    [self removeObserver:self forKeyPath:@"myAgent.assessment"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"myAgent.destructionPower"]){
        [self updateDestructionPowerLabel];
    }
    else if([keyPath isEqualToString:@"myAgent.motivation"]){
        [self updateMotivationLabel];
    }
    else if([keyPath isEqualToString:@"myAgent.assessment"]){
        [self updateAssessmentLabel];
    }
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
    
    self.myAgent.destructionPower = destructionPower;
}

- (IBAction)changeMotivation:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    NSNumber *motivation = [NSNumber numberWithDouble:stepper.value];
    
    self.myAgent.motivation = motivation;
}


- (void)updateDestructionPowerLabel {
    NSString *destructionText = [destructionPowerValues objectAtIndex:[self.myAgent.destructionPower intValue]];
    self.destructionPowerLabel.text = [NSString stringWithFormat:@"%@",destructionText];
}

- (void)updateMotivationLabel {
    NSString *motivationText = [motivationValues objectAtIndex:[self.myAgent.motivation intValue]];
    self.motivationLabel.text = [NSString stringWithFormat:@"%@",motivationText];
}

- (void)updateAssessmentLabel {
    int assessment = [self.myAgent.assessment intValue];
    NSString *assessmentText = [assessmentValues objectAtIndex:assessment];
    self.assessmentLabel.text = [NSString stringWithFormat:@"%@",assessmentText];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
