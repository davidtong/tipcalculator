//
//  SettingsViewController.m
//  TipCalculator3
//
//  Created by David Tong on 1/2/15.
//  Copyright (c) 2015 David Tong. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController()
@property (strong, nonatomic) NSArray *tipValues;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *data = [[NSArray alloc] initWithObjects:@"10%", @"15%", @"20%", nil];
    self.tipValues = data;
    
    // Read from userDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger value = [defaults integerForKey:@"user_default_tip"];
    
    // Set userDefaults to picker
    [self.defaultTipPicker selectRow:value inComponent:0 animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    // Read from picker
    NSInteger selected = [self.defaultTipPicker selectedRowInComponent:0];
    // Set to userDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:selected forKey:@"user_default_tip"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 */

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_tipValues count];
}

#pragma mark Picker Data Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_tipValues objectAtIndex:row];
}

@end
