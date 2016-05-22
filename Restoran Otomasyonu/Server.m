//
//  Server.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Server.h"

@implementation Server

+(NSString*)getUsername {

    return [PFUser currentUser].username;

}

+(void)userLogOut {

    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
       
        if( error ) {
        
            NSLog(@"LogOut failed");
        
        } else {
        
            NSLog(@"Logout Succeeded");
        
        }
        
    }];
    
}

@end
