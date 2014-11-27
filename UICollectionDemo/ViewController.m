//
//  ViewController.m
//  UICollectionDemo
//
//  Created by HuangLei on 11/27/14.
//  Copyright (c) 2014 HuangLei. All rights reserved.
//

#import "ViewController.h"
#import "SimpleCollectionCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.gridView registerClass:[SimpleCollectionCell class] forCellWithReuseIdentifier:@"SimpleCollectionCell"];
    
    //以下几个方法很受欢迎
//    -registerClass:forCellWithReuseIdentifier:
//    -registerClass:forSupplementaryViewOfKind:withReuseIdentifier:
//    -registerNib:forCellWithReuseIdentifier:
//    -registerNib:forSupplementaryViewOfKind:withReuseIdentifier:
    
    UINib *cellNib = [UINib nibWithNibName:@"SimpleCollectionCell" bundle:nil];
    [self.gridView registerNib:cellNib forCellWithReuseIdentifier:@"SimpleCollectionCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  2;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section ==0){
         return 6;
    }else{
        return 5;
    }
}

- (void)registerClass:(Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier{
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *rv = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];

    return rv;
}

//返回要显示的cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *kCellID = @"SimpleCollectionCell";
    SimpleCollectionCell *cell = (SimpleCollectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
//    if(cell == nil){
//        cell = [[SimpleCollectionCell alloc] initWithFrame:CGRectMake(0, 0, 108, 108)];
//    }
    
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    [cell.label setText:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    return cell;
}

//UICollectionView的cell的size大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 80);
}

//设置每组的cell的边界
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

//cell反选时被调用(多选时才生效)
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
