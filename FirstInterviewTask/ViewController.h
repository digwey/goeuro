//
//  ViewController.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cities.h"
#import "BaseViewController.h"

@interface ViewController : BaseViewController

@property (nonatomic,strong) Cities *cities;

@property (weak, nonatomic) IBOutlet UITableView *fromAutoCompleteTableView;
@property (weak, nonatomic) IBOutlet UITextField *fromTextField;

@property (weak, nonatomic) IBOutlet UITableView *toAutoCompleteTableView;
@property (weak, nonatomic) IBOutlet UITextField *toTextField;
@end

