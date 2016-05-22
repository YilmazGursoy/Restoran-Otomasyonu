//
//  LoginServer.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "LoginServer.h"

@implementation LoginServer

-(instancetype)initWithDelegate:(id<LoginServerProtocol>)delegate {

    if( self ) {
    
        self.delegate = delegate;
        
    }
    
    return self;
    
}

-(void)sendLoginRequestWithUsername:(NSString*)userName andPassword:(NSString*)password {

    
    [PFUser logInWithUsernameInBackground:userName password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
       
        if( error ) {
            NSLog(@"-(void)sendLoginRequestWithUsername:(NSString*)userName andPassword:(NSString*)password");
            NSLog(@"Error = %@",error.description);
            [self.delegate requestAnswer:false];
            
        } else {
        
            [self.delegate requestAnswer:true];
        
        }
        
    }];

}


@end
