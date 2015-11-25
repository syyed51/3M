//
//  AppController.m
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import "AppController.h"
#import "Parser.h"

@interface AppController(){
@private
    Parser* parser;
    NSArray* courses;
}

@end

@implementation AppController
#pragma mark -
#pragma mark Initilization methods.
- (id) init
{
    self = [super init];
    if (self) {
        parser = [[Parser alloc]init];
        courses = [Parser parse];
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

-(NSArray*)getCourses{
    return courses;
}

@end
