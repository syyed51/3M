//
//  AppController.h
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import <Foundation/Foundation.h>
@class Course;
@interface AppController : NSObject
+ (id)sharedController;
-(NSArray*)getCourses;
-(NSArray*)getLevelsCourse:(Course*)course;
@end
