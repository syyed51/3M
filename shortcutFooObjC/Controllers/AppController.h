//
//  AppController.h
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject
+ (id)sharedController;
-(NSArray*)getCourses;
@end
