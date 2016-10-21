//
//  ViewController.m
//  SZLocation_Background
//
//  Created by Next on 16/10/21.
//  Copyright © 2016年 Next. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager * locationMananger;                  //位置管理器
@property (strong,nonatomic) CLGeocoder * coder;                                    //位置编码器

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationMananger requestAlwaysAuthorization];
        [self.locationMananger requestWhenInUseAuthorization];
//        [self.locationMananger requestLocation];
        
        if ([[UIDevice currentDevice].systemVersion floatValue]>= 9) {
            self.locationMananger.allowsBackgroundLocationUpdates = YES;
        }
        
        //开始定位用户位置
        [self.locationMananger startUpdatingLocation];
        self.locationMananger.distanceFilter =  kCLDistanceFilterNone;      //多少米定位一次
        self.locationMananger.desiredAccuracy = kCLLocationAccuracyBestForNavigation;       //确定精度_本次为最高精度
        
    } else {
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter and setter

- (CLLocationManager *)locationMananger {
    if (!_locationMananger) {
        _locationMananger = [[CLLocationManager alloc] init];
        _locationMananger.delegate = self;
    }
    return _locationMananger;
}

- (CLGeocoder *)coder {
    if (!_coder) {
        _coder = [[CLGeocoder alloc] init];
    }
    return _coder;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.coder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"\nlocations: %@ \n",placemarks);
    }];
}















@end
