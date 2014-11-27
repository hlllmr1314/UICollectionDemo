//
//  ViewController.h
//  UICollectionDemo
//
//  Created by HuangLei on 11/27/14.
//  Copyright (c) 2014 HuangLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property IBOutlet UICollectionView *gridView;

@end

