//
//  DismissProtocol.h
//  Malometer
//
//  Created by Pablo González Thuillier on 30/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DetailViewController;

@protocol DismissProtocol <NSObject>

- (void)detailsViewController:(DetailViewController *)viewController modifiedData:(BOOL)modified;

@end
