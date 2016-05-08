//
//  ViewController.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    
    [self.navigationController pushViewController:loginVC animated:true];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)getAllCategoriesObject:(NSArray *)insideCategories{

    NSLog(@"Hellllll Yeahhhhhhhhh");

}

@end
