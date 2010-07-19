//
//  Website.h
//  YPassword
//
//  Created by Yann Esposito on 18/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Website :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSNumber * base64;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * passwordLength;
@property (nonatomic, retain) NSNumber * passwordNumber;

@end



