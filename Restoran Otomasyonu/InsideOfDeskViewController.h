//
//  InsideOfDeskViewController.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CategoryHelper.h"
#import "ProductHelper.h"

@interface InsideOfDeskViewController : BaseViewController < UITableViewDelegate, UITableViewDataSource, CategoryHelperDelegate, ProductHelperDelegate >


-(instancetype)initWithDeskNumber:(int)deskNumber;

@end
