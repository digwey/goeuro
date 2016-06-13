//
//  ViewController.m
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "ViewController.h"
#import "CityService.h"
@interface ViewController ()

@end

@implementation ViewController
CityService * cityService;
typedef enum {
    FromTextFieldSelected = 0,
    ToTextFieldSelected = 1
} SelectedField;

SelectedField *selectedField;

- (void)viewDidLoad {
    [super viewDidLoad];
    cityService = [[CityService alloc]initWithDelegate:self];
}

#pragma mark - Service Delegate
- (void)didReceiveDataSuccessfully:(id)data
{
    _cities = data;
    if(selectedField == FromTextFieldSelected)
    [UIView transitionWithView: _fromAutoCompleteTableView
                      duration: 0.35f
                       options: UIViewAnimationOptionTransitionFlipFromTop
                    animations: ^(void)
     {
         [_fromAutoCompleteTableView reloadData];
     }completion: nil];
    
    else
        [UIView transitionWithView: _toAutoCompleteTableView
                          duration: 0.35f
                           options: UIViewAnimationOptionTransitionFlipFromTop
                        animations: ^(void){
             [_toAutoCompleteTableView reloadData];
         }completion: nil];
    
}

#pragma mark - View Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_cities.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    City *city = [_cities.cities objectAtIndex:indexPath.row];
    NSString *cityLabel = [[NSString alloc] initWithFormat:@"%@ (%@)",city.name,city.country];
    
    cell.textLabel.text = cityLabel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(selectedField == FromTextFieldSelected){
        _fromTextField.text = [[_cities.cities objectAtIndex:indexPath.row] name];
        _fromAutoCompleteTableView.hidden = YES;
    }else{
        _toTextField.text = [[_cities.cities objectAtIndex:indexPath.row] name];
        _toAutoCompleteTableView.hidden = YES;
    }
}

#pragma mark - UITextField Delegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"Range:%@",NSStringFromRange(range));
    NSLog(@"%@",textField.text);
    NSString *passcode = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(textField == _fromTextField)
    {
        selectedField = FromTextFieldSelected;
        [cityService requestAllCitiesByName:passcode];
        _fromAutoCompleteTableView.hidden = NO;
    }
    else
    {
        selectedField = ToTextFieldSelected;
        [cityService requestAllCitiesByName:passcode];
        _toAutoCompleteTableView.hidden = NO;
    }
    return TRUE;
}
@end
