//
//  AppController.m
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import "AppController.h"

@implementation AppController
#pragma mark -
#pragma mark Initilization methods.
- (id) init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (id)sharedController{
    static AppController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppController alloc] init];
    });
    
    return sharedInstance;
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
@end
