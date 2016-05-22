//
//  BaseViewController.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



-(void)showAlertWithTitle:(NSString*)alertTitle andDescription:(NSString*)alertDescription{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertDescription preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Tamam" style:UIAlertActionStyleDefault handler:nil];
    
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:true completion:nil];

}

-(IBAction)backButtonPressed:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}


@end
