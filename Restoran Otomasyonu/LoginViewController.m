//
//  LoginViewController.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "LoginServer.h"

@interface LoginViewController () < UITextFieldDelegate , LoginServerProtocol >
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) LoginServer *loginServerObject;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.loginServerObject = [[LoginServer alloc] initWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    if ( self.usernameTextField.text.length == 0 || self.passwordTextField.text.length == 0 ) {
        
        [self showAlertWithTitle:@"Uyarı" andDescription:@"Lütfen sizden istenilen alanları boş bırakmayınız!"];
        
    } else {
        
        [self.loginServerObject sendLoginRequestWithUsername:self.usernameTextField.text andPassword:self.passwordTextField.text];
    
    }
    
}


#pragma mark - UITextFieldDelegate


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.usernameTextField resignFirstResponder];
    
    [self.passwordTextField resignFirstResponder];
    
    return true;
}


#pragma mark -- LoginServerProtocol Delegates


-(void)requestAnswer:(BOOL)isLogined {

    if( isLogined ) {
    
        MainViewController *MVC = [[MainViewController alloc] init];
        
        [self.navigationController pushViewController:MVC animated:true];
        
    
    } else {
    
        [self showAlertWithTitle:@"Hata" andDescription:@"Giriş Olmadı"];
    
    }

}


@end
