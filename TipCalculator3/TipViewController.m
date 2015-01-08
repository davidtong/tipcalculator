//
//  TipViewController.m
//  TipCalculator3
//
//  Created by David Tong on 12/23/14.
//  Copyright (c) 2014 David Tong. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"


@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (IBAction)editingChanged:(id)sender;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // @NOTE(dtong) Add Settings button on init. Set default title and bind action
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    
    
    [self readAndSetUserDefaults];
}

- (void)viewWillAppear:(BOOL)animated {
    [self readAndSetUserDefaults];
    
    // set default focus
    [self.billTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
}

- (void)readAndSetUserDefaults {
    // Read from userDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger value = [defaults integerForKey:@"user_default_tip"];
    
    self.tipControl.selectedSegmentIndex = value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * @NOTE(dtong) Click handler of Settings button
 **/
- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    // @NOTE(dtong) Standard init stuff and set main app title
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 * @NOTE(dtong) Tap handler of main app
 **/
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    
    [self updateValues];
}

/**
 * @NOTE(dtong) Updates values using the selected user inputs
 **/
- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];

    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = tipAmount + billAmount;
    
    // set tip label and total label
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

/**
 * @NOTE(dtong) On Change handler of value input
 **/
- (IBAction)editingChanged:(id)sender {
    [self updateValues];
}

@end
