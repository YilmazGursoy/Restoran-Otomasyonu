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
    }
    return self;
}

-(void)sendDailyListObjectFromClientToParseBackend:(ListObject*)listObject {

    
    PFObject *newObject = [PFObject objectWithClassName:@"listele"];
    
    [newObject setObject:@(listObject.deskID) forKey:@"masaid"];
    
    [newObject setObject:@(listObject.totalPrice) forKey:@"tutar"];
    
    [newObject setObject:listObject.date forKey:@"tarih"];
    
    [newObject setObject:listObject.hour forKey:@"saat"];
    
    [newObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        if( error ) {
        
            NSLog(@"There is an Error");
        
        } else {
        
            NSLog(@"List Object creating Succeeded");
        
        }
        
    }];
    


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

-(void)deleteListParseBackendData{
    
    PFQuery *query = [PFQuery queryWithClassName:@"listele"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if( error ) {
            
            NSLog(@"There is an error == %@",error.description);
            NSLog(@"Error == -(void)deleteListParseBackendData");
            [self.delegate isDeletedAllDailyListDatas:false];
            
        } else {
            
            [self.delegate isDeletedAllDailyListDatas:true];
            
            for( PFObject *deletingObjects in objects ) {
                
                [deletingObjects deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                   
                    if( !error ) {
                        
                        NSLog(@"Deleting objects");
                    
                    }
                    
                }];
            
            }
            
        }
        
    }];

}

@end
