//
//  ViewController.m
//  test
//
//  Created by wuwei on 2019/8/4.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTWebviewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    if(!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        [cell layoutTableViewCell];
        cell.delegate = self;
    }
//    cell.textLabel.text = [NSString stringWithFormat: @"主标题 - %@", @(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";
//    cell.imageView.image = [UIImage imageNamed:@"./icon.bundle/page@2x.png"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTWebviewController *controller = [[GTWebviewController alloc] init];
    controller.view.backgroundColor = [UIColor redColor];
    controller.title = [NSString stringWithFormat: @"%@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}
- (void) tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    NSLog(@"click delete");
}

@end

