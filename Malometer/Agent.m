//
//  Agent.m
//  Malometer
//
//  Created by Pablo González Thuillier on 30/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "Agent.h"


@implementation Agent

@dynamic destructionPower;
@dynamic motivation;
@dynamic name;
@dynamic assessment;

- (NSNumber *)assessment{
    NSNumber *destructionP = [NSNumber numberWithDouble:[self.destructionPower doubleValue]/2.0];
    NSNumber *motivation = [NSNumber numberWithDouble:[self.motivation doubleValue]/2.0];
    return  [NSNumber numberWithDouble:([destructionP doubleValue] + [motivation doubleValue])];
}

//- (void)setDestructionPower:(NSNumber *)destructionPower{
//    [self willChangeValueForKey:@"assessment"];
//    [self setPrimitiveValue:destructionPower forKey:@"destructionPower"];
//    
//}
//
//- (void)setMotivation:(NSNumber *)motivation{
//    [self willChangeValueForKey:@"assessment"];
//    [self setPrimitiveValue:motivation forKey:@"motivation"];
//    
//}

+ (NSSet *)keyPathsForValuesAffectingAssessment{
    NSArray *array = @[@"destructionPower",@"motivation"];
    return [NSSet setWithArray:array];
}

@end
