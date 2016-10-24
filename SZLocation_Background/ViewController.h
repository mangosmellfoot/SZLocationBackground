//
//  ViewController.h
//  SZLocation_Background
//
//  Created by Next on 16/10/21.
//  Copyright © 2016年 Next. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

/**
 位置管理器
 */
@property (strong,nonatomic) CLLocationManager * locationMananger;

@end

