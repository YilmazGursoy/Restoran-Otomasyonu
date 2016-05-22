//
//  DeskInsideTableViewCell.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductObject.h"
#import "OrderHelper.h"

@interface DeskInsideTableViewCell : UITableViewCell < UITextFieldDelegate, OrderHelperDelegate >

+(DeskInsideTableViewCell*)cellForTableView:(UITableView*)tableView;

-(void)setupCellWithProductObject:(ProductObject*)productObject andDeskNumber:(int)deskNumber;
@end
