//
//  LoginServer.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Server.h"

@protocol LoginServerProtocol <NSObject>

-(void)requestAnswer:(BOOL)isLogined;

@end


@interface LoginServer : Server < LoginServerProtocol >

@property (strong, nonatomic) id<LoginServerProtocol> delegate;

-(instancetype)initWithDelegate:(id<LoginServerProtocol>)delegate;

-(void)sendLoginRequestWithUsername:(NSString*)userName andPassword:(NSString*)password;

@end
