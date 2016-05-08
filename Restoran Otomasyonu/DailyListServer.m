//
//  DailyListServer.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 08/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "DailyListServer.h"

@implementation DailyListServer

-(instancetype)initWithDelegate:(id<DailyListServerDelegate>)delegate {

    if( self ) {
    
        self.delegate = delegate;
        [self sendRequestToAllDailyListDatas];
    }
    return self;
}


-(void)sendRequestToAllDailyListDatas{

    PFQuery *query = [PFQuery queryWithClassName:@"listele"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
      
        if( error ) {
        
            NSLog(@"There is an error == %@",error.description);
            NSLog(@"Error == -(void)sendRequestToAllDailyListDatas");
        
        } else {
        
            [self.delegate getDailyListObjectsFromServerClass:objects];
        
        }
        
    }];
    

}

@end
