//
//  Server.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Server : NSObject

+(NSString*)getUsername;

+(void)userLogOut;


@end
